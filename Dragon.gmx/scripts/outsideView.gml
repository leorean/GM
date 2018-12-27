/*return !in(bbox_, view_xview, view_xview + view_wview)
    || !in(y, view_yview, view_yview + view_hview);*/
    
if (bbox_left > view_xview + view_wview) return true;
if (bbox_top > view_yview + view_hview) return true;
if (bbox_right < view_xview) return true;
if (bbox_bottom < view_yview) return true;
return false;
