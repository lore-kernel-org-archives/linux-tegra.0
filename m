From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/2] pinctrl: tegra: Add support for IO pad control
Date: Wed, 2 Nov 2016 14:39:00 +0530
Message-ID: <1478077742-25437-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, swarren@wwwdotorg.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: jonathanh@nvidia.com, yamada.masahiro@socionext.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra124 and later SoCs support the multi-voltage level and
low power state of some of its IO pads. The IO pads can work in
the voltage of the 1.8V and 3.3V of IO power rail sources. When IO
interface are not used then IO pads can be configure in low power
state to reduce the power from that IO pads.

This series add the support of configuration of IO pad via pinctrl
framework. The io pad driver uses the tegra PMC interface.

---
This driver was sent earlier for review along with soc/tegra pmc
changes. During review, decided to first conclude in soc/tegra pmc
patches and then review this.
    
Thierry applied the pmc patches in the private tree
        https://github.com/thierryreding/linux/tree/tegra186
and he wanted to have the patches for user of the new APIs so that
it can be pushed to mainline.
    
Sending the pinctrl driver. This needs Ack/reviewed from pinctrl subsystem
i.e. Linus Welleij to apply in the Thierry's T186 branch along with
PMC patches.

Laxman Dewangan (2):
  pinctrl: tegra: Add DT binding for io pads control
  pinctrl: tegra: Add driver to configure voltage and power of io pads

 .../bindings/pinctrl/nvidia,tegra-io-pad.txt       | 112 +++++++
 drivers/pinctrl/tegra/Kconfig                      |  12 +
 drivers/pinctrl/tegra/Makefile                     |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c       | 369 +++++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h |  21 ++
 5 files changed, 515 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h

-- 
2.1.4
