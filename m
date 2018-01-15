From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] arm64: tegra: Add Tegra194 chip device tree
Date: Mon, 15 Jan 2018 11:21:24 -0600
Message-ID: <CAL_JsqLH8FJ+ppFrtxS7ja-Apkj=RfDcDoFOtNPsnbb6+Pgp-w@mail.gmail.com>
References: <1515387278-29777-1-git-send-email-mperttunen@nvidia.com>
 <1515387278-29777-6-git-send-email-mperttunen@nvidia.com> <20180111215638.f5vxykb2vvxeypmk@rob-hp-laptop>
 <7085e085-134c-27cf-6ee7-ae691e63d454@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7085e085-134c-27cf-6ee7-ae691e63d454-/1wQRMveznE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 12, 2018 at 1:22 AM, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org> wrote:
> On 11.01.2018 23:56, Rob Herring wrote:
>>
>> On Mon, Jan 08, 2018 at 06:54:37AM +0200, Mikko Perttunen wrote:
>>>
>>> Add the chip-level device tree, including binding headers, for the
>>> NVIDIA Tegra194 "Xavier" system-on-chip. Only a small subset of devices
>>> are initially available, enough to boot to UART console.
>>>
>>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---

>>> +       interrupt-parent = <&gic>;
>>> +       #address-cells = <2>;
>>> +       #size-cells = <2>;
>>> +
>>> +       uarta: serial@3100000 {
>>
>>
>> These should all be under a bus node. Tegra failed to do this at the
>> start and we're still copy-n-pasting this mistake.
>>
>> Then you probably don't need 2 address and size cells for all the
>> peripherals.
>
>
> So I should create one big simple-bus node and put everything with an
> address apart from /memory (and maybe /sysram) inside it?

Yes. Though you can have multiple buses if that makes sense. Things
like fixed clocks, gpio-leds, etc. (typically board level) that don't
have any bus should stay at the top level.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
