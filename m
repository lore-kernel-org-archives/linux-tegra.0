From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: serial: of-serial: fetch line number from DT
Date: Mon, 10 Nov 2014 13:49:29 -0800
Message-ID: <CAOesGMg_fK62av7kX_n_8xXhNShnKOGv9RCp=UNQxeMcmSYeyA@mail.gmail.com>
References: <CAOesGMjzs=dThDv6S8Xvo+ym-XECaQhTQ8NV6t46fQZ1LoJnHw@mail.gmail.com>
	<54613065.1090300@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54613065.1090300-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 10, 2014 at 1:38 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 11/10/2014 02:34 PM, Olof Johansson wrote:
>>
>> Greg,
>>
>> This commit:
>>
>> commit 1bd8324535ec1ff44aef55c0e40b9e7d56b310fb
>> Author: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>> Date:   Mon Nov 3 23:16:54 2014 +0100
>>
>>      serial: of-serial: fetch line number from DT
>
> ...
>>
>> Broke a whole lot of tegra boards in last night's -next here. In
>> particular, I've been looking at tegra20-seaboard, which now doesn't
>> boot with console any more.
>>
>> http://arm-soc.lixom.net/bootlogs/next/next-20141110/
>>
>> Unfortunately, tegra has for a long time been specifying the aliases
>> as a fixed 1:1 mapping, but most environments rely on ttyS0 being the
>> first _activated_ serial port. That's obviously going to break things
>> here. :(
>
> ...
>>
>> Stephen: I suppose the best way to handle this on tegra is to specify
>> the aliases per-board instead of in the soc dtsi today.
>
>
> IIRC, there was a deliberate request to name the Tegra UARTs after the SoC
> ports rather than board ports, so that it'd be obvious to people which port
> was which. I'm not sure if we can change the aliases in the Tegra DTs now
> that people may have got used to them?

I think that's a great idea in general, but they've been this way now
for 4 years and it'll mean everyone changing bootargs and console
configurations (where to spawn getty) everywhere. :(


-Olof
