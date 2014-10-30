From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH RESEND V4 2/9] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Thu, 30 Oct 2014 09:57:59 -0700
Message-ID: <CAL1qeaFUKmkRGRr06bWK-yqypHCg_U1qJmUJc9p24xiDLDoaug@mail.gmail.com>
References: <1414535277-15645-1-git-send-email-abrestic@chromium.org>
	<1414535277-15645-3-git-send-email-abrestic@chromium.org>
	<20141029113415.GD28356@ulmo.nvidia.com>
	<CAL1qeaG2DFyfsPa2wgDqOkYTbnJ-tXoiV48AF9EaSCf1QCtOyQ@mail.gmail.com>
	<20141030132239.GC19386@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141030132239.GC19386@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 30, 2014 at 6:22 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Oct 29, 2014 at 11:02:36AM -0700, Andrew Bresticker wrote:
> [...]
>> > Maybe something like this patch would be more correct in handling
>> > this:
>> >
>> > diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
>> > index afcb430508ec..85691a7d8ca6 100644
>> > --- a/drivers/mailbox/mailbox.c
>> > +++ b/drivers/mailbox/mailbox.c
>> > @@ -117,10 +117,11 @@ static void poll_txdone(unsigned long data)
>> >                 struct mbox_chan *chan = &mbox->chans[i];
>> >
>> >                 if (chan->active_req && chan->cl) {
>> > -                       resched = true;
>> >                         txdone = chan->mbox->ops->last_tx_done(chan);
>> >                         if (txdone)
>> >                                 tx_tick(chan, 0);
>> > +                       else
>> > +                               resched = true;
>> >                 }
>> >         }
>>
>> ... but we still need to re-arm the timer if tx_tick() submits another
>> message.  Perhaps the better thing to do is to have msg_submit() arm
>> the timer.
>
> I think we need both. If the last transmission isn't done yet we still
> want to keep polling. And we also want to poll if a new message is sent
> subsequently.
>
> Perhaps it would be as easy as moving the poll handling code from
> mbox_send_message() (if (chan->txdone_method == TXDONE_BY_POLL)) into
> msg_submit()? That has the additional advantage of being able to omit
> the polling when an error happens during the mbox' .send_data().

Yes, this is exactly what I've done :).
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
