(define-module (here teco)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages ncurses)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix licenses)
  #:use-module (guix packages))

;;
;; Commentary
;;

;; guix build -L ./packages teco -K

(define-public teco
  (package 
   (name "teco")
   (version "0.0.72-b0a1")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/glisze/teco.git")
		  (commit "deploy/v0.0.72-b0a1")))
	    (sha256
	     (base32
	    "1kmnyy687dzyk1zbilgfwnanhjfgnzdpcrzh6ycxc4j6ndvsmsan"))))
   (build-system gnu-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (replace 'bootstrap
			      (lambda _
				(for-each (lambda (file)
					    (patch-shebang file))
					  (find-files "./scripts/"))
				(invoke "sh" "-c" "echo 0.0.72-b0a1 > ./VERSION")
				(invoke "sh" "-c" "touch ./ChangeLog")
				(invoke "sh" "-c" "sed NEWS.in -e 1s,@VERSION[@],$( cat ./VERSION ), > NEWS")		
				(invoke "sh" "-c" "autoreconf -vif"))))))
   (inputs
    `(("ncurses" ,ncurses)))
   (native-inputs
    `(("autoconf" ,autoconf)
      ("automake" ,automake)
      ("perl" ,perl)
      ("git" ,git)
      ("texinfo" ,texinfo)
      ("pkg-config" ,pkg-config)))
   (synopsis "teco:  the Text Editor and COrrector program")
   (description
    "From the ibiblio archive of the TECOC-146 program.\n This, here, now has only the minimal changes to make it compile.\n Also, a package definition for Guix is within packages/here/. This, in fact, is the current object of this here.")
   (home-page "https://glisze.github.com/teco")
   (license gpl3+)))


