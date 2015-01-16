From: Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>
Subject: Re: [PATCH v2] Add support for Nyan-big
Date: Fri, 16 Jan 2015 17:00:26 +0100
Message-ID: <CAAObsKAEKXVrE5iR9C5fXymse2D7u-41u8QKwC9eQEGTTXWxEw@mail.gmail.com>
References: <1417699911-17901-1-git-send-email-sjg@chromium.org>
 <CAAObsKAt=nuj0Gzg0g61q5x=U45FhEu7KyBnVp=2p0y1AraLRg@mail.gmail.com> <CAL1qeaFccsVt8mDEfsOPDfhy1OOTkq5pkPCt-T6mhradAFF1yA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaFccsVt8mDEfsOPDfhy1OOTkq5pkPCt-T6mhradAFF1yA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 15 January 2015 at 19:35, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Hi Tomeu,
>
> On Thu, Jan 15, 2015 at 9:11 AM, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org> wrote:
>> I have seen that coreboot configures these ones differently:
>>
>> -    ('sdmmc3_clk_pa6',         'sdmmc3',      None,      'none',
>> False, False, False, False),
>> +    ('sdmmc3_clk_pa6',         'sdmmc3',      None,      'none',
>> False, True,  False, False),
>> -    ('sdmmc3_clk_lb_out_pee4', 'sdmmc3',      None,      'none',
>> False, False, False, False),
>> +    ('sdmmc3_clk_lb_out_pee4', 'sdmmc3',      None,      'down',
>> False, True,  False, False),
>> -    ('sdmmc4_cmd_pt7',         'sdmmc4',      None,      'none',
>> False, True,  False, False),
>> +    ('sdmmc4_cmd_pt7',         'sdmmc4',      None,      'up',
>> False, True,  False, False),
>> -    ('dp_hpd_pff0',            'dp',          None,      'up',
>> False, True,  False, False),
>> +    ('dp_hpd_pff0',            'dp',          None,      'none',
>> False, True,  False, False),
>>
>> May be good to have them match?
>
> I believe these should all be the same between Norrin (Nyan), Big, and
> Blaze, so I'd go with whatever is in the Norrin pinmux config (which I
> believe is what Simon's patch is based on).

Even dp_hpd? In my testing I need to have pullup on big and with no
pull on blaze for the panel to work. I'm very weak in reading
schematics, but I see what I think is a pullup resistor in Big, and
none in Blaze.

>> Besides, I have collected these differences between blaze and big,
>> could you check with what you know?
>
> These are the differences you've collected between blaze and big from
> the schematic or... ?

Mainly from the ChromeOS sources, but I have checked in the schematics.

>> -    ('usb_vbus_en2_pff1',      'rsvd2',       None,      'down',
>> True,  False, False, False),
>> +    ('usb_vbus_en2_pff1',      'usb',         None,      'up',
>> False, True,  False, False),
>
> usb_vbus_en2 is not connected on all Nyan-based boards, so I would
> just use whatever the Norrin config uses.

Agreed.

>> -    ('usb_vbus_en0_pn4',       'usb',         None,      'none',
>> False, True,  True,  False),
>> -    ('usb_vbus_en1_pn5',       'usb',         None,      'none',
>> False, True,  True,  False),
>> +    ('usb_vbus_en0_pn4',       'usb',         None,      'up',
>> False, True,  False, False),
>> +    ('usb_vbus_en1_pn5',       'usb',         None,      'up',
>> False, True,  False, False),
>
> I would expect these to be like Venice2/Norrin: input enabled,
> open-drain, no pull.

What I have found is that coreboot configures them to be pullup for
both boards, and that in my testing the usb ports are enabled in that
case in both boards. If they have no pull, they work on big but don't
on blaze. The DTs in the ChromeOS kernel also configure those pins to
be pull up. And from my limited understanding of the schematics I
have, both lines have pullup resistors in both boards.

So in summary, I think that we should make this change to the pinmux
definition that Simon sent:

-    ('usb_vbus_en0_pn4',       'usb',         None,      'none',
False, True,  True,  False),
-    ('usb_vbus_en1_pn5',       'usb',         None,      'none',
False, True,  True,  False),
+    ('usb_vbus_en0_pn4',       'usb',         None,      'up',
False, True,  False, False),
+    ('usb_vbus_en1_pn5',       'usb',         None,      'up',
False, True,  False, False),

And that the Blaze should have this change, respective to Big:

-    ('dp_hpd_pff0',            'dp',          None,      'up',
False, True,  False, False),
+    ('dp_hpd_pff0',            'dp',          None,      'none',
False, True,  False, False),

Does it make sense?

Thanks,

Tomeu

> Thanks,
> Andrew
