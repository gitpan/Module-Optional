package Params::Validate::Dummy;

use strict;

BEGIN {
	use Exporter ();
	use vars qw ($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
	$VERSION     = 0.01;
	@ISA         = qw (Exporter);
	my %tags =
        ( types =>
          [ qw( SCALAR ARRAYREF HASHREF CODEREF GLOB GLOBREF
                SCALARREF HANDLE BOOLEAN UNDEF OBJECT ) ],
        );

	%EXPORT_TAGS = (
	all => [ qw( validate validate_pos validation_options validate_with ),
                     map { @{ $tags{$_} } } keys %tags ],
	%tags,
	);
	@EXPORT      = qw (validate validate_pos);
	@EXPORT_OK   = (@{ $EXPORT_TAGS{all} }, 'set_options' );
}

sub validate (\@$) {
    @{$_[0]};
}

sub validate_pos (\@@) {
    @{$_[0]};
}

sub validate_with {
    my %p = @_;

    $p{params};
}

sub validation_options {}
sub set_options {}


sub SCALAR    () { 1 }
sub ARRAYREF  () { 2 }
sub HASHREF   () { 4 }
sub CODEREF   () { 8 }
sub GLOB      () { 16 }
sub GLOBREF   () { 32 }
sub SCALARREF () { 64 }
sub UNKNOWN   () { 128 }
sub UNDEF     () { 256 }
sub OBJECT    () { 512 }
sub HANDLE    () { 16 | 32 }
sub BOOLEAN   () { 1 | 256 }

1;
