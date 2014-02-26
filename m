From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add device tree for SHIELD
Date: Tue, 25 Feb 2014 22:02:02 -0700
Message-ID: <530D754A.60700@wwwdotorg.org>
References: <1393237593-28121-1-git-send-email-acourbot@nvidia.com> <530B952D.2000006@wwwdotorg.org> <530BFC58.6020003@nvidia.com> <530D1B7A.9070209@wwwdotorg.org> <530D748D.6010802@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <530D748D.6010802-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/25/2014 09:58 PM, Alexandre Courbot wrote:
> On 02/26/2014 07:38 AM, Stephen Warren wrote:
>> On 02/24/2014 07:13 PM, Alexandre Courbot wrote:
>>> On 02/25/2014 03:53 AM, Stephen Warren wrote:
>>>> On 02/24/2014 03:26 AM, Alexandre Courbot wrote:
>>>>> Add a device tree for NVIDIA SHIELD. The set of enabled features is
>>>>> still minimal with no display option (although HDMI should be easy
>>>>> to get to work) and USB requiring external power.
...
>>> For the Wifi chip, non-removable would be the correct setting
>>> hardware-wise, but there is a trap: the chip has its reset line asserted
>>> at boot-time, and you need to set GPIO 229 to de-assert it. Only after
>>> that will the device be detected on the SDIO bus. Since it lacks a CD
>>> line, it must be polled, hence the broken-cd property.
>>
>> How does that GPIO get manipulated right now? I assume you must be
>> manually configuring it via sysfs after boot or something? If so,
>> perhaps it's best to just leave out the WiFi node until it works
>> automatically.
> 
> The GPIO needs to be set from user-space, yes. But if we leave the Wifi
> node out, I'm concerned that wireless will not be usable at all,
> wouldn't it?

True, but if we have no representation of the device in DT that works
without manually enabling clocks and/or GPIOs, it's not a
complete/accurate representation of the HW, so it doesn't make sense to
add it to DT. Yes, I admit that sucks.
