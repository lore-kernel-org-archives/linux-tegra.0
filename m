From: Olliver Schinagl <o.schinagl-U3FVU11NWA554TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH] serial: Do not treat the IIR register as a bitfield
Date: Fri, 31 Mar 2017 13:28:00 +0200
Message-ID: <03bb0be7-3534-0f26-9f79-061282331186__27737.3537574478$1490959699$gmane$org@schinagl.nl>
References: <20170329184431.6226-1-oliver@schinagl.nl>
 <6be65e8b-eea4-08ed-0b30-5c0608764a83@ti.com>
 <D694FA74-1F31-4B57-8858-2DBE8DE57D45@schinagl.nl>
 <20170330141153.mvxa6iqj72hnhlu3@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170330141153.mvxa6iqj72hnhlu3-AKGzg7BKzIDYtjvyW6yDsg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org" <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, Ed Blake <ed.blake-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jason
List-Id: linux-tegra@vger.kernel.org

Hey Ted,

On 30-03-17 16:11, Theodore Ts'o wrote:
> While you're fixing this, there's a bug in samples/vfio-mdev/mtty.c:
>
> 		u8 ier = mdev_state->s[index].uart_reg[UART_IER];
> 		*buf = 0;
>
> 		mutex_lock(&mdev_state->rxtx_lock);
> 		/* Interrupt priority 1: Parity, overrun, framing or break */
> 		if ((ier & UART_IER_RLSI) && mdev_state->s[index].overrun)
> 			*buf |= UART_IIR_RLSI;
>
> 		/* Interrupt priority 2: Fifo trigger level reached */
> 		if ((ier & UART_IER_RDI) &&
> 		    (mdev_state->s[index].rxtx.count ==
> 		      mdev_state->s[index].intr_trigger_level))
> 			*buf |= UART_IIR_RDI;
>
> 		/* Interrupt priotiry 3: transmitter holding register empty */
> 		if ((ier & UART_IER_THRI) &&
> 		    (mdev_state->s[index].rxtx.head ==
> 				mdev_state->s[index].rxtx.tail))
> 			*buf |= UART_IIR_THRI;
>
> 		/* Interrupt priotiry 4: Modem status: CTS, DSR, RI or DCD  */
> 		if ((ier & UART_IER_MSI) &&
> 		    (mdev_state->s[index].uart_reg[UART_MCR] &
> 				 (UART_MCR_RTS | UART_MCR_DTR)))
> 			*buf |= UART_IIR_MSI;
>
> 		/* bit0: 0=> interrupt pending, 1=> no interrupt is pending */
> 		if (*buf == 0)
> 			*buf = UART_IIR_NO_INT;
>
> It's treating the UART_IIR_* fields as a bitmask which is bad enough,
> but in the "Interrupt priority 4" case, UART_IIR_MSI is zero, so
> "*buf |= UART_IIR_MSI" is a no-op.   And in the case where the modem
> status interrupt is the only thing set, *buf will be 0, and UART_IIR_NO_INT
> gets set erroneously.
>
> So this is another example of the bug of trying to treat the
> UART_IIR_* fields as a bitmask....
>
> Yes, it's only sample code, but best fix it now before it gets copied
> elsewhere and metastisizes.   :-)

Yeah, I notice that a lot of the code I modified in this patch was 
either copy pasted or 'inspired by'. So having bad examples around is 
really bad as you state!

Additionally the friendly build bot reminded me there are other 
subsystems that do this as well, so I'll update the patch to get those 
too and this one too.

Olliver

>
> 							- Ted
> 							
>
