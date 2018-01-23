From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] drm/tegra: Add Tegra186 display hub support
Date: Tue, 23 Jan 2018 11:34:35 +0300
Message-ID: <20180123083434.GD10091@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Thierry Reding,

This is a semi-automatic email about new static checker warnings.

The patch c4755fb9064f: "drm/tegra: Add Tegra186 display hub support" 
from Nov 13, 2017, leads to the following Smatch complaint:

    drivers/gpu/drm/tegra/hub.c:375 tegra_shared_plane_atomic_disable()
    warn: variable dereferenced before check 'old_state' (see line 370)

drivers/gpu/drm/tegra/hub.c
   369	{
   370		struct tegra_dc *dc = to_tegra_dc(old_state->crtc);
                                                  ^^^^^^^^^^^^^^^
Deref

   371		struct tegra_plane *p = to_tegra_plane(plane);
   372		u32 value;
   373	
   374		/* rien ne va plus */
   375		if (!old_state || !old_state->crtc)
                     ^^^^^^^^^
Check too late.

   376			return;
   377	

regards,
dan carpenter
