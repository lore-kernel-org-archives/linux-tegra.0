From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 04/69] clocksource/drivers/tegra: Allow timer irq affinity
 change
Date: Fri, 18 Dec 2015 15:17:17 +0100
Message-ID: <1450448302-27429-4-git-send-email-daniel.lezcano@linaro.org>
References: <5672CB9E.7090707@linaro.org>
 <1450448302-27429-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1450448302-27429-1-git-send-email-daniel.lezcano@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tglx@linutronix.de
Cc: Alexandre Courbot <gnurou@gmail.com>, Lucas Stach <dev@lynxeye.de>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, "open list:TEGRA ARCHITECTUR..." <linux-tegra@vger.kernel.org>, mingo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Lucas Stach <dev@lynxeye.de>

Allow the timer core to change the smp affinity of the broadcast timer
irq by setting CLOCK_EVT_FEAT_DYNIRQ flag.

This reduces interrupt pressure and wakeups on CPU0 as well as vastly
reducing the number of timer broadcast IPIs.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/tegra20_timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
index 6ebda11..38333ab 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -96,7 +96,8 @@ static struct clock_event_device tegra_clockevent = {
 	.name			= "timer0",
 	.rating			= 300,
 	.features		= CLOCK_EVT_FEAT_ONESHOT |
-				  CLOCK_EVT_FEAT_PERIODIC,
+				  CLOCK_EVT_FEAT_PERIODIC |
+				  CLOCK_EVT_FEAT_DYNIRQ,
 	.set_next_event		= tegra_timer_set_next_event,
 	.set_state_shutdown	= tegra_timer_shutdown,
 	.set_state_periodic	= tegra_timer_set_periodic,
-- 
1.9.1
