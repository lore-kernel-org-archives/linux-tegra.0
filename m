From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] USB: ehci-tegra: fix inefficient copy of unaligned
 buffers
Date: Tue, 7 Apr 2015 21:59:32 +0200
Message-ID: <20150407195932.GB12027@localhost>
References: <1428400012-7563-3-git-send-email-johan@kernel.org>
 <Pine.LNX.4.44L0.1504071127210.1430-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1504071127210.1430-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 07, 2015 at 11:30:15AM -0400, Alan Stern wrote:
> On Tue, 7 Apr 2015, Johan Hovold wrote:
> 
> > Make sure only to copy any actual data rather than the whole buffer,
> > when releasing the temporary buffer used for unaligned transfer buffers.
> > 
> > Note that the corresponding fix of musb also fixes a lockup on
> > disconnect, where repeated failed transfers would starve the hub
> > workqueue from processing the disconnect, which would have prevented the
> > urbs from being resubmitted. In this case there is no data to forward,
> > but the full buffer length was being copied nonetheless.
> 
> This is wrong for isochronous transfers, because the transfer data
> generally isn't contiguous in memory.
> 
> It would be okay to do this for other transfer types, though.

Thanks for pointing that out. I'll re-spin the series tomorrow.

Johan
