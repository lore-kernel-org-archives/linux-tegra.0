From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: enable console framebuffer rotation
Date: Fri, 9 May 2014 23:47:15 +0900
Message-ID: <CAAVeFuJkdfYZdSvh4OuwqxiuyyoYtBnHH16L4gJrbAvo2F-w0w@mail.gmail.com>
References: <1399432682-677-1-git-send-email-acourbot@nvidia.com>
 <536A57FA.2090608@wwwdotorg.org> <536AC45F.6080608@nvidia.com> <536CE414.5030406@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536CE414.5030406-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 9, 2014 at 11:20 PM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>=
 wrote:
> Am 08.05.2014 01:40, schrieb Alex Courbot:
>> On 05/08/2014 12:57 AM, Stephen Warren wrote:
>>> On 05/06/2014 09:18 PM, Alexandre Courbot wrote:
>>>> Console rotation is needed for devices like Tegra Note 7 and NVIDI=
A
>>>> SHIELD to get the boot console in the expected orientation.
>>>
>>> I've squashed this into Tegra's for-3.16/defconfig branch.
>>>
>>> Can you please also update multi_v7_defconfig, and send that change=
 to
>>> arm-soc (arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org) to be applied. Thanks.
>>
>> I omitted doing this for now because the devices that require this
>> option (TN7/SHIELD) need a custom build with appended DTB and/or
>> command-line anyway. Therefore they cannot use a multi-mach kernel
>
> What does appending a .dtb have to do with whether or not to use a
> multi-mach kernel? We package zImage/uImage and .dtbs separately, so
> surely the multi_v7_defconfig should be kept working with Tegra devic=
es.
> Appending a .dtb only comes into play for preparing installation imag=
es.

When appending a dtb the kernel image must also be built with
CONFIG_ARM_APPENDED_DTB, which I guess is not an option we want to add
by default to Tegra and probably even less to multi_v7. So since the
kernel config needs to be changed anyway, I thought we would always
want to use tegra_defconfig as a basis for these devices.

Not that adding CONFIG_FRAMEBUFFER_CONSOLE_ROTATION to multi_v7 would
inflate the resulting kernel much, though.
