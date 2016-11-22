From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 0/2] pinctrl: tegra: Add support for IO pad control
Date: Tue, 22 Nov 2016 15:50:11 +0530
Message-ID: <1479810013-29894-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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

---
Changes from V1: 
- use the regulator framework to get the IO voltage instead of table from
  DT. The regulator handle is provided from DT. 

Changes from V2: 
- Nit fixes and variable/allocation optimisation as per review comment from
  V2.

Laxman Dewangan (2):
  pinctrl: tegra: Add DT binding for io pads control
  pinctrl: tegra: Add driver to configure voltage and power of io pads

 .../bindings/pinctrl/nvidia,tegra-io-pad.txt       | 126 +++++
 drivers/pinctrl/tegra/Kconfig                      |  12 +
 drivers/pinctrl/tegra/Makefile                     |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c       | 530 +++++++++++++++++++++
 4 files changed, 669 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c

-- 
2.1.4
