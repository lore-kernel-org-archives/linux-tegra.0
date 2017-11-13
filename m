From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] drm/tegra: dc: Simplify atomic plane helper functions
Date: Mon, 13 Nov 2017 14:43:18 +0300
Message-ID: <20171113113023.tc2b4nowb4ygbxp5@mwanda>
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

The patch a4bfa0961c4b: "drm/tegra: dc: Simplify atomic plane helper 
functions" from Aug 30, 2017, leads to the following Smatch complaint:

    drivers/gpu/drm/tegra/dc.c:562 tegra_plane_atomic_disable()
     warn: variable dereferenced before check 'old_state' (see line 556)

drivers/gpu/drm/tegra/dc.c
   555	{
   556		struct tegra_dc *dc = to_tegra_dc(old_state->crtc);
                                                  ^^^^^^^^^^^^^^^
Patch adds dereference

   557		struct tegra_plane *p = to_tegra_plane(plane);
   558		unsigned long flags;
   559		u32 value;
   560	
   561		/* rien ne va plus */
                   ^^^^^^^^^^^^^^^
Patch adds some culture which the kernel was sorely in need of.

   562		if (!old_state || !old_state->crtc)
                     ^^^^^^^^^
Patch adds check

   563			return;
   564	

regards,
dan carpenter
