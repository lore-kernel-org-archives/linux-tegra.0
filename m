From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] soc/tegra: pmc: Fail to allocate more than one wake IRQ
Date: Wed, 29 May 2019 12:26:53 +0200
Message-ID: <20190529102654.14665-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Bitan Biswas <bbiswas@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The code currently doesn't support allocating more than one wake IRQ at
a time. Detect this situation and error out. Also make sure to output a
warning when that happens to help track down callers.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 5648e5c09ef5..653fe2c466f6 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1863,6 +1863,9 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
 	unsigned int i;
 	int err = 0;
 
+	if (WARN_ON(num_irqs > 1))
+		return -EINVAL;
+
 	for (i = 0; i < soc->num_wake_events; i++) {
 		const struct tegra_wake_event *event = &soc->wake_events[i];
 
-- 
2.21.0
