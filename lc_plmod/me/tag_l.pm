package me::tag_l;
use strict;

sub doit {
  my $lc_src;
  my $lc_dst;
  my $lc_x1;
  my $lc_x2;
  my $lc_sga;
  my $lc_sgb;
  $lc_src = $_[0];
  
  
  
  
  # FIRST ROUND: The texted links
  ($lc_dst,$lc_x1) = split(quotemeta('<lnk>'),$lc_src,2);
  $lc_src = $lc_x1;
  
  while ( $lc_src ne '' )
  {
    ($lc_x1,$lc_x2) = split(quotemeta('</lnk>'),$lc_src,2);
    if ( $lc_x1 ne '' )
    {
      ($lc_sga,$lc_sgb) = split(quotemeta('<l/>'),$lc_x1);
      $lc_dst .= '<a href = "' . $lc_sga . '" target = "_blank">';
      $lc_dst .= $lc_sgb . '</a>';
    }
    ($lc_x1,$lc_src) = split(quotemeta('<lnk>'),$lc_x2,2);
    $lc_dst .= $lc_x1;
  }
  
  
  # RESET CLAUSE:
  $lc_src = $lc_dst;
  
  
  # SECOND ROUND: The simple links
  ($lc_dst,$lc_x1) = split(quotemeta('<l>'),$lc_src,2);
  $lc_src = $lc_x1;
  
  while ( $lc_src ne '' )
  {
    ($lc_x1,$lc_x2) = split(quotemeta('</l>'),$lc_src,2);
    if ( $lc_x1 ne '' )
    {
      #$lc_dst .= '&#91;';
      $lc_dst .= '<a href = "' . $lc_x1 . '" target = "_blank">';
      $lc_dst .= $lc_x1 . '</a>';
      #$lc_dst .= '&#93;';
    }
    ($lc_x1,$lc_src) = split(quotemeta('<l>'),$lc_x2,2);
    $lc_dst .= $lc_x1;
  }
  
  # LET US RETURN:
  return $lc_dst;
}


1;
