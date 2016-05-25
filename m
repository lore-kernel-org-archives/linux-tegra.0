From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Wed, 25 May 2016 12:36:15 -0400
Message-ID: <1c6df907-ea1f-201b-a36e-8311c5b2b3b1@nvidia.com>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
 <5744609A.1000008@nvidia.com>
 <324dfe74-4fc0-d500-91ac-2a802562e92f@nvidia.com>
 <5745853B.1040304@nvidia.com> <57458693.3050700@nvidia.com>
 <20160525154618.GD13765@ulmo.ba.sec>
 <9411ff33-e375-8286-8690-fe7fcac1c14b@nvidia.com>
 <5745CE75.7010603@nvidia.com> <5745D2DD.6080300@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5745D2DD.6080300@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sebastian Reichel <sre@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 5/25/2016 12:29 PM, Jon Hunter wrote:
> 
> On 25/05/16 17:10, Jon Hunter wrote:
> 
> ...
> 
>> So power_supply_read_temp() calls ->get_property() and passes the
>> power_supply psy struct which is initialised. The problem is that inside
>> the bq27xxx driver, this then kicks off the worker thread to update the
>> bq27xxx state and when this worker thread runs it attempts to access the
>> same psy struct but by dereferencing a pointer to it from the
>> bq27xxx_device_info where the pointer has not been initialised yet.
>> Therefore, IMO it seems that we should not allow this worker thread to
>> start until the registration has completed and hence the pointer is
>> initialised.
> 
> Sorry, it is not the actual worker thread that triggers the NULL pointer
> deference, but the function bq27xxx_battery_poll() that schedules the
> worker thread. Anyway, I still don't see that we need to update the
> bq27xxx state during the registration especially seeing as we call
> bq27xxx_battery_update() after the registration is complete. It seems
> that updating the overall state should be mutually exclusive from
> reading the temp.
> 
> Looking at my patch, it does appear that the worker thread which also
> calls bq27xxx_battery_update() is still scheduled and so may be it
> should be ...
> 
> diff --git a/drivers/power/bq27xxx_battery.c b/drivers/power/bq27xxx_battery.c
> index 45f6ebf88df6..1334ed522332 100644
> --- a/drivers/power/bq27xxx_battery.c
> +++ b/drivers/power/bq27xxx_battery.c
> @@ -733,6 +733,9 @@ static void bq27xxx_battery_poll(struct work_struct *work)
>                         container_of(work, struct bq27xxx_device_info,
>                                      work.work);
>  
> +       if (!di->bat)
> +               return;
> +
>         bq27xxx_battery_update(di);
>  
>         if (poll_interval > 0) {
> 
> 


I can see that getting the temperature could work. I would point out
that I don't see any recent changes to bq27xxx or the power_supply_core
that would imply this is a regression. My guess is that up until now,
for devices that support the TEMP property, CONFIG_THERMAL isn't been
enabled.

So here are my thoughts.... we can do 2 things here:

1) patch bq27xxx in some manner that will allow the bq27xxx driver to
work report the temp during register (such as above patch).
2) Patch the core to avoid using get_property callback during registration.

I think for our immediate concern and crash, #1 is fine. It will work
and is fine. I however think this is just a symptom of the larger issue
(#2). In this case, the problem we see is that di->bat is used before it
is set, and we have a way around it. However, for EVERY device that
registers and has TEMP prop (and CONFIG_THERMAL enabled) it is going to
receive a call with its relative di->bat uninitialized too.

I don't know for certain if #2 has caused problems anywhere else, and I
would be surprised if it has and hasn't been caught.


AS far as this crash is concerned, I think either approach will work.
Adding in David, Dmitry, and Sebastian (maintainers) to see if they have
a preferred approach.

-rhyland

-- 
nvpublic
