From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 4/5] gpio: max77620: Don't handle disabled interrupts
Date: Wed,  8 Jul 2020 11:26:33 +0300
Message-ID: <20200708082634.30191-5-digetx@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200708082634.30191-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Check whether GPIO IRQ is enabled before proceeding with handling the
interrupt request. The interrupt handler now returns IRQ_NONE if none
of interrupts were handled, which is usually a sign of a problem.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpio/gpio-max77620.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index dd83c16a1ec6..8d54bc4307c2 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -37,7 +37,9 @@ static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
 		return IRQ_NONE;
 	}
 
-	pending = value;
+	pending = value & gpio->irq_enb_mask;
+	if (!pending)
+		return IRQ_NONE;
 
 	for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
 		unsigned int virq;
-- 
2.26.0
