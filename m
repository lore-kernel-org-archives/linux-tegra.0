From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Wed, 25 May 2016 17:29:17 +0100
Message-ID: <5745D2DD.6080300@nvidia.com>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
 <5744609A.1000008@nvidia.com>
 <324dfe74-4fc0-d500-91ac-2a802562e92f@nvidia.com>
 <5745853B.1040304@nvidia.com> <57458693.3050700@nvidia.com>
 <20160525154618.GD13765@ulmo.ba.sec>
 <9411ff33-e375-8286-8690-fe7fcac1c14b@nvidia.com>
 <5745CE75.7010603@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5745CE75.7010603-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/05/16 17:10, Jon Hunter wrote:

...

> So power_supply_read_temp() calls ->get_property() and passes the
> power_supply psy struct which is initialised. The problem is that inside
> the bq27xxx driver, this then kicks off the worker thread to update the
> bq27xxx state and when this worker thread runs it attempts to access the
> same psy struct but by dereferencing a pointer to it from the
> bq27xxx_device_info where the pointer has not been initialised yet.
> Therefore, IMO it seems that we should not allow this worker thread to
> start until the registration has completed and hence the pointer is
> initialised.

Sorry, it is not the actual worker thread that triggers the NULL pointer
deference, but the function bq27xxx_battery_poll() that schedules the
worker thread. Anyway, I still don't see that we need to update the
bq27xxx state during the registration especially seeing as we call
bq27xxx_battery_update() after the registration is complete. It seems
that updating the overall state should be mutually exclusive from
reading the temp.

Looking at my patch, it does appear that the worker thread which also
calls bq27xxx_battery_update() is still scheduled and so may be it
should be ...

diff --git a/drivers/power/bq27xxx_battery.c b/drivers/power/bq27xxx_battery.c
index 45f6ebf88df6..1334ed522332 100644
--- a/drivers/power/bq27xxx_battery.c
+++ b/drivers/power/bq27xxx_battery.c
@@ -733,6 +733,9 @@ static void bq27xxx_battery_poll(struct work_struct *work)
                        container_of(work, struct bq27xxx_device_info,
                                     work.work);
 
+       if (!di->bat)
+               return;
+
        bq27xxx_battery_update(di);
 
        if (poll_interval > 0) {


Cheers
Jon

-- 
nvpublic
