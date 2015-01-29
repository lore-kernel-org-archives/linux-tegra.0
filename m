From: Tomeu Vizoso <tomeu.vizoso-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] Add support for Nyan-big
Date: Thu, 29 Jan 2015 15:22:40 +0100
Message-ID: <CAAObsKBzJxWKhh+8YB=LHCoLxK7eph-yrZe4TEEFfiyx7TE6HA@mail.gmail.com>
References: <1417699911-17901-1-git-send-email-sjg@chromium.org>
 <CAAObsKAt=nuj0Gzg0g61q5x=U45FhEu7KyBnVp=2p0y1AraLRg@mail.gmail.com>
 <CAL1qeaFccsVt8mDEfsOPDfhy1OOTkq5pkPCt-T6mhradAFF1yA@mail.gmail.com>
 <CAAObsKAEKXVrE5iR9C5fXymse2D7u-41u8QKwC9eQEGTTXWxEw@mail.gmail.com> <CAL1qeaFgr5rTGfFKV4-8aSD6pTNQc48OV4Y=GquFa8AXcnLjgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaFgr5rTGfFKV4-8aSD6pTNQc48OV4Y=GquFa8AXcnLjgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 16 January 2015 at 19:06, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Fri, Jan 16, 2015 at 8:00 AM, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org> wrote:
>> On 15 January 2015 at 19:35, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>> Hi Tomeu,
>>>
>>> On Thu, Jan 15, 2015 at 9:11 AM, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org> wrote:
>>>> I have seen that coreboot configures these ones differently:
>>>>
>>>> -    ('sdmmc3_clk_pa6',         'sdmmc3',      None,      'none',
>>>> False, False, False, False),
>>>> +    ('sdmmc3_clk_pa6',         'sdmmc3',      None,      'none',
>>>> False, True,  False, False),
>>>> -    ('sdmmc3_clk_lb_out_pee4', 'sdmmc3',      None,      'none',
>>>> False, False, False, False),
>>>> +    ('sdmmc3_clk_lb_out_pee4', 'sdmmc3',      None,      'down',
>>>> False, True,  False, False),
>>>> -    ('sdmmc4_cmd_pt7',         'sdmmc4',      None,      'none',
>>>> False, True,  False, False),
>>>> +    ('sdmmc4_cmd_pt7',         'sdmmc4',      None,      'up',
>>>> False, True,  False, False),
>>>> -    ('dp_hpd_pff0',            'dp',          None,      'up',
>>>> False, True,  False, False),
>>>> +    ('dp_hpd_pff0',            'dp',          None,      'none',
>>>> False, True,  False, False),
>>>>
>>>> May be good to have them match?
>>>
>>> I believe these should all be the same between Norrin (Nyan), Big, and
>>> Blaze, so I'd go with whatever is in the Norrin pinmux config (which I
>>> believe is what Simon's patch is based on).
>>
>> Even dp_hpd? In my testing I need to have pullup on big and with no
>> pull on blaze for the panel to work. I'm very weak in reading
>> schematics, but I see what I think is a pullup resistor in Big, and
>> none in Blaze.
>
> Maybe I'm missing something, but I don't see any difference between
> Big and Blaze with respect to dp_hpd.  Coreboot also configures them
> both with no pull.  I'll have to look into this more...

Sorry, I think I got confused somewhere there. In my most recent
testing, I need dp_hpd to be configured with no pull on big or I get
spurious interrupts. That caused problems only sometimes as it only
manifested in a race within the drm subsystem.

Simon, do you mind if I resend your patch to tegra-pinmux-scripts with
that pin fixed?

Thanks,

Tomeu

>> So in summary, I think that we should make this change to the pinmux
>> definition that Simon sent:
>>
>> -    ('usb_vbus_en0_pn4',       'usb',         None,      'none',
>> False, True,  True,  False),
>> -    ('usb_vbus_en1_pn5',       'usb',         None,      'none',
>> False, True,  True,  False),
>> +    ('usb_vbus_en0_pn4',       'usb',         None,      'up',
>> False, True,  False, False),
>> +    ('usb_vbus_en1_pn5',       'usb',         None,      'up',
>> False, True,  False, False),
>
> Yes.  It ends up not mattering what the pull is when using a mainline
> DTS since they use a fixed regulator to drive these pins high, but
> you're right, the most correct thing for VBUS is input enabled with
> pull-up.
