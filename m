From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 5/5] ARM: tegra: Add thermal reset (thermtrip) support
 to PMC
Date: Thu, 21 Aug 2014 16:11:53 +0300
Message-ID: <53F5F019.10308@nvidia.com>
References: <1407933685-12404-1-git-send-email-mperttunen@nvidia.com> <1407933685-12404-6-git-send-email-mperttunen@nvidia.com> <53F5042A.7020603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53F5042A.7020603-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 20/08/14 23:25, Stephen Warren wrote:
> On 08/13/2014 06:41 AM, Mikko Perttunen wrote:
>> This adds a device tree controlled option to enable PMC-based
>> thermal reset in overheating situations. Thermtrip is supported on
>> Tegra30, Tegra114 and Tegra124. The thermal reset only works when
>> the thermal sensors are calibrated, so a soctherm driver is also
>> required.
>
> If calibration is required, presumably the soctherm must initialize
> before this thermtrip code can initialize, or this thermtrip logic might
> be triggered by uncalibrated sensors?

SOCTHERM requires that each sensor be explicitly enabled before it gives 
readings. If a sensor is not enabled, the temperature given by the 
register (and used to trigger thermtrip) will be zero. So in order for a 
thermtrip shutdown to be caused before soctherm is initialized, the 
thermtrip temperature would have to be programmed to below zero (the 
default value is 105C), in which case an immediate shutdown would 
probably be in order anyway (unless the user uses LN2 or something to 
cool the soc below zero).

>
> If so, then there needs to be some explicit mechanism to force the two
> drivers into probing in the right order.

Because of the above, I think it isn't necessary to probe these in order.

Cheers,
Mikko
