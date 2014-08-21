From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 0/9] Tegra xHCI support
Date: Thu, 21 Aug 2014 10:26:16 -0700
Message-ID: <CAL1qeaH=8Fgw6Zia3DuBL8wrrYMjZ8pqC2NanYtb5-YVJwmtsg@mail.gmail.com>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
	<CAAObsKDT4BV=fGAFkMxieQnC3HX=zm8G_qJ44yay4qG8inxoPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAObsKDT4BV=fGAFkMxieQnC3HX=zm8G_qJ44yay4qG8inxoPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 21, 2014 at 6:34 AM, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org> wrote:
> On 18 August 2014 19:08, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>
>> Tested on Venice2, Jetson TK1, and Big with a variety of USB2.0 and
>> USB3.0 memory sticks and ethernet dongles using controller firmware from
>> the ChromiumOS tree [2].
>
> Hi Andrew,
>
> do you have any information regarding the port assignments for the
> Blaze board? Would like to test this there.

Sure:
- USB3 port 0 (using PCIe lane 0) and UTMI port 0 are connected to the
USB A connector on the left side,
- UTMI port 1 is connected to an internal hub, which is in turn
connected to the camera, the LTE modem (if present), and one of the
USB A connectors on the right side, and
- UTMI port 2 is connected to the other USB A connector on the right side.
The mapping of ports on the right side varies by SKU (i.e. the one on
the internal hub may be the front or rear USB A port).

The USB3 device tree bits for Venice2 should work just fine for Blaze;
the only real difference is that USB3 port 1/PCIe lane 1 are unused.

Also, because of the board design on Blaze, the fused HS_CURR_LEVEL
values need to be adjusted before being programmed into
USB2_OTG_PAD*_CTL0.  This only affects UTMI ports 0 and 2, so ports
connected to the internal hub should still work.  I'll add a pinconfig
property to address this in the likely event I need to re-spin this
series.  Or, if you like, I can send a follow-on patch to this set to
add the property.
