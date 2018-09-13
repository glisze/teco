(define-module (here hithere)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages texinfo)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix licenses)
  #:use-module (guix packages))

;;
;; Commentary
;;

;; guix build -L ./ hithere -K

(define-public hithere
  (package 
   (name "hithere")
   (version "0.0-alpha")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/glisze/hithere.git")
		  (commit "release/v0.0")))
	    (sha256
	     (base32
	    "0j9rmh0xm75f8z84pfbl64p2frfp509xhamrr3q77sbgn78ib575"))))
   (build-system gnu-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (replace 'bootstrap
			      (lambda _
				(for-each (lambda (file)
					    (patch-shebang file))
					  (find-files "./scripts/"))
				(invoke "sh" "-c" "echo 0.0-alpha > ./VERSION")
				(invoke "sh" "-c" "touch ./ChangeLog")
				(invoke "sh" "-c" "sed NEWS.in -e 1s,@disttag@,$( cat ./VERSION ), > NEWS")		
				(invoke "sh" "-c" "autoreconf -vif"))))))
   (native-inputs
    `(("autoconf" ,autoconf)
      ("automake" ,automake)
      ("perl" ,perl)
      ("git" ,git)
      ("texinfo" ,texinfo)))
   (synopsis "hithere: aclocal, autoconf, autoheader, automake, autotest")
   (description
    "This is from the GNU autotools manual. This exercises these tools.
Dealing with producing a standard distribution.
This is experimental, only. The aim is to find proper procedures.")
   (home-page "https://some.where.there")
   (license gpl3+)))


