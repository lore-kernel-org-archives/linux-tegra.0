From: Aapo Vienamo <avienamo@nvidia.com>
Subject: [PATCH v4 0/7] Tegra PMC pinctrl pad configuration
Date: Thu, 19 Jul 2018 15:30:27 +0300
Message-ID: <1532003434-8844-1-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: Aapo Vienamo <avienamo@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi all,

The Tegra Power Management Controller (PMC) can set pad power states
and voltage configuration. This series implements pinctrl interfaces
for configuring said pad properties.

Changelog
v4:
	- Revise the dt-bindings docs
v3:
	- Don't expose tegra_io_pad_is_powered()
	- Remove tegra_io_pad_set_voltage() stub from pmc.h
		- Fixes i386 build failure reported by kbuild test robot
v2:
	- Add Tegra186 AO_HV pad
	- Make the IO pad tables narrower
	- Add parens to TEGRA_IO_PAD() and TEGRA_IO_PIN_DESC()
	- Fix a typo in the dt-bindings docs
	- Remove old pmc pad voltage configuration APIs
	- Check return value of tegra_io_pad_find() in
	  tegra_io_pad_pinconf_get()/_set()

Aapo Vienamo (7):
  soc/tegra: pmc: Fix pad voltage configuration for Tegra186
  soc/tegra: pmc: Factor out DPD register bit calculation
  soc/tegra: pmc: Implement tegra_io_pad_is_powered()
  soc/tegra: pmc: Use X macro to generate IO pad tables
  dt-bindings: Add Tegra PMC pad configuration bindings
  soc/tegra: pmc: Remove public pad voltage APIs
  soc/tegra: pmc: Implement pad configuration via pinctrl

 .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |  92 ++++
 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 103 +++++
 drivers/soc/tegra/pmc.c                            | 512 +++++++++++++++------
 include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h |  18 +
 include/soc/tegra/pmc.h                            |  20 +-
 5 files changed, 597 insertions(+), 148 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h

-- 
2.7.4
