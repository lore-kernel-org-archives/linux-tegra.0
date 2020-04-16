From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/2] Support DRM bridges on NVIDIA Tegra
Date: Thu, 16 Apr 2020 20:24:03 +0300
Message-ID: <20200416172405.5051-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This small series adds initial support for the DRM bridges to NVIDIA Tegra
DRM driver. This is required by newer device-trees where we model the LVDS
encoder bridge properly.

Changelog:

v3: - Following recommendation from Sam Ravnborg, the new bridge attachment
      model is now being used, i.e. we ask bridge to *not* create a connector
      using the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

    - The bridge is now created only for the RGB (LVDS) output, and only
      when necessary. For now we don't need bridges for HDMI or DSI outputs.

    - I noticed that we're leaking OF node in the panel's error code path,
      this is fixed now by the new patch "Don't leak OF node on error".

v2: - Added the new "rgb: Don't register connector if bridge is used"
      patch, which hides the unused connector provided by the Tegra DRM
      driver when bridge is used, since bridge provides its own connector
      to us.

    - Please notice that the first "Support DRM bridges" patch was previously
      sent out as a standalone v1 change.


Dmitry Osipenko (2):
  drm/tegra: output: Don't leak OF node on error
  drm/tegra: output: rgb: Support LVDS encoder bridge

 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 19 ++++++++++++++-----
 drivers/gpu/drm/tegra/rgb.c    | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 5 deletions(-)

-- 
2.26.0
