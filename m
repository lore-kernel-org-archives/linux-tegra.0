From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 03/10] soc/tegra: Changes for v5.7-rc1
Date: Fri, 13 Mar 2020 17:58:41 +0100
Message-ID: <20200313165848.2915133-3-thierry.reding@gmail.com>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200313165848.2915133-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-soc

for you to fetch changes up to 4825f5354ef2e3f6bce61d0ed652a23daf379f8e:

  soc/tegra: pmc: Cleanup whitespace usage (2020-03-13 10:53:10 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.7-rc1

These changes implement various clocks that are controlled by the PMC
and add support for configuring the voltage level of some pins (needed
for example to support high-speed modes on the SD/MMC interfaces).

----------------------------------------------------------------
JC Kuo (1):
      dt-bindings: phy: tegra: Add Tegra194 support

Nagarjuna Kristam (2):
      dt-bindings: phy: tegra-xusb: Add usb-role-switch
      dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding

Sowjanya Komatineni (6):
      dt-bindings: clock: tegra: Add IDs for OSC clocks
      dt-bindings: tegra: Convert Tegra PMC bindings to YAML
      dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
      dt-bindings: soc: tegra-pmc: Add ID for Tegra PMC 32 kHz blink clock
      soc/tegra: Add Tegra PMC clocks registration into PMC driver
      soc/tegra: Add support for 32 kHz blink clock

Thierry Reding (2):
      Merge branch 'for-5.7/dt-bindings' into for-5.7/soc
      soc/tegra: pmc: Cleanup whitespace usage

Venkat Reddy Talla (1):
      soc/tegra: pmc: Add pins for Tegra194

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 ---------
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 354 +++++++++++
 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   |  24 +
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 190 ++++++
 drivers/soc/tegra/pmc.c                            | 688 ++++++++++++++++-----
 include/dt-bindings/clock/tegra114-car.h           |   4 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   4 +-
 include/dt-bindings/clock/tegra210-car.h           |   4 +-
 include/dt-bindings/clock/tegra30-car.h            |   4 +-
 include/dt-bindings/soc/tegra-pmc.h                |  16 +
 include/soc/tegra/pmc.h                            |   3 +-
 11 files changed, 1125 insertions(+), 466 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h
