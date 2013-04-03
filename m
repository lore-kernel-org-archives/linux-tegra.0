From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] usb: host: ehci-tegra: Fix oops in error cleanup
Date: Wed, 3 Apr 2013 11:40:50 -0700
Message-ID: <20130403184050.GA9420@kroah.com>
References: <1364935250-26422-1-git-send-email-thierry@gilfi.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364935250-26422-1-git-send-email-thierry-TKn1d31QZ+o@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry-TKn1d31QZ+o@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 02, 2013 at 10:40:50PM +0200, Thierry Reding wrote:
> The cleanup path checks whether the transceiver was properly initialized
> using IS_ERR(). However it can also happen that the cleanup path is run
> before the transceiver was initialized (or the operating mode isn't set
> to TEGRA_USB_OTG) and is therefore NULL. Add a separate label for error
> unwinding and initialize the transceiver field to ERR_PTR(-ENODEV) when
> the operating mode isn't TEGRA_USB_OTG to allow for consistent checking.
> 
> Signed-off-by: Thierry Reding <thierry-TKn1d31QZ+o@public.gmane.org>
> Acked-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/usb/host/ehci-tegra.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

This patch fails to apply to my tree:

checking file drivers/usb/host/ehci-tegra.c
Hunk #2 succeeded at 765 with fuzz 1.
Hunk #3 succeeded at 774 with fuzz 2 (offset 1 line).
Hunk #4 FAILED at 796.
1 out of 4 hunks FAILED

Can you please fix it up and resend it, keeping the needed acks on it?

thanks,

greg k-h
