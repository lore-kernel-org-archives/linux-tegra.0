From: Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 03/10] of: Add PWM support.
Date: Sun, 26 Feb 2012 10:08:10 +1100
Message-ID: <4F4969DA.2090508@gmail.com>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de> <201202231403.01614.arnd@arndb.de> <20120224064749.GB18786@avionic-0098.mockup.avionic-design.de> <201202241658.32062.arnd@arndb.de> <20120225123357.GU3852@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120225123357.GU3852-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 25/02/12 23:33, Sascha Hauer wrote:

> On Fri, Feb 24, 2012 at 04:58:31PM +0000, Arnd Bergmann wrote:
>> On Friday 24 February 2012, Thierry Reding wrote:
>>> * Arnd Bergmann wrote:
>>>> On Thursday 23 February 2012, Thierry Reding wrote:
>>>>> * Arnd Bergmann wrote:
>>
>>> [...]
>>>>>> * Why not include the pwm_request() call in this and return the
>>>>>>   pwm_device directly? You said that you want to get rid of the
>>>>>>   pwm_id eventually, which is a good idea, but this interface still
>>>>>>   forces one to use it.
>>>>>
>>>>> Okay, that sounds sensible. I propose to rename the function to something like
>>>>> of_request_pwm().
>>>>
>>>> Sounds good.
>>
>> On second thought, I would actually prefer starting the name with pwm_ and
>> making it independent of device tree. There might be other ways how to
>> find the pwm_device from a struct device in the future, but it should always
>> be possible using a device together with a string and/or numeric identifier,
>> much in the same way that we can get a resource from a platform_device.
>>
>> Ideally, there would be a common theme behind finding a memory region,
>> irq, gpio pin, clock, regulator, dma-channel and pwm or anything else
>> that requires a link between two device nodes.
>>
>>>>> It would of course need an additional parameter (name) to
>>>>> forward to pwm_request().
>>>>
>>>> Not necessarily, it could use the dev_name(device) or the name
>>>> of the property, or a combination of the two.
>>>
>>> The problem with that is that usually the device would be named something
>>> generic like "pwm", while in case where the PWM is used for the backlight
>>> it makes sense to label the PWM device "backlight".
>>>
>>> Looking at debugfs and seeing an entry "backlight" is much more straight-
>>> forward than "pwm.0". I mean "pwm.0" doesn't carry any useful information
>>> really, does it?
>>
>> But the device name would be from the device using the pwm, not the
>> pwm controller, so it should be something more helpful, no?
>>
>>>>>>> +EXPORT_SYMBOL(of_get_named_pwm);
>>>>>>
>>>>>> EXPORT_SYMBOL_GPL?
>>>>>
>>>>> It was brought up at some point that it might be nice to allow non-GPL
>>>>> drivers to use the PWM framework as well. I don't remember any discussion
>>>>> resulting from the comment. Perhaps we should have that discussion now and
>>>>> decide whether or not we want to keep it GPL-only or not.
>>>>
>>>> I would definitely use EXPORT_SYMBOL_GPL for all new code unless it
>>>> replaces an earlier interface that was available as EXPORT_SYMBOL.
>>>
>>> I just grepped the code and noticed this:
>>>
>>> 	$ $ git grep -n 'EXPORT_SYMBOL.*(pwm_request)'
>>> 	arch/arm/mach-vt8500/pwm.c:139:EXPORT_SYMBOL(pwm_request);
>>> 	arch/arm/plat-mxc/pwm.c:183:EXPORT_SYMBOL(pwm_request);
>>> 	arch/arm/plat-samsung/pwm.c:83:EXPORT_SYMBOL(pwm_request);
>>> 	arch/unicore32/kernel/pwm.c:132:EXPORT_SYMBOL(pwm_request);
>>> 	drivers/mfd/twl6030-pwm.c:156:EXPORT_SYMBOL(pwm_request);
>>> 	drivers/misc/ab8500-pwm.c:108:EXPORT_SYMBOL(pwm_request);
>>> 	drivers/pwm/core.c:262:EXPORT_SYMBOL_GPL(pwm_request);
>>>
>>> It seems like the legacy PWM API used to be non-GPL. Should I switch it back?
>>> Also does it make sense to have something like of_request_pwm() GPL when the
>>> rest of the API isn't?
>>
>> I guess the choice is to make between you and Sascha. The implementation is
>> new, so you could pick EXPORT_SYMBOL_GPL, but you could also try to
>> keep to the current API.
> 
> I tend to use _GPL, but I have no strong objection using the non GPL
> variant.


I raised the question last time round. My understanding in that internal
interfaces, those which should never be used by external modules, should
be EXPORT_SYMBOL_GPL, but public interfaces should be EXPORT_SYMBOL. I'm
not hugely against making the entire interface _GPL, I just wanted to
make sure it was intended that way, and not just cut and paste :-).

~Ryan
