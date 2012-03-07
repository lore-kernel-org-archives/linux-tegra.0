From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/3] arm: tegra: dts: USB Updates for Tegra legacy mode / OTG
Date: Tue, 6 Mar 2012 21:06:10 -0800
Message-ID: <CAPnjgZ3gBQyZ3BMesN+2_8ytYEz-0XtYGQwyDL3bUAp+pLoxdw@mail.gmail.com>
References: <1328288172-8059-1-git-send-email-sjg@chromium.org>
	<74CDBE0F657A3D45AFBB94109FB122FF178E5D2FF5@HQMAIL01.nvidia.com>
	<CAPnjgZ1rXEGbi3m3HeWiUxG_TbmUug0C0QZgb7_9Eiz-xPMHwg@mail.gmail.com>
	<CAOesGMjXkFOxfp9fnhwKFZSoUJmHObk7FaiaNNj2NSyyNMTjkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMjXkFOxfp9fnhwKFZSoUJmHObk7FaiaNNj2NSyyNMTjkw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Olof,

On Tue, Mar 6, 2012 at 8:40 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Tue, Mar 6, 2012 at 7:16 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> +Olof
>>
>> Hi,
>>
>> On Fri, Feb 3, 2012 at 11:59 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> Simon Glass wrote at riday, February 03, 2012 9:56 AM:
>>>> This little series brings in some bindings that seem useful for U-Boot.
>>>>
>>>> I am working mostly in U-Boot, but since there is no shared .dts repo
>>>> I was asked to commit these changes to the kernel. I do not propose to
>>>> update the Linux USB drivers to match.
>>>
>>> I think the series looks reasonable, so:
>>>
>>> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org<>
>>>
>>> (I note that the kernel's USB driver for USB1 doesn't attempt to clear
>>> legacy mode; I wonder how we're getting away with that. Perhaps it's
>>> only been tested with a bootloader that's already cleared legacy mode)
>>>
>>
>> How does this series get picked up, please?
>
> It drowned in the patch floods you've been sending, and it wasn't
> addressed directly to me so I ignored it.
>
> Please resend and I'll apply.

You'll be happy to hear that the flood is mostly over now. I have
resent and copied you this time.

Regards,
Simon

>
>
> Thanks,
>
> -Olof
