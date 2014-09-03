From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra: Add APB misc MIPI pad control
Date: Wed, 3 Sep 2014 11:34:54 -0400
Message-ID: <CAOw6vb+Sz9fzxb4HA0yomj0m0=+Z0z9iB10AK=OTAWcxb895ag@mail.gmail.com>
References: <1409678286-28139-1-git-send-email-seanpaul@chromium.org>
 <5406290D.6000404@wwwdotorg.org> <CAOw6vbLFJVtQpXCXvV_b7uvkR5hBeZEN87dr5cANusDXyZjGaQ@mail.gmail.com>
 <540734EB.2060508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <540734EB.2060508-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 3, 2014 at 11:34 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 09/03/2014 09:24 AM, Sean Paul wrote:
>>
>> On Tue, Sep 2, 2014 at 4:31 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>> wrote:
>>>
>>> On 09/02/2014 11:18 AM, Sean Paul wrote:
>>>>
>>>>
>>>> This patch adds MIPI CSI/DSIB pad control mux register
>>>> from the APB misc block to tegra pinctrl.
>>>>
>>>> Without writing to this register, the dsib pads are
>>>> muxed as csi, and cannot be used.
>>>>
>>>> The register is not yet documented in the TRM, here is
>>>> the description:
>>>>
>>>> 70000820: APB_MISC_GP_MIPI_PAD_CTRL_0
>>>>          [31:02] RESERVED
>>>>          [01:01] DSIB_MODE       [CSI=0,DSIB=1]
>>>>          [00:00] RESERVED
>
>
>>>> diff --git a/drivers/pinctrl/pinctrl-tegra124.c
>>>> b/drivers/pinctrl/pinctrl-tegra124.c
>>>
>>>
>>>
>>>> +#define TEGRA_PIN_CSI_DSIB                     _PIN(8)
>>>
>>>
>>>
>>> Is that actually the name of the pin on the Tegra package? I don't see
>>> anything like that the board schematic I have.
>>
>>
>> Well, there's more than one pin affected by this register. They're named:
>>
>> DSI_B_CLK_P
>> DSI_B_CLK_N
>> DSI_B_D0_P
>> DSI_B_D0_N
>> DSI_B_D1_P
>> DSI_B_D1_N
>> DSI_B_D2_P
>> DSI_B_D2_N
>> DSI_B_D3_P
>> DSI_B_D3_N
>>
>> I'll change this to TEGRA_PIN_DSI_B, does that work for you?
>
>
> Would it be possible to add a pin entry for each individual pin, and then
> create a DSI_B group that contains all those pins?

Sure, sounds good to me.

Sean

> Mux selections are made
> on pin groups rather than individual pins, so this shouldn't affect anything
> except for a few data tables in the patch. This way, it keeps the PIN macros
> purely as pins, rather than sometimes using them for groups of pins. As
> background: On Tegra30+, there's a 1:1 mapping between pins and groups for
> the regular pinmux registers, but if you look at the Tegra20 HW/driver,
> you'll see a much smaller set of groups than pins there.
