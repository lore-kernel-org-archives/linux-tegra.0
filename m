From: Rask Ingemann Lambertsen <rask@formelder.dk>
Subject: [PATCH] ARM: dts: tegra: =?iso-8859-1?Q?Fi?=
 =?iso-8859-1?Q?x_missing_card_detection_in_Trimslice_=B5SD?= card slot
Date: Sun, 22 Jan 2017 22:17:48 +0100
Message-ID: <20170122211747.exirq4nvb2xj6dk6@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Card insertion and removal currently goes undetected. AFAIK there's no
way to generate interrupts on card changes in this slot, so use polling.

Signed-off-by: Rask Ingemann Lambertsen <rask@formelder.dk>
---
 arch/arm/boot/dts/tegra20-trimslice.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 381747f..87b07fb 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -366,6 +366,7 @@
 
 	sdhci@c8000000 {
 		status = "okay";
+		broken-cd;
 		bus-width = <4>;
 	};
 
-- 
2.10.2

-- 
Rask Ingemann Lambertsen
