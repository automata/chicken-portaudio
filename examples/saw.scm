(include "portaudio")

(define sample-rate 44100)

(pa-initialize)

(pa-open-default-stream &stream
                        0
                        2
                        paFloat32
                        sample-rate
                        256
                        callback-function
                        &data)