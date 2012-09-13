From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] USB: phy: re-organize tegra phy driver
Date: Wed, 12 Sep 2012 22:36:44 -0600
Message-ID: <505162DC.3060007@wwwdotorg.org>
References: <1347447481-25574-1-git-send-email-vbyravarasu@nvidia.com> <5050D622.7080704@wwwdotorg.org> <D958900912E20642BCBC71664EFECE3E6DDEFB8D80@BGMAIL02.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D958900912E20642BCBC71664EFECE3E6DDEFB8D80-QZ+emBqkIFBDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/12/2012 09:49 PM, Venu Byravarasu wrote:
> Stephen Warren wrote at Thursday, September 13, 2012 12:06 AM:
>> On 09/12/2012 04:58 AM, Venu Byravarasu wrote:
>>> Nvidia produces several Tegra SOCs viz Tegra2, Tegra3 etc.
>>> In order to support USB phy drivers on these SOCs, existing
>>> phy driver is split into SOC agnostic common USB phy driver and
>>> tegra2 specific USB phy driver.
>>> This will facilitate easy addition & deletion of phy drivers for
>>> Tegra SOCs.
>>
>> For capitalization/related reasons, I would re-write the commit
>> description as:
>>
>> NVIDIA produces several Tegra SoCs viz Tegra20, Tegra30 etc.
>> In order to support USB PHY drivers on these SoCs, existing
> 
> Will change tegra2 to Tegra20 and similar for Tegra30 & NVIDIA.
> However as phy is not an acronym, should we still have it in Caps?

I'd certainly expect to see PHY in all-caps, yes. As entirely arbitrary
justification, see the precedent at:

https://en.wikipedia.org/wiki/PHY_(chip)

Sorry for bike-shedding, but I'm picky about that kind of thing, at
least sometimes.
