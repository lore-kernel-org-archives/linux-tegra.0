From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 2/5] genirq: Export irq_chip_set_wake_parent()
Date: Thu, 29 Nov 2018 18:03:09 +0100
Message-ID: <20181129170312.23625-3-thierry.reding@gmail.com>
References: <20181129170312.23625-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129170312.23625-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Interrupt controllers in a hierarchy want to use this function to
propogate ->irq_set_wake() operations to their parent domains.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 kernel/irq/chip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index a2b3d9de999c..b3aea5282243 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1381,6 +1381,7 @@ int irq_chip_set_wake_parent(struct irq_data *data, unsigned int on)
 
 	return -ENOSYS;
 }
+EXPORT_SYMBOL_GPL(irq_chip_set_wake_parent);
 #endif
 
 /**
-- 
2.19.1
