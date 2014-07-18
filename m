From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v2 0/4] ARM: dts: exynos: Prepare Spring
Date: Fri, 18 Jul 2014 19:20:05 +0200
Message-ID: <1405704009-8430-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephan van Schaik <stephan-zGZ7W/ttz6xN8Ch2cx6nig@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

Based on the preinstalled 3.8 based ChromeOS kernel and previous 3.15=20
based attempts by Stephan and me that broke for 3.16, I've prepared a=20
device tree for the HP Chromebook 11 aka Google Spring.

v2 reuses the new cros-ec-keyboard.dtsi and retires exynos5250-cros-com=
mon.dtsi.
It drops the timings subnode from dp-controller in expectation of the n=
ew
drm eDP bridge framework, which needs it under a different node.
The built-in MMC is now usable, its node had been inherited as "disable=
d".

Not yet enabled are trackpad, Wifi and sound.

Now depends on a Tegra branch (pull pending):
http://git.kernel.org/cgit/linux/kernel/git/tegra/linux.git/log/?h=3Dfo=
r-3.17/dt-cros-ec-kbd
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

My rebasing branch for testing is here:
https://github.com/afaerber/linux/commits/spring-next

Regards,
Andreas

v1 -> v2:
* Dropped 3 documentation patches from series:
  2 picked up,
  https://patchwork.kernel.org/patch/4397271/
  https://patchwork.kernel.org/patch/4397291/
  1 already sent separately as v2, pending.
  https://patchwork.kernel.org/patch/4424881/
* Minimized and beautified Spring device tree and to some degree Snow a=
s well.
  See individual patches.

Andreas F=C3=A4rber (4):
  ARM: dts: exynos5250: max77686 is Snow only
  ARM: dts: exynos5250: cypress,cyapa trackpad is Snow only
  ARM: dts: exynos5250: Fold common ChromeOS parts into Snow
  ARM: dts: exynos5250: Add Spring device tree

 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/exynos5250-cros-common.dtsi | 323 -----------------
 arch/arm/boot/dts/exynos5250-snow.dts         | 334 ++++++++++++++++--
 arch/arm/boot/dts/exynos5250-spring.dts       | 485 ++++++++++++++++++=
++++++++
 4 files changed, 799 insertions(+), 344 deletions(-)
 delete mode 100644 arch/arm/boot/dts/exynos5250-cros-common.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5250-spring.dts

--=20
1.9.3
