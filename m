From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Wed, 25 May 2016 12:03:47 +0100
Message-ID: <57458693.3050700@nvidia.com>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
 <5744609A.1000008@nvidia.com>
 <324dfe74-4fc0-d500-91ac-2a802562e92f@nvidia.com>
 <5745853B.1040304@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5745853B.1040304-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/05/16 11:58, Jon Hunter wrote:

...

> Looking at this a bit more I am wondering if we should prevent the
> battery for being polled before the registration has completed ...
> 
> diff --git a/drivers/power/bq27xxx_battery.c
> b/drivers/power/bq27xxx_battery.c
> index 45f6ebf88df6..32649183ecd9 100644
> --- a/drivers/power/bq27xxx_battery.c
> +++ b/drivers/power/bq27xxx_battery.c
> @@ -871,12 +871,14 @@ static int bq27xxx_battery_get_property(struct
> power_supply *psy,
>         int ret = 0;
>         struct bq27xxx_device_info *di = power_supply_get_drvdata(psy);
> 
> -       mutex_lock(&di->lock);
> -       if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
> -               cancel_delayed_work_sync(&di->work);
> -               bq27xxx_battery_poll(&di->work.work);
> +       if (di->bat) {
> +               mutex_lock(&di->lock);
> +               if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
> +                       cancel_delayed_work_sync(&di->work);
> +                       bq27xxx_battery_poll(&di->work.work);
> +               }
> +               mutex_unlock(&di->lock);
>         }
> -       mutex_unlock(&di->lock);

Alternatively, maybe the following is simpler ...

diff --git a/drivers/power/bq27xxx_battery.c
b/drivers/power/bq27xxx_battery.c
index 45f6ebf88df6..8a713b52e9f6 100644
--- a/drivers/power/bq27xxx_battery.c
+++ b/drivers/power/bq27xxx_battery.c
@@ -733,7 +733,8 @@ static void bq27xxx_battery_poll(struct work_struct
*work)
                        container_of(work, struct bq27xxx_device_info,
                                     work.work);

-       bq27xxx_battery_update(di);
+       if (di->bat)
+               bq27xxx_battery_update(di);

Jon

-- 
nvpublic
