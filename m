From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 4/6] dt-bindings: tegra: Add documentation for nvidia,tegra194-pmc
Date: Mon, 8 Jan 2018 06:54:36 +0200
Message-ID: <1515387278-29777-5-git-send-email-mperttunen@nvidia.com>
References: <1515387278-29777-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515387278-29777-1-git-send-email-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: talho@nvidia.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra194 power management controller has one additional register
aperture to be specified in the device tree node.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
index 078a58b0302f..5a3bf7c5a7a0 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
@@ -3,6 +3,7 @@ NVIDIA Tegra Power Management Controller (PMC)
 Required properties:
 - compatible: Should contain one of the following:
   - "nvidia,tegra186-pmc": for Tegra186
+  - "nvidia,tegra194-pmc": for Tegra194
 - reg: Must contain an (offset, length) pair of the register set for each
   entry in reg-names.
 - reg-names: Must include the following entries:
@@ -10,6 +11,7 @@ Required properties:
   - "wake"
   - "aotag"
   - "scratch"
+  - "misc" (Only for Tegra194)
 
 Optional properties:
 - nvidia,invert-interrupt: If present, inverts the PMU interrupt signal.
-- 
2.1.4
