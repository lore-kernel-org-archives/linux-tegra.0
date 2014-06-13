From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/3] drm/nouveau: support for probing platform devices
Date: Fri, 13 Jun 2014 18:52:43 +0900
Message-ID: <1402653166-8441-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series adds support for probing platform devices on Nouveau, as well as
the DT bindings for GK20A. It doesn't enable the GPU yet on Tegra boards since
a few extra things need to be supported before that.

Thanks to the input received for v1, this version is more self-contained and
shares less stuff between nouveau_drm and nouveau_platform. The major change
is that nouveau_platform is now a module of its own. The main reason for this
is that it allows us to register/unregister the driver from the module init
functions instead of parasiting the ones of nouveau_drm. It also makes it
simpler to build Nouveau without platform support at all.

Changes since v1:
* Moved the platform device driver to its own module. This allows it to be more
  self-contained and saves us the need to export too many functions from
  nouveau_drm and nouveau_platform.
* Register the DRM device without using the platform helpers, which is made
  possible by drm_dev_set_unique(). This allows us to catch and register the
  DRM device during platform probe.
* Fixed the clock names in the DT bindings.
* Removed the patches enabling GK20A on Venice2 and Jetson TK1 as support
  is not complete yet.

Alexandre Courbot (2):
  drm/nouveau: support for probing platform devices
  ARM: tegra: of: add GK20A device tree binding

Thierry Reding (1):
  ARM: tegra: add GK20A GPU to Tegra124 DT

 .../devicetree/bindings/gpu/nvidia,gk20a.txt       |  43 +++++
 arch/arm/boot/dts/tegra124.dtsi                    |  15 ++
 drivers/gpu/drm/nouveau/Kconfig                    |   8 +
 drivers/gpu/drm/nouveau/Makefile                   |   3 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  56 +++++--
 drivers/gpu/drm/nouveau/nouveau_drm.h              |   3 +
 drivers/gpu/drm/nouveau/nouveau_platform.c         | 182 +++++++++++++++++++++
 7 files changed, 299 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_platform.c

-- 
2.0.0
