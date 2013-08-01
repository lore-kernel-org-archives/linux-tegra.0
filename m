From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: DTS: tegra: Add USB entries for Tegra30
Date: Thu, 1 Aug 2013 18:15:48 +0300
Message-ID: <51FA7BA4.8010301@nvidia.com>
References: <1375292543-7896-1-git-send-email-ttynkkynen@nvidia.com> <1375292543-7896-2-git-send-email-ttynkkynen@nvidia.com> <51F98C27.40904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51F98C27.40904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/01/2013 01:13 AM, Stephen Warren wrote:
> On 07/31/2013 11:42 AM, Tuomas Tynkkynen wrote:
>> Add device tree entries for the 3 USB controllers and PHYs and
>> enable the third controller on Cardhu and Beaver boards.
>>
>> Fix VBUS regulator entries on Beaver. The GPIO pins were wrong.
> 
> That much is correct.
> 
>> Also, a third GPIO is required to power the pullup resistors that drive
>> the VBUS voltage switches, so add an regulator entry for that.
> 
> That is not true. GMI_AD13 / PH5 / 61 is a signal that pulls up all of
> USB1 VBUS, USB3 VBUS, and GMI_AD15, which as far as I can tell is
> entirely unrelated to USB in any way.

I sent a v2 that enables the internal pullups on those pins.

> This part of the change should be removed. I know you mentioned that
> downstream does this, but that means very little; there are many
> mistakes there.

It looks like the pullup resistor from PH5 to GMI_AD15 was added in a later board revision,
so the HW guys are to blame this time.
