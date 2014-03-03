From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V3 3/5] irqchip: gic: parse IRQ specifier flag src/dst
 inversion
Date: Mon,  3 Mar 2014 12:51:38 -0700
Message-ID: <1393876300-3061-3-git-send-email-swarren@wwwdotorg.org>
References: <1393876300-3061-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1393876300-3061-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

Modify the GIC driver to parse IRQ specifier flag bit 4 (src/dst
inverted) in the xlate function.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
v3: New patch.
---
 drivers/irqchip/irq-gic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 500e533b9648..97800b349f54 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -847,6 +847,9 @@ static int gic_irq_domain_xlate(struct irq_domain *d,
 		*out_hwirq += 16;
 
 	*out_type = intspec[2] & IRQ_TYPE_SENSE_MASK;
+	if (intspec[2] & BIT(4))
+		*out_type |= IRQ_SRC_DST_INVERTED;
+
 	return 0;
 }
 
-- 
1.8.1.5
