From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 6/7] drivers/clocksource/timer-of: keep declaration on one line
Date: Tue, 10 Sep 2019 16:47:15 +0300
Message-ID: <1568123236-767-7-git-send-email-claudiu.beznea@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, nsekhar@ti.com, bgolaszewski@baylibre.com, monstr@monstr.eu, john@phrozen.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, lftan@altera.com, tglx@linutronix.de, vgupta@synopsys.com, marc.zyngier@arm.com, patrice.chotard@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, shc_work@mail.ru, kgene@kernel.org, krzk@kernel.org, ysato@users.sourceforge.jp, liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, nios2-dev@lists.rocketboards.org, linux-snps-arc@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, linux-amlogic@lists.infradead.org, openbmc@lists.ozlabs.org, linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: linux-tegra@vger.kernel.org

timer_of_init() declaration could be kept on one line (80 chars per
line rule is not broken).

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clocksource/timer-of.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-of.h b/drivers/clocksource/timer-of.h
index 9fb8c5523150..af72e29e2ea4 100644
--- a/drivers/clocksource/timer-of.h
+++ b/drivers/clocksource/timer-of.h
@@ -84,8 +84,7 @@ static inline unsigned int timer_of_is_clockevent(struct timer_of *to)
 		 (TIMER_OF_TYPE_CE | TIMER_OF_TYPE_CE_AND_CS));
 }
 
-extern int __init timer_of_init(struct device_node *np,
-				struct timer_of *to);
+extern int __init timer_of_init(struct device_node *np, struct timer_of *to);
 
 extern void __init timer_of_cleanup(struct timer_of *to);
 
-- 
2.7.4
