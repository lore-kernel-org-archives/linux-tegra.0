From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Wed, 25 May 2016 15:44:15 -0400
Message-ID: <5c03a025-f31d-fa18-b973-0b026ede9c5c@nvidia.com>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
 <5744609A.1000008@nvidia.com>
 <324dfe74-4fc0-d500-91ac-2a802562e92f@nvidia.com>
 <5745853B.1040304@nvidia.com> <57458693.3050700@nvidia.com>
 <20160525154618.GD13765@ulmo.ba.sec>
 <9411ff33-e375-8286-8690-fe7fcac1c14b@nvidia.com>
 <5745CE75.7010603@nvidia.com> <5745D2DD.6080300@nvidia.com>
 <1c6df907-ea1f-201b-a36e-8311c5b2b3b1@nvidia.com>
 <5745E031.7010406@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5745E031.7010406-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 5/25/2016 1:26 PM, Jon Hunter wrote:
> 
> On 25/05/16 17:36, Rhyland Klein wrote:
> 
> ...
> 
>> I can see that getting the temperature could work. I would point out
>> that I don't see any recent changes to bq27xxx or the power_supply_core
>> that would imply this is a regression. My guess is that up until now,
>> for devices that support the TEMP property, CONFIG_THERMAL isn't been
>> enabled.
>>
>> So here are my thoughts.... we can do 2 things here:
>>
>> 1) patch bq27xxx in some manner that will allow the bq27xxx driver to
>> work report the temp during register (such as above patch).
>> 2) Patch the core to avoid using get_property callback during registration.
> 
> I wonder if #2 will cause other problems for other devices as this
> really changes the functionality.
> 
>> I think for our immediate concern and crash, #1 is fine. It will work
>> and is fine. I however think this is just a symptom of the larger issue
>> (#2). In this case, the problem we see is that di->bat is used before it
>> is set, and we have a way around it. However, for EVERY device that
>> registers and has TEMP prop (and CONFIG_THERMAL enabled) it is going to
>> receive a call with its relative di->bat uninitialized too.
> 
> I don't think we are understanding each other and I still think that
> this could be specific to the bq27xxx. And here is why ...
> 
> The power supply driver is going to receive a call to it's
> ->get_property() function with a *VALID* pointer to the power_supply
> structure, *psy. When initialised, di->bat == psy (assuming bq27xxx
> naming) and so in other words, they point to the same thing. Therefore,
> in the normal case, you should not need to access di->bat from within
> ->get_property() because you already have a valid pointer to the
> power_supply structure, *psy.
> 
> So the ONLY problem would be IF the ->get_property function calls
> power_supply_get_drvdata() to get a pointer to the drvdata, *di, and
> then dereferences and uses the pointer, di->bat, which may NOT be
> initialised yet. I am wondering how likely this is as it seems a bit
> daft to do this, unless you are doing something like the bq27xxx driver
> is attempting to do.
> 
> Again IMO the problem is related to how the bq27xxx driver has
> implemented the status update.
> 

And you might be completely correct, that is something that can only
happen specifically with the bq27xxx driver. In which case, making the
fix there should be the fix. I just know from the commit log (and some
previous work with power supply drivers) that the case of get_property
being called during registration has caused problems before. That's why
I am trying to make sure we cover the generic case if it exists. Using
scheduled work is common for power_supplies to regularly update their
status.

As for your proposed patches for bq27xxx, I think the latest one you
suggested (@12:36PM EST) with the change for
battery_update->battery_poll as well makes the most sense for bq27xxx. I
would like to point out though that if we patch this, the cache won't be
populated for the first TEMP request, which has the same end effect as
the patch I proposed to power_supply_read_temp. I believe both will
return 0 for the temp.

I think that patch would work just fine in place of what I suggested for
this specific crash.

-rhyland


-- 
nvpublic
