From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] drm/tegra: Sanitize format modifiers
Date: Mon, 27 Nov 2017 10:39:46 +0100
Message-ID: <20171127093948.20986-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi,

This series is preparatory work in order to enable format modifiers on
both Tegra and Nouveau drivers to allow drivers to exchange tiling mode
information. I also have the corresponding libdrm changes that I can
send out as soon as these patches have been merged.

Technically this breaks ABI, but these modifiers are not used anywhere
yet, except in libdrm's modetest where they are used to decode the
IN_FORMATS property. However, the Tegra DRM driver doesn't implement
the ->format_mod_supported() callback yet, so the modifiers are never
actually exposed.

I had discussed this with Daniel Vetter a little while back and he
thought this was okay. As suggested by him, I renamed the modifier
definitions for good measure to avoid clashing with the old
definitions in case they are used in test code somewhere.

Thierry

Thierry Reding (2):
  drm/fourcc: Fix fourcc_mod_code() definition
  drm/tegra: Sanitize format modifiers

 drivers/gpu/drm/tegra/fb.c    | 35 +++++++++++++++++++++++++++++------
 include/uapi/drm/drm_fourcc.h | 38 ++++++++++++++++++++------------------
 2 files changed, 49 insertions(+), 24 deletions(-)

-- 
2.15.0
