From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] drm/tegra: Use standard suffix for hotplug detect GPIO property
Date: Thu, 17 Apr 2014 14:02:58 +0200
Message-ID: <1397736181-1593-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The hotplug detect GPIO in the current bindings use "-gpio" as suffix,
whereas the standard suffix is the plural: "-gpios". This small series
replaces this in three steps to preserve bisectability:

  - Patch 1 adds new nvidia,hpd-gpios properties to existing device tree
    files while marking existing nvidia,hpd-gpio ones as deprecated.
  - Patch 2 makes use of the new property name in the driver and updates
    the device tree bindings.
  - Patch 3 removes the deprecated properties from device tree files.

Since this touches both DRM and Tegra trees, I've prepared a stable
branch[0] that can be pulled into both trees to make the transition
easier.

Thierry

[0]: git://anongit.freedesktop.org/tegra/linux#drm/tegra/hpd-gpios-property

Thierry Reding (3):
  ARM: tegra: Deprecate nvidia,hpd-gpio property
  drm/tegra: Use nvidia,hpd-gpios property
  ARM: tegra: Remove deprecated nvidia,hpd-gpio properties

 Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt | 8 ++++----
 arch/arm/boot/dts/tegra114-dalmore.dts                          | 2 +-
 arch/arm/boot/dts/tegra20-colibri-512.dtsi                      | 4 ++--
 arch/arm/boot/dts/tegra20-harmony.dts                           | 4 ++--
 arch/arm/boot/dts/tegra20-paz00.dts                             | 4 ++--
 arch/arm/boot/dts/tegra20-seaboard.dts                          | 4 ++--
 arch/arm/boot/dts/tegra20-tamonten.dtsi                         | 4 ++--
 arch/arm/boot/dts/tegra20-trimslice.dts                         | 4 ++--
 arch/arm/boot/dts/tegra20-ventana.dts                           | 4 ++--
 arch/arm/boot/dts/tegra20-whistler.dts                          | 4 ++--
 arch/arm/boot/dts/tegra30-beaver.dts                            | 2 +-
 drivers/gpu/drm/tegra/output.c                                  | 2 +-
 12 files changed, 23 insertions(+), 23 deletions(-)

-- 
1.9.2
