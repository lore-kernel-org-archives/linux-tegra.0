From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] drm/nouveau: platform devices and GK20A
	probing
Date: Mon, 19 May 2014 18:24:05 +0900
Message-ID: <1400491450-19223-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch series is the final (?) step towards the initial support of GK20A,
allowing it to be probed and used (currently at a very slow speed, and for
offscreen rendering only) on the Jetson TK1 and Venice 2 boards.

The main piece if the first patch which adds platform devices probing support
to Nouveau. There are probably lots of things that need to be discussed about
it, e.g.:

* The way the DRM device is created, especially with respect to the ongoing
  changes to the DRM framework,
* The fact that the same drm_driver instance is used for the PCI and platform
  drivers,
* Whether we should have only one platform driver capable of probing all
  platform devices, or one driver per GPU (in this case, where should all these
  drivers reside?)

So there are still some rough edges, but we are getting there. :)

The first patch should go through the Nouveau tree, while the 4 others are
rather intended for Tegra.

Alexandre Courbot (3):
  drm/nouveau: support for probing platform devices
  ARM: tegra: of: add GK20A device tree binding
  ARM: tegra: jetson-tk1: enable GK20A GPU

Thierry Reding (2):
  ARM: tegra: add GK20A GPU to Tegra124 DT
  ARM: tegra: venice2: enable GK20A GPU

 .../devicetree/bindings/gpu/nvidia,gk20a.txt       |  45 +++++
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   8 +-
 arch/arm/boot/dts/tegra124-venice2.dts             |   8 +-
 arch/arm/boot/dts/tegra124.dtsi                    |  15 ++
 drivers/gpu/drm/nouveau/Kconfig                    |   8 +
 drivers/gpu/drm/nouveau/Makefile                   |   3 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  33 ++--
 drivers/gpu/drm/nouveau/nouveau_drm.h              |  21 +++
 drivers/gpu/drm/nouveau/nouveau_platform.c         | 191 +++++++++++++++++++++
 9 files changed, 315 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_platform.c

-- 
1.9.2
