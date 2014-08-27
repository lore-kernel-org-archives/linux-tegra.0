From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/9] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Thu, 28 Aug 2014 00:56:35 +0530
Message-ID: <CAJe_ZhexxKSDfJeojY5FETdzvnA6082mcXjpfQ-oaMNRTN=-Sw@mail.gmail.com>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
	<1408381705-3623-3-git-send-email-abrestic@chromium.org>
	<53FB8820.4010202@wwwdotorg.org>
	<CAL1qeaERHeKKNpqh9qHOppgT7ymvntisdjVvZheP78U6NaPz-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaERHeKKNpqh9qHOppgT7ymvntisdjVvZheP78U6NaPz-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-tegra@vger.k
List-Id: linux-tegra@vger.kernel.org

On 27 August 2014 23:08, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Mon, Aug 25, 2014 at 12:01 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

>> I'm not even sure if it's appropriate for the low-level mailbox driver to
>> know about the semantics of the message, rather than simply sending them on
>> to the client driver? Perhaps when drivers register(?) for callbacks(?) for
>> messages, they should state which types of messages they want to listen to?
>
> So there's not really a way for the client driver to tell the mailbox
> driver which types of messages it wants to listen to on a particular
> channel with the mailbox framework - it simply provides a way for
> clients to bind with channels.  I think there are a couple of options
> here, either: a) have a channel per message (as you mentioned in the
> previous patch), which allows the client to only register for messages
> (channels) it wants to handle, or b) extend the mailbox framework to
> allow shared channels so that both clients can receive messages on the
> single channel and handle messages appropriately.   The disadvantage
> of (a) is that the commands are firmware defined and could
> theoretically change between releases of the firmware, though I'm not
> sure how common that is in practice.  So that leaves (b) - Jassi, what
> do you think about having shared (non-exclusive) channels?
>
n++ ... 'mailbox' is one such device that imbibes properties of local
controller hardware and the remote firmware. Change in remote f/w's
behavior might require the controller driver to change besides our
client driver. A typical example is format of payloads (if
involved).... a client and mailbox controller driver have direct
understanding of the packet format ... which is likely to change with
remote f/w.  So if the original concern "why are we doing s/w protocol
stuff in controller driver?" won't go away by providing for shared
channels (which would have its own tradeoffs).

BTW, on DMAEngine we are moving towards virtual channels backed by
limited physical ones ... your setup looks quite similar. So your
demuxer doesn't hurt my eyes at all.

-jassi
