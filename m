From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: tegra: Add the EC i2c tunnel to tegra124-venice2
Date: Mon, 21 Apr 2014 12:35:49 -0700
Message-ID: <CAD=FV=W8=SLxF=goYm9p3Dr0ZQYy9FzN0hbE+MwWFYGarZB9tw@mail.gmail.com>
References: <1397757570-19750-1-git-send-email-dianders@chromium.org>
	<1397757570-19750-8-git-send-email-dianders@chromium.org>
	<535560E9.5040108@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <535560E9.5040108-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen,

On Mon, Apr 21, 2014 at 11:18 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 04/17/2014 11:59 AM, Doug Anderson wrote:
>> This adds the EC i2c tunnel (and devices under it) to the
>> tegra124-venice2 device tree.
>
> The series,
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> I can apply this one patch once the other patches in the series are
> acked or applied (in order to make sure the DT binding is acceptable to
> others).

Sounds good.  If I don't get any feedback (positive or negative) in
the next few days I'll resend with your Tested-by.


> I guess I'll send separate patches for tegra_defconfig and
> multi_v7_defconfig to add the required options once I've applied this,
> unless you beat me to it.
>
>> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
>
>>       aliases {
>> +             i2c20 = "/spi@0,7000d400/cros-ec@0/i2c-tunnel";
>
> Is that needed? I'd prefer not to add it unless there's a specific
> reason. I don't think I2C buses need specific names, do they?

It is not strictly needed, but from a usability standpoint it is
terribly helpful.  It serves to make it obvious to someone looking at
the device that it's _not_ an i2c bus associated with the main SoC.
If you don't include a number I believe that the i2c core will pick
the first available number.

It seems worth it to save a few people a few hours of head scratching.

...but this is your dts and if you think it's a terrible idea then
I'll remove it.  It looks to be less critical on tegra than it is on
exynos (which has ~9 i2c busses, they are numbered in the user manual,
and if you have one set to "disable" in the dts then the tunnel will
end up getting a very confusing number).

-Doug
