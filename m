From: Hiroshi DOYU <hdoyu@nvidia.com>
Subject: [PATCH 2/2] ARM: dt: tegra30.dtsi: Add SMMU node
Date: Thu, 10 May 2012 10:50:21 +0300
Message-ID: <1336636221-31575-3-git-send-email-hdoyu@nvidia.com>
References: <1336636221-31575-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336636221-31575-1-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hdoyu@nvidia.com
Cc: linux-tegra@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@nvidia.com>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@secretlab.ca>, Colin Cross <ccross@android.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add a node for the Tegra30 SMMU

Signed-off-by: Hiroshi DOYU <hdoyu@nvidia.com>
---
 arch/arm/boot/dts/tegra30.dtsi |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 167ccbc..e9792ac 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -238,4 +238,14 @@
 		       0x7000f284 0x17c>;
 		interrupts = <0 77 0x04>;
 	};
+
+	smmu {
+		compatible = "nvidia,tegra30-smmu";
+		reg = <0x7000f010 0x02c
+		       0x7000f1f0 0x010
+		       0x7000f228 0x05c>;
+		nvidia,#asids = <4>;		/* # of ASIDs */
+		dma-window = <0 0x40000000>;	/* IOVA start & length */
+		nvidia,ahb = <&ahb>;
+	};
 };
-- 
1.7.5.4
