#!/bin/sh

main() {

    cpan -T Log::Log4perl \
	HTTP::Date \
	YAML 
    cpan -T CPAN
    cpan -T Template \
	LWP::UserAgent \
	JSON \
	MIME::Lite \
	Text::Replace

    plenv rehash
}

main "$@"
exit $?
