#!/usr/bin/perl

use strict;
use warnings;

use JSON;
use LWP::Simple::REST qw/http_get/;
use Encode qw/ encode decode/;

my $correio_url = 'http://developers.agenciaideias.com.br/correios/rastreamento/json';

my @siglas = qw/AL AR AS CA CB CC CD CE CF CG CH 
                CI CJ CK CL CM CN CO CP CQ CR CS 
                CT CU CV CW CX CY CZ DA DB DC DD 
                DE DF DG DI DJ DK DL DM DN DO DP 
                DQ DR DS DT DU DV DX EA EB EC ED 
                EE EF EG EH EI EJ EK EL EM EN EO 
                EP EQ ER ES ET EU EV EW EX EY EZ 
                FA FE FF FH FM FR IA IC ID IE IF 
                II IK IM IN IP IR IS IT IU IX JA 
                JB JC JD JE JF JG JH JI JJ JK JL 
                JM JN JO JP JQ JR JS JT JV LA LB 
                LC LE LF LI LJ LK LM LN LP LS LV 
                LX LZ MA MB MC MD ME MF MK ML MM 
                MP MR MS MT MY MZ NE NX PA PB PC 
                PD PE PF PG PH PI PJ PK PL PR QQ 
                RA RB RC RD RE RF RG RH RI RJ RK 
                RL RM RN RO RP RQ RR RS RT RU RV 
                RW RX RY RZ SA SB SC SD SE SF SG 
                SH SI SJ SK SL SM SN SO SP SQ SR 
                SS ST SU SV SW SX SY SZ TC TE TS 
                VA VC VD VE VF VV XA XM XR XX/;

my $obj_numb = $ARGV[0];

if ( $obj_numb =~ m/\w{2}\d{9}\w{2}/ ){
    my $tracker = http_get( "$correio_url/$obj_numb", {} );
    
    if ( substr( $tracker, 0, 9 ) =~ m/<!DOCTYPE/ ){
        print "NENHUM OBJETO ENCONTRADO!\n";
    }
    else{
        $tracker = decode_json( $tracker );
        print "OBJETO ENCONTRADO!\n\n";
        for my $action ( @{ $tracker } ){
            print "Ação: " . encode( "utf8" , decode( "ISO-8859-1", $action->{ acao } ) ) . "\n";
            print "Data da Ação: " . encode( "utf8" , decode( "ISO-8859-1", $action->{ data } ) ) . "\n";
            print "Detalhes: " . encode( "utf8" , decode( "ISO-8859-1", $action->{ detalhes } ) ) . "\n";
            print "Localização: " . encode( "utf8" , decode( "ISO-8859-1", $action->{ local } ) ) . "\n\n";
        }
    }
}