From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V6 05/12] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Tue, 2 Dec 2014 11:06:18 -0800
Message-ID: <CAL1qeaEN8HjGYyW0+WLyEUzSPgCKiQUo0jRbbsY1rsfamijA3A@mail.gmail.com>
References: <1416874644-12070-1-git-send-email-abrestic@chromium.org>
	<1416874644-12070-6-git-send-email-abrestic@chromium.org>
	<20141202094741.GC6135@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141202094741.GC6135@ulmo>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>"linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 2, 2014 at 1:47 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Nov 24, 2014 at 04:17:17PM -0800, Andrew Bresticker wrote:
>> The Tegra xHCI controller's firmware communicates requests to the host
>> processor through a mailbox interface.  While there is only a single
>> physical channel, messages sent by the controller can be divided
>> into two groups: those intended for the PHY driver and those intended
>> for the host-controller driver.  The requesting driver is assigned
>> one of two virtual channels when the single physical channel is
>> requested.  All incoming messages are sent to both virtual channels.
>>
>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Thierry,
>>
>> I've left this as a separate driver because I don't think it should be
>> combined with the xHCI host.  Stephen and I discussed this earlier in
>> review of v1 of this series and he agreed that the mailbox belongs in
>> its own DT node and driver.
>
> My objection wasn't strictly against merging the drivers. What I don't
> want to see is two devices sharing the same memory-mapped regions in DT.
>
> That's based on earlier discussion with Stephen as well, because we have
> had the same problem with USB and USB-PHY before. Unless I completely
> misinterpreted we came to the conclusion that we should avoid this in
> the future.

Yes, I understand your objection to having multiple drivers map the
same IO memory, however Stephen and I discussed this before [1] and
came to the conclusion that, although mapping the MMIO region in both
drivers was non-ideal, the alternatives had their own drawbacks as
well and that the approach I had taken was fine.

> Like I said, this doesn't mean that both need to be in the same driver.
> We could use MFD for example, or provide an entry point in the mailbox
> driver that can be called from the XUSB driver to instantiate the
> mailbox (which is really the same as MFD).

This does not look like the typical MFD, but I would agree that it's
the only reasonable alternative.  If Lee is fine with it, then I
suppose I could go the MFD route...  Lee: for context, the mailbox
registers live in one of the host-controller's MMIO regions - there
are no other shared resources.  This has been discussed, along with a
possible binding, in [1] as well.

[1] https://lkml.org/lkml/2014/8/27/727
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
