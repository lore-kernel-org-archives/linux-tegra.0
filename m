From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V2 1/6] ARM: tegra: device tree whitespace cleanup
Date: Wed,  6 Mar 2013 11:28:32 -0700
Message-ID: <1362594517-22099-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kbuild-owner@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Michal Marek <mmarek@suse.cz>, Shawn Guo <shawn.guo@linaro.org>, linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

Remove white-space from empty line; triggers checkpatch.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
Patches 3 and later in his series depends on the kbuild-related series I
just posted to rework the dtc+cpp logic. I hope to apply them to the Tegra
tree after merging the previous series from the arm-soc topic branch.
Patches 1 and 2 are just cleanup that the others depend on.

 arch/arm/boot/dts/tegra20.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 48d00a0..ab9402a 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -208,7 +208,7 @@
 		compatible = "nvidia,tegra20-das";
 		reg = <0x70000c00 0x80>;
 	};
-	
+
 	tegra_ac97: ac97 {
 		compatible = "nvidia,tegra20-ac97";
 		reg = <0x70002000 0x200>;
-- 
1.7.10.4

