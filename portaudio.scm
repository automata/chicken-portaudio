(module portaudio

(get-version get-error-text initialize terminate get-host-api-count get-default-host-api
 get-host-api-info get-default-input-device open-stream open-default-stream)

(import chicken scheme foreign)

(foreign-declare "#include <portaudio.h>")

(define get-version
  (foreign-lambda integer "Pa_GetVersion"))

(define-foreign-type
  error
  integer)

(define get-error-text
  (foreign-lambda (const c-string) "Pa_GetErrorText" error))

(define initialize
  (foreign-lambda error "Pa_Initialize"))

(define terminate
  (foreign-lambda error "Pa_Terminate"))

(define-foreign-type 
  device-index 
  integer)

(define-foreign-type 
  host-api-index 
  integer)

(define get-host-api-count
  (foreign-lambda host-api-index "Pa_GetHostApiCount"))

(define get-default-host-api
  (foreign-lambda host-api-index "Pa_GetDefaultHostApi"))

(define-foreign-type
  host-api-info
  (c-pointer "PaHostApiInfo"))

(define get-host-api-info
  (foreign-lambda (const host-api-info) "Pa_GetHostApiInfo" host-api-index))

(define get-default-input-device
  (foreign-lambda device-index "Pa_GetDefaultInputDevice"))

(define-foreign-type
  stream
  void)

(define-foreign-type
  stream-parameters
  (c-pointer "PaStreamParameters"))

(define-foreign-type
  stream-flags
  unsigned-long)

(define-foreign-type
  sample-format
  unsigned-long)

(define open-stream
  (foreign-lambda error "Pa_OpenStream"
                  (c-pointer stream)
                  (const stream-parameters)
                  (const stream-parameters)
                  double
                  unsigned-long
                  stream-flags
                  (c-pointer "PaStreamCallback")
                  (c-pointer void)))

(define open-default-stream
  (foreign-lambda error "Pa_OpenDefaultStream"
                  (c-pointer stream)
                  integer
                  integer
                  sample-format
                  double
                  unsigned-long
                  (c-pointer "PaStreamCallback")
                  (c-pointer void)))


)