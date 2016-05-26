From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Thu, 26 May 2016 11:35:49 +0100
Message-ID: <5746D185.30006@nvidia.com>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
 <5744609A.1000008@nvidia.com>
 <324dfe74-4fc0-d500-91ac-2a802562e92f@nvidia.com>
 <5745853B.1040304@nvidia.com> <57458693.3050700@nvidia.com>
 <20160525154618.GD13765@ulmo.ba.sec>
 <9411ff33-e375-8286-8690-fe7fcac1c14b@nvidia.com>
 <5745CE75.7010603@nvidia.com> <5745D2DD.6080300@nvidia.com>
 <1c6df907-ea1f-201b-a36e-8311c5b2b3b1@nvidia.com>
 <5745E031.7010406@nvidia.com>
 <5c03a025-f31d-fa18-b973-0b026ede9c5c@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5c03a025-f31d-fa18-b973-0b026ede9c5c-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/05/16 20:44, Rhyland Klein wrote:

...

> And you might be completely correct, that is something that can only
> happen specifically with the bq27xxx driver. In which case, making the
> fix there should be the fix. I just know from the commit log (and some
> previous work with power supply drivers) that the case of get_property
> being called during registration has caused problems before. That's why
> I am trying to make sure we cover the generic case if it exists. Using
> scheduled work is common for power_supplies to regularly update their
> status.

Yes but only appears to be the bq27xxx and seems to be related to this
issue. To be honest, if the maintainers are ok with your proposal then
it is fine with me, but I was just thinking that this feels like a
bq27xxx issue.
 
> As for your proposed patches for bq27xxx, I think the latest one you
> suggested (@12:36PM EST) with the change for
> battery_update->battery_poll as well makes the most sense for bq27xxx. I
> would like to point out though that if we patch this, the cache won't be
> populated for the first TEMP request, which has the same end effect as
> the patch I proposed to power_supply_read_temp. I believe both will
> return 0 for the temp.

Actually, I gave it a test and instead of returning zero it returns
absolute zero (0K or -273C!). So that is probably no good. Something
like Thierry was suggesting could work. Another thought I had was ...

diff --git a/drivers/power/bq27xxx_battery.c b/drivers/power/bq27xxx_battery.c
index 45f6ebf88df6..77488183df6b 100644
--- a/drivers/power/bq27xxx_battery.c
+++ b/drivers/power/bq27xxx_battery.c
@@ -674,12 +674,15 @@ static int bq27xxx_battery_read_health(struct bq27xxx_device_info *di)
 	return POWER_SUPPLY_HEALTH_GOOD;
 }
 
-void bq27xxx_battery_update(struct bq27xxx_device_info *di)
+static void __bq27xxx_battery_update(struct bq27xxx_device_info *di,
+				     struct power_supply *psy)
 {
 	struct bq27xxx_reg_cache cache = {0, };
 	bool has_ci_flag = di->chip == BQ27000 || di->chip == BQ27010;
 	bool has_singe_flag = di->chip == BQ27000 || di->chip == BQ27010;
 
+	WARN_ON(!psy);
+
 	cache.flags = bq27xxx_read(di, BQ27XXX_REG_FLAGS, has_singe_flag);
 	if ((cache.flags & 0xff) == 0xff)
 		cache.flags = -1; /* read error */
@@ -717,13 +720,25 @@ void bq27xxx_battery_update(struct bq27xxx_device_info *di)
 			di->charge_design_full = bq27xxx_battery_read_dcap(di);
 	}
 
-	if (di->cache.capacity != cache.capacity)
-		power_supply_changed(di->bat);
+	if (psy && di->cache.capacity != cache.capacity)
+		power_supply_changed(psy);
 
 	if (memcmp(&di->cache, &cache, sizeof(cache)) != 0)
 		di->cache = cache;
 
 	di->last_update = jiffies;
+
+	if (poll_interval > 0) {
+		/* The timer does not have to be accurate. */
+		set_timer_slack(&di->work.timer, poll_interval * HZ / 4);
+		schedule_delayed_work(&di->work, poll_interval * HZ);
+	}
+}
+
+void bq27xxx_battery_update(struct bq27xxx_device_info *di)
+{
+	cancel_delayed_work_sync(&di->work);
+	__bq27xxx_battery_update(di, di->bat);
 }
 EXPORT_SYMBOL_GPL(bq27xxx_battery_update);
 
@@ -733,13 +748,7 @@ static void bq27xxx_battery_poll(struct work_struct *work)
 			container_of(work, struct bq27xxx_device_info,
 				     work.work);
 
-	bq27xxx_battery_update(di);
-
-	if (poll_interval > 0) {
-		/* The timer does not have to be accurate. */
-		set_timer_slack(&di->work.timer, poll_interval * HZ / 4);
-		schedule_delayed_work(&di->work, poll_interval * HZ);
-	}
+	__bq27xxx_battery_update(di, di->bat);
 }
 
 /*
@@ -874,7 +883,7 @@ static int bq27xxx_battery_get_property(struct power_supply *psy,
 	mutex_lock(&di->lock);
 	if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
 		cancel_delayed_work_sync(&di->work);
-		bq27xxx_battery_poll(&di->work.work);
+		__bq27xxx_battery_update(di, psy);
 	}
 	mutex_unlock(&di->lock);
 
Cheers
Jon

-- 
nvpublic
