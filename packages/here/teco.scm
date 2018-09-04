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

;; guix build -L ./ teco -K

(define-public teco
  (package 
   (name "teco")
   (version "0.0.53-8116")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/glisze/teco.git")
		  (commit "deploy/v0.0.53-8116")))
	    (sha256
	     (base32
	    "070js4vpcq9n39jb12dalj8sca3w206hasig705sp5dr16km5nv6"))))
   (build-system gnu-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (replace 'bootstrap
			      (lambda _
				(for-each (lambda (file)
					    (patch-shebang file))
					  (find-files "./scripts/"))
				(invoke "sh" "-c" "echo 0.0.53-8116 > ./VERSION")
				(invoke "sh" "-c" "touch ./ChangeLog")
				(invoke "sh" "-c" "sed NEWS.in -e 1s,@VERSION[@],$( cat ./VERSION ), > NEWS")		
				(invoke "sh" "-c" "autoreconf -vif"))))))
   (inputs
    '(("ncurses",ncurses)))
   (native-inputs
    `(("autoconf" ,autoconf)
      ("automake" ,automake)
      ("perl" ,perl)
      ("git" ,git)
      ("texinfo" ,texinfo)
      ("pkg-config",pkg-config)))
   (synopsis "teco: @SYNOPSIS@")
   (description
    "@DESCRIPTION@")
   (home-page "https://glisze.github.com/teco")
   (license gpl3+)))


