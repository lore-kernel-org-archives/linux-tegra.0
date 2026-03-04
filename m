Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102993A0B35;
	Wed,  4 Mar 2026 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772644951; cv=none; b=YLS8bVUtFklNnVIctolk4K3wp8X5DafLjIhNdMpDPPBsR4nF68w/IL9RLXTmkPZ4HfOkcWvmnSJgSgLB6l7BuUOzDd+tchLzCQwGt654asv1ZNcVtN9oN8jDtKw7n9bBtzsToF8FXqjQQudtPpZeQ+M3LL6Vdd5ufdEGUKHcWQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772644951; c=relaxed/simple;
	bh=kzeAmW8ai6m+Tt0p0RRAcjdmfPdkrIbUdsKHJcDH3pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XzI4KmTPgSoqDZ2mJEoB7Vc/XvhxxRYFtRyJ6xU8qLSxXZAhHq2gTV5j5Gy6CxYOnL7zuv6V8eQaWSH7kMRhNNpr+eJ92admb1Twxvy/pzeEe/p1QaQvHeJlSpP+tyNvAsC/LnmolWRQZfL2Nl6VAF3aFS0f6A6lXl+P3DZfX1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C00C4CEF7;
	Wed,  4 Mar 2026 17:22:23 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] irqchip/gic: Use GIC_* DT binding definitions
Date: Wed,  4 Mar 2026 18:21:58 +0100
Message-ID: <d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772644406.git.geert+renesas@glider.be>
References: <cover.1772644406.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace magic numbers by symbolic DT binding definitions.  This improves
readability, and makes it easier to find where the various GIC
interrupts types are handled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-gic-v3.c | 14 ++++++++------
 drivers/irqchip/irq-gic.c    |  6 ++++--
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index d75163e71bf22473..6ac103cb40097acc 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -35,6 +35,8 @@
 #include <asm/smp_plat.h>
 #include <asm/virt.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #include "irq-gic-common.h"
 
 static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
@@ -1602,25 +1604,25 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 			return -EINVAL;
 
 		switch (fwspec->param[0]) {
-		case 0:			/* SPI */
+		case GIC_SPI:
 			if (fwspec->param[1] > 987)
 				pr_warn_once("SPI %u out of range (use ESPI?)\n",
 					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + 32;
 			break;
-		case 1:			/* PPI */
+		case GIC_PPI:
 			if (fwspec->param[1] > 16)
 				pr_warn_once("PPI %u out of range (use EPPI?)\n",
 					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + 16;
 			break;
-		case 2:			/* ESPI */
+		case GIC_ESPI:
 			if (fwspec->param[1] > 1023)
 				pr_warn_once("ESPI %u out of range\n",
 					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + ESPI_BASE_INTID;
 			break;
-		case 3:			/* EPPI */
+		case GIC_EPPI:
 			if (fwspec->param[1] > 63)
 				pr_warn_once("EPPI %u out of range\n",
 					     fwspec->param[1]);
@@ -1738,8 +1740,8 @@ static int gic_irq_get_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_
 		struct fwnode_handle *fw;
 
 		switch (fwspec->param[0]) {
-		case 1:			/* PPI */
-		case 3:			/* EPPI */
+		case GIC_PPI:
+		case GIC_EPPI:
 			break;
 		default:
 			return 0;
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index ec70c84e9f91dd7b..a2225ca1efeb700d 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -47,6 +47,8 @@
 #include <asm/smp_plat.h>
 #include <asm/virt.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #include "irq-gic-common.h"
 
 #ifdef CONFIG_ARM64
@@ -1094,10 +1096,10 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 			return -EINVAL;
 
 		switch (fwspec->param[0]) {
-		case 0:			/* SPI */
+		case GIC_SPI:
 			*hwirq = fwspec->param[1] + 32;
 			break;
-		case 1:			/* PPI */
+		case GIC_PPI:
 			*hwirq = fwspec->param[1] + 16;
 			break;
 		default:
-- 
2.43.0

