#ifdef SWIG
%module pyquasirand
%{
    #include <gsl/gsl_qrng.h>
    #include <numpy/arrayobject.h>
%}
%init %{
    import_array();
%}

%typemap(in) gsl_qrng_type* {
    $1 = NULL;
    char* str = PyString_AsString($input);
    if(strcmp(str, "niederreiter") == 0)    $1 = gsl_qrng_niederreiter_2;
    if(strcmp(str, "sobol"       ) == 0)    $1 = gsl_qrng_sobol;
    if(strcmp(str, "halton"      ) == 0)    $1 = gsl_qrng_halton;
    if(strcmp(str, "reverse_halton") == 0)  $1 = gsl_qrng_reversehalton;
}

%typemap(in) int {
    $1 = (int) PyInt_AsLong($input);
}

%inline{
    PyObject* generate(int ndims, int npoints, gsl_qrng_type* gen_type){
        if(gen_type == NULL){
            PyErr_SetString(PyExc_ValueError, "invalid generator type was specified\n"
                                                    "Possible values are:\n"
                                                    "  \"niederreiter\"\n"
                                                    "  \"sobol\"\n"
                                                    "  \"halton\"\n"
                                                    "  \"reverse_halton\"");
            goto error;
        }
        if(ndims <= 0){
            PyErr_SetString(PyExc_ValueError, "ndims must be positive");
            goto error;
        }
        if(npoints < 0){
            PyErr_SetString(PyExc_ValueError, "npoints must be positive");
            goto error;
        }

        npy_intp dims[2];
        dims[0] = npoints;
        dims[1] = ndims;
        PyObject* result = PyArray_EMPTY(2, dims, NPY_DOUBLE, 0);
        if(npoints == 0)
            return result;
        double* buffer = (double*) PyArray_DATA(result);
        int i;
        gsl_qrng * q = gsl_qrng_alloc (gen_type, ndims);
        for (i = 0; i < npoints; i++) {
            gsl_qrng_get (q, buffer);
            buffer += ndims;
        }
        gsl_qrng_free (q);
        return result;
      error:
        return NULL;
    }
}
PyObject* generate(int ndims, int npoints, gsl_qrng_type* gen_type);

#endif