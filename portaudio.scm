(import chicken scheme foreign)

(declare (foreign-declare "#include \"portaudio.h\""))

(define pa-get-version
  (foreign-lambda integer "Pa_GetVersion"))

(define-foreign-type
  pa-error
  integer)

(define pa-get-error-text
  (foreign-lambda (const c-string) "Pa_GetErrorText" pa-error))

(define pa-initialize
  (foreign-lambda pa-error "Pa_Initialize"))

(define pa-terminate
  (foreign-lambda pa-error "Pa_Terminate"))

(define-foreign-type 
  pa-device-index 
  integer)

(define-foreign-type 
  pa-host-api-index 
  integer)

(define pa-get-host-api-count
  (foreign-lambda pa-host-api-index "Pa_GetHostApiCount"))

(define pa-get-default-host-api
  (foreign-lambda pa-host-api-index "Pa_GetDefaultHostApi"))

(define-foreign-type
  pa-host-api-info
  (c-pointer "PaHostApiInfo"))

(define pa-get-host-api-info
  (foreign-lambda (const pa-host-api-info) "Pa_GetHostApiInfo" pa-host-api-index))

(define pa-get-default-input-device
  (foreign-lambda pa-device-index "Pa_GetDefaultInputDevice"))

(define-foreign-type
  pa-stream
  void)

(define-foreign-type
  pa-stream-parameters
  (c-pointer "PaStreamParameters"))

(define-foreign-type
  pa-stream-flags
  unsigned-long)

(define-foreign-type
  pa-sample-format
  unsigned-long)

(define pa-open-stream
  (foreign-lambda pa-error "Pa_OpenStream"
                  (c-pointer pa-stream)
                  (const pa-stream-parameters)
                  (const pa-stream-parameters)
                  double
                  unsigned-long
                  pa-stream-flags
                  (c-pointer "PaStreamCallback")
                  (c-pointer void)))

(define pa-open-default-stream
  (foreign-lambda pa-error "Pa_OpenDefaultStream"
                  (c-pointer pa-stream)
                  integer
                  integer
                  pa-sample-format
                  double
                  unsigned-long
                  (c-pointer "PaStreamCallback")
                  (c-pointer void)))

