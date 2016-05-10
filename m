From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 03/11] irqchip: Mask the non-type/sense bits when translating an IRQ
Date: Tue, 10 May 2016 16:14:37 +0100
Message-ID: <1462893285-13515-4-git-send-email-jonathanh@nvidia.com>
References: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462893285-13515-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The firmware parameter that contains the IRQ sense bits may also contain
other data. When return the IRQ type, bits outside of these sense bits
should be masked. If these bits are not masked and
irq_create_fwspec_mapping() is called to map an IRQ, then the comparison
of the type returned from irq_domain_translate() will never match
that returned by irq_get_trigger_type() (because this function masks the
none sense bits) and so we will always call irq_set_irq_type() to program
the type even if it was not really necessary.

Currently, the downside to this is unnecessarily re-programmming the type
but nevertheless this should be avoided.

The Tegra LIC and TI Crossbar irqchips all have client instances (from
reviewing the device-tree sources) where bits outside the IRQ sense bits
are set, but do not mask these bits. Therefore, ensure these bits are
masked for these irqchips.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
---
 drivers/irqchip/irq-crossbar.c | 2 +-
 drivers/irqchip/irq-tegra.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-crossbar.c b/drivers/irqchip/irq-crossbar.c
index 75573fa431ba..1eef56a89b1f 100644
--- a/drivers/irqchip/irq-crossbar.c
+++ b/drivers/irqchip/irq-crossbar.c
@@ -183,7 +183,7 @@ static int crossbar_domain_translate(struct irq_domain *d,
 			return -EINVAL;
 
 		*hwirq = fwspec->param[1];
-		*type = fwspec->param[2];
+		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
 		return 0;
 	}
 
diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index 50be9639e27e..e902f081e16c 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -235,7 +235,7 @@ static int tegra_ictlr_domain_translate(struct irq_domain *d,
 			return -EINVAL;
 
 		*hwirq = fwspec->param[1];
-		*type = fwspec->param[2];
+		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
 		return 0;
 	}
 
-- 
2.1.4
