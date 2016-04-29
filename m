From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] dt-bindings: gpio: tegra: Add Tegra186 support
Date: Fri, 29 Apr 2016 18:21:07 +0200
Message-ID: <1461946869-26124-2-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM-SoC maintainers,

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.7-gpio

for you to fetch changes up to ec6b925579b40225d58f0374ada0e40a003cde16:

  ARM: tegra: Add DT binding for Tegra186 GPIO controllers (2016-04-22 13:32:29 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: gpio: tegra: Add Tegra186 support

Adds device tree bindings for the GPIO and AON controllers found on the
Tegra186 SoC.

----------------------------------------------------------------
Stephen Warren (2):
      ARM: tegra: Fix naming in GPIO DT binding header
      ARM: tegra: Add DT binding for Tegra186 GPIO controllers

 .../bindings/gpio/nvidia,tegra186-gpio.txt         | 161 +++++++++++++++++++++
 include/dt-bindings/gpio/tegra-gpio.h              |  68 ++++-----
 include/dt-bindings/gpio/tegra186-gpio.h           |  56 +++++++
 3 files changed, 251 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
 create mode 100644 include/dt-bindings/gpio/tegra186-gpio.h
