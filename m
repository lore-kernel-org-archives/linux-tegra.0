From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] Add support for Nyan-big
Date: Thu, 15 Jan 2015 10:35:10 -0800
Message-ID: <CAL1qeaFccsVt8mDEfsOPDfhy1OOTkq5pkPCt-T6mhradAFF1yA@mail.gmail.com>
References: <1417699911-17901-1-git-send-email-sjg@chromium.org>
	<CAAObsKAt=nuj0Gzg0g61q5x=U45FhEu7KyBnVp=2p0y1AraLRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAObsKAt=nuj0Gzg0g61q5x=U45FhEu7KyBnVp=2p0y1AraLRg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Tomeu,

On Thu, Jan 15, 2015 at 9:11 AM, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org> wrote:
> I have seen that coreboot configures these ones differently:
>
> -    ('sdmmc3_clk_pa6',         'sdmmc3',      None,      'none',
> False, False, False, False),
> +    ('sdmmc3_clk_pa6',         'sdmmc3',      None,      'none',
> False, True,  False, False),
> -    ('sdmmc3_clk_lb_out_pee4', 'sdmmc3',      None,      'none',
> False, False, False, False),
> +    ('sdmmc3_clk_lb_out_pee4', 'sdmmc3',      None,      'down',
> False, True,  False, False),
> -    ('sdmmc4_cmd_pt7',         'sdmmc4',      None,      'none',
> False, True,  False, False),
> +    ('sdmmc4_cmd_pt7',         'sdmmc4',      None,      'up',
> False, True,  False, False),
> -    ('dp_hpd_pff0',            'dp',          None,      'up',
> False, True,  False, False),
> +    ('dp_hpd_pff0',            'dp',          None,      'none',
> False, True,  False, False),
>
> May be good to have them match?

I believe these should all be the same between Norrin (Nyan), Big, and
Blaze, so I'd go with whatever is in the Norrin pinmux config (which I
believe is what Simon's patch is based on).

> Besides, I have collected these differences between blaze and big,
> could you check with what you know?

These are the differences you've collected between blaze and big from
the schematic or... ?

> -    ('usb_vbus_en2_pff1',      'rsvd2',       None,      'down',
> True,  False, False, False),
> +    ('usb_vbus_en2_pff1',      'usb',         None,      'up',
> False, True,  False, False),

usb_vbus_en2 is not connected on all Nyan-based boards, so I would
just use whatever the Norrin config uses.

> -    ('usb_vbus_en0_pn4',       'usb',         None,      'none',
> False, True,  True,  False),
> -    ('usb_vbus_en1_pn5',       'usb',         None,      'none',
> False, True,  True,  False),
> +    ('usb_vbus_en0_pn4',       'usb',         None,      'up',
> False, True,  False, False),
> +    ('usb_vbus_en1_pn5',       'usb',         None,      'up',
> False, True,  False, False),

I would expect these to be like Venice2/Norrin: input enabled,
open-drain, no pull.

Thanks,
Andrew
