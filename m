From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH 1/9] arm: tegra: apalis_t30: update hardware revisions compatibility comment
Date: Fri, 28 Aug 2015 14:42:28 +0200
Message-ID: <1440765756-1382-2-git-send-email-marcel.ziswiler@toradex.com>
References: <1440765756-1382-1-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440765756-1382-1-git-send-email-marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Update introductory comment about what exact hardware revisions this
device tree is compatible with as a hint for our customers.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---

 arch/arm/boot/dts/tegra30-apalis.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index a5446cb..3bff4d7 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -1,8 +1,9 @@
 #include "tegra30.dtsi"
 
 /*
- * Toradex Apalis T30 Device Tree
- * Compatible for Revisions 1GB: V1.0A; 2GB: V1.0B, V1.0C
+ * Toradex Apalis T30 Module Device Tree
+ * Compatible for Revisions 1GB: V1.0A, V1.1A; 1GB IT: V1.1A;
+ * 2GB: V1.0B, V1.0C, V1.0E, V1.1A
  */
 / {
 	model = "Toradex Apalis T30";
-- 
2.4.3
