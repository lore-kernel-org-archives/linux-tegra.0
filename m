From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCHv2 4/4] ARM: tegra: irq: Add tegra_eoi
Date: Sun,  1 May 2011 15:27:34 -0700
Message-ID: <1304288854-11011-1-git-send-email-ccross@android.com>
References: <1304284213-11950-5-git-send-email-ccross@android.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1304284213-11950-5-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lakml <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Implement irq_eoi to allow the GIC irq chip flow controller to
be changed to fasteoi.

Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
v2: Add tegra_eoi without removing tegra_ack, patch can now be
    merged safely before Will Deacon's gic fasteoi patch

 arch/arm/mach-tegra/irq.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
index da17491..4956c3c 100644
--- a/arch/arm/mach-tegra/irq.c
+++ b/arch/arm/mach-tegra/irq.c
@@ -95,6 +95,14 @@ static void tegra_ack(struct irq_data *d)
 	tegra_irq_write_mask(d->irq, ICTLR_CPU_IEP_FIR_CLR);
 }
 
+static void tegra_eoi(struct irq_data *d)
+{
+	if (d->irq < FIRST_LEGACY_IRQ)
+		return;
+
+	tegra_irq_write_mask(d->irq, ICTLR_CPU_IEP_FIR_CLR);
+}
+
 static int tegra_retrigger(struct irq_data *d)
 {
 	if (d->irq < FIRST_LEGACY_IRQ)
@@ -116,6 +124,7 @@ void __init tegra_init_irq(void)
 	}
 
 	gic_arch_extn.irq_ack = tegra_ack;
+	gic_arch_extn.irq_eoi = tegra_eoi;
 	gic_arch_extn.irq_mask = tegra_mask;
 	gic_arch_extn.irq_unmask = tegra_unmask;
 	gic_arch_extn.irq_retrigger = tegra_retrigger;
-- 
1.7.4.1
