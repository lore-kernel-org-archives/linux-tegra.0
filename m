From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH V3 0/6] PCI: tegra: Enable PCIe C5 controller of Tegra194 in p2972-0000 platform
Date: Wed, 28 Aug 2019 22:58:44 +0530
Message-ID: <20190828172850.19871-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, andrew.murray@arm.com
Cc: kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

This patch series enables Tegra194's C5 controller which owns x16 slot in
p2972-0000 platform. C5 controller's PERST# and CLKREQ# are not configured as
output and bi-directional signals by default and hence they need to be
configured explicitly. Also, x16 slot's 3.3V and 12V supplies are controlled
through GPIOs and hence they need to be enabled through regulator framework.
This patch series adds required infrastructural support to address both the
aforementioned requirements.
Testing done on p2972-0000 platform
- Able to enumerate devices connected to x16 slot (owned by C5 controller)
- Enumerated device's functionality verified
- Suspend-Resume sequence is verified with device connected to x16 slot
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1567013340; bh=TvQY7ZhhxcvoKbpcEAh6qHqIQEasISWH+/X/STdQQk0=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 X-NVConfidentiality:MIME-Version:Content-Type;
	b=gVtBiB2IR+pKYaZJQ+f6BYQX23e2leD7q8vdf+vr0+12GlPQc/30oFhIDgzGmLr3W
	 81mgV2Pp3bLNf9oNOB7tnv+yjoJK+qPGAB0bQ+VPMKGOkpvVfFtN4K3D+TkNjEQnQc
	 eBs35Pzc7zQ3jso4y80hoeIGegqfu4qLvORCW3qsy7OuPxjELUpGKvJTozekRSZVw3
	 voa570Uvaiotu9UgYqdAyJe0S4iuNUmJ8eWJDZLb9zkj1gfWhuQaDxt6bOMK8pyr7e
	 SVhNP0p2cTOaV0ALtd16tvi7+vRmcV4uQeArl0l1XPwxwHkR6ShLYbyji3Zb+JxJGN
	 vrTsP917B385w==

V3:
* Addressed some more review comments from Andrew Murray and Thierry Reding

V2:
* Changed the order of patches in the series for easy merging
* Addressed review comments from Thierry Reding and Andrew Murray

Vidya Sagar (6):
  dt-bindings: PCI: tegra: Add sideband pins configuration entries
  dt-bindings: PCI: tegra: Add PCIe slot supplies regulator entries
  PCI: tegra: Add support to configure sideband pins
  PCI: tegra: Add support to enable slot regulators
  arm64: tegra: Add configuration for PCIe C5 sideband signals
  arm64: tegra: Add PCIe slot supply information in p2972-0000 platform

 .../bindings/pci/nvidia,tegra194-pcie.txt     | 16 ++++
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 24 +++++
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  4 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 38 +++++++-
 drivers/pci/controller/dwc/pcie-tegra194.c    | 94 ++++++++++++++++++-
 5 files changed, 172 insertions(+), 4 deletions(-)

-- 
2.17.1
