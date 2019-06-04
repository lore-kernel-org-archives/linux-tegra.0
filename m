From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 2/3] soc/tegra: pmc: Avoid crash for non-wake IRQs
Date: Tue,  4 Jun 2019 17:51:34 +0200
Message-ID: <20190604155135.25390-2-thierry.reding@gmail.com>
References: <20190604155135.25390-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190604155135.25390-1-thierry.reding@gmail.com>
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

For interrupts that are not wakeup sources but that may end up getting
mapped through the PMC as interrupt parent (this can happen for GPIOs),
return early in order to avoid a subsequent crash from an out-of-bounds
access to the register region.

Reported-by: Bitan Biswas <bbiswas@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 653fe2c466f6..6e66b5e293be 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1924,6 +1924,9 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	unsigned int offset, bit;
 	u32 value;
 
+	if (WARN_ON(data->hwirq == ULONG_MAX))
+		return 0;
+
 	offset = data->hwirq / 32;
 	bit = data->hwirq % 32;
 
-- 
2.21.0
