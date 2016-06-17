From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 0/4] Add support for Tegra210 ACONNECT bus
Date: Fri, 17 Jun 2016 13:40:30 +0100
Message-ID: <1466167234-8288-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add support for the ACONNECT bus which is part of the audio sub-system
on Tegra210.

Changes from V2:
- Updated ACONNECT DT binding documentation to really fix some items
  that should have been updated in V2 (thanks Rob).
- Made the ACONNECT driver tristate in the Kconfig seeing that it has
  a remove function (and verified it builds ok as a module).

Changes from V1:
- Updated ACONNECT DT binding documentation and DT binding per feedback
  from Rob H.
- Added patch to populate the audio power-domain which is needed to
  successfully build the DT blob (this was missed as it was part of
  my local testing tree).

Jon Hunter (4):
  dt-bindings: bus: Add documentation for Tegra210 ACONNECT
  bus: Add support for Tegra ACONNECT
  ARM64: tegra: Add audio PM domain device node for Tegra210
  arm64: tegra: Add ACONNECT bus node for Tegra210

 .../bindings/bus/nvidia,tegra210-aconnect.txt      |  45 ++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  21 ++++
 drivers/bus/Kconfig                                |   9 ++
 drivers/bus/Makefile                               |   1 +
 drivers/bus/tegra-aconnect.c                       | 113 +++++++++++++++++++++
 5 files changed, 189 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
 create mode 100644 drivers/bus/tegra-aconnect.c

-- 
2.1.4
