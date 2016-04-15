From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 7/7] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Fri, 15 Apr 2016 10:38:46 -0600
Message-ID: <57111916.8030304@wwwdotorg.org>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-8-git-send-email-ldewangan@nvidia.com>
 <CACRpkdZyYiNJfuiTPeivvgVTZwdwh64nkf=f8JczSAVvnT7QeA@mail.gmail.com>
 <5710A8A4.90309@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5710A8A4.90309-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/15/2016 02:39 AM, Laxman Dewangan wrote:
>
> On Friday 15 April 2016 01:38 PM, Linus Walleij wrote:
>> On Tue, Apr 12, 2016 at 4:56 PM, Laxman Dewangan
>> <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>
>>> NVIDIA Tegra210 supports the IO pads which can operate at 1.8V
>>> or 3.3V I/O voltage levels. Also the IO pads can be configured
>>> for power down state if it is not used. SW needs to configure the
>>> voltage level of IO pads based on IO rail voltage and its power
>>> state based on platform usage.
>>>
>>> The voltage and power state configurations of pads are provided
>>> through pin control frameworks. Add pin control driver for Tegra's
>>> IO pads' voltage and power state configurations.

>> Even if Tegra is not using the generic code for handling the
>> standard bindings (GENERIC_PINCONF) it doesn't stop
>> you from using the generic bindings and contributing to them.
>>
>> Historically you have a few custom bindings like these:
>>
>> nvidia,pins
>> nvidia,function
>> nvidia,pull
>> nvidia,tristate
>>
>> etc etc, but that is just unfortunate and due to preceding the
>> generic bindings. I would appreciate if you started to support
>> the generic bindings in parallel, but I'm not gonna push that issue.
>
> Yaah, these are in my plate to cleanup. Let me work with Stephen, what
> he think here.

For existing chips, we must always support the existing bindings. 
There's no point moving to the new bindings since it'll just add more 
code that just does the same thing.

For new chips perhaps it makes sense to move to the new standardized 
properties. That said, I don't expect we'll need pinmux on those chips 
since it's guaranteed that FW will set up the static pinmux, and HW 
explicitly doesn't support dynamic pinmuxing?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
