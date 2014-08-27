From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/9] of: Add NVIDIA Tegra XUSB mailbox binding
Date: Wed, 27 Aug 2014 09:33:59 -0700
Message-ID: <CAL1qeaEkTPcn2C+KTO539NgAW_9DS0W+D8q5L9GwSwVop9Du0Q@mail.gmail.com>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
	<1408381705-3623-2-git-send-email-abrestic@chromium.org>
	<53FB84F7.8030509@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53FB84F7.8030509-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TbrhsbdSgBK9A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 25, 2014 at 11:48 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 08/18/2014 11:08 AM, Andrew Bresticker wrote:
>
>> diff --git a/include/dt-bindings/mailbox/tegra-xusb-mailbox.h
>> b/include/dt-bindings/mailbox/tegra-xusb-mailbox.h
>
>
>> +#define TEGRA_XUSB_MBOX_CHAN_HOST      0
>> +#define TEGRA_XUSB_MBOX_CHAN_PHY       1
>
>
> I can't work out how these values relate to hardware at all. Are they in
> fact properties of the particular firmware that's loaded into the XUSB
> module? If so, I don't think the DT should contain these values at all.

Yes this is rather ugly... they're used by software for the demuxing
of messages and don't correspond to actual hardware.

> I wonder if the individual MBOX_CMD_* values from patch 2 are any
> better, although I think those are also defined by the firmware, not the
> hardware?

They are indeed defined by the firmware, so this would become an issue
if the firmware API ever changed.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
