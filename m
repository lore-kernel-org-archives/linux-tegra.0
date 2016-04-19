From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 7/7] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Tue, 19 Apr 2016 15:19:42 +0530
Message-ID: <5715FF36.9040201@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>	<1460473007-11535-8-git-send-email-ldewangan@nvidia.com>	<CACRpkdZyYiNJfuiTPeivvgVTZwdwh64nkf=f8JczSAVvnT7QeA@mail.gmail.com>	<5710A8A4.90309@nvidia.com>	<CACRpkdZLEozAmv6REcb7ubCNSLxGsYj1whZEKUkdiodZoS=vzg@mail.gmail.com>	<5710BA75.2010503@nvidia.com>	<CACRpkdbr-9Z1JKMVmwNFyMq+Pg+3hT5c9rKZ1y4wZecnidW9Cg@mail.gmail.com>	<5710D4E2.2030801@nvidia.com> <CACRpkdbqjjha6GJnQBzvKjGTswx5Kp_y5nWoj8+AS6H+ds5agQ@mail.gmail.com> <5710F3DC.7090906@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5710F3DC.7090906-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Linus,

On Friday 15 April 2016 07:29 PM, Laxman Dewangan wrote:
>
> On Friday 15 April 2016 07:33 PM, Linus Walleij wrote:
>> On Fri, Apr 15, 2016 at 1:47 PM, Laxman Dewangan 
>> <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> On Friday 15 April 2016 04:45 PM, Linus Walleij wrote:
>>>> On Fri, Apr 15, 2016 at 11:55 AM, Laxman Dewangan 
>>>> <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> wrote:
>>>> But to be sure we would like to know what is actually happening,
>>>> electronically speaking, when you set this up. Do you have any
>>>> idea?
>>>  From electronic point of view, the value of VIL, VIH, VOL, VOH 
>>> (Input/output
>>> voltage level for low and high state) are different when talking for 
>>> 0 t
>>> 1.8V and 0 to 3.3V.
>> Yeah that I get. But since it is switched on a per-pin basis, and
>> this is not about what voltage is actually supplied to the I/O cell,
>> because that comes from the outside, it is a mystery why it is
>> even needed.
>>
>> I understand that there is a bit selecting driving voltage level in
>> the register range, what I don't understand is what that is
>> doing in the I/O cell.
>>
>> The bit in the register must be routed to somehing in the I/O cell
>> and I would like to know what. I take it that an ordinary CMOS
>> totem-pole push-pull output is going to work the same with 1.8
>> and 3.3V alike so it's obviously not enabling any extra transistors
>> or anything.
>>
>>
> I dont have answer for this now and I need to discuss with HW team to 
> get this info.
>
> I will be back here after discussion with HW team.
>
I had discussion with HW team to get this info from analog point of view.

The IO circuitry has to be configured correctly to engage the right 
level shifting circuits between the IO rail and the core voltage rail in 
each direction; and that is the main purpose of this configuration. You 
are correct, the output drivers will naturally drive towards the rails, 
whatever their voltage may be; and the input receiver will likewise 
reference itself naturally to the rail, although the switching threshold 
of the receiver transistors may sometimes need configuration too.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
