From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v3 1/2] usb: host: ehci-tegra: Grab the correct UTMI pads
 reset
Date: Wed, 4 May 2016 07:57:10 -0700
Message-ID: <20160504145710.GA14708@kroah.com>
References: <1462372800-30900-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1462372800-30900-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, May 04, 2016 at 04:39:59PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> There are three EHCI controllers on Tegra SoCs, each with its own reset
> line. However, the first controller contains a set of UTMI configuration
> registers that are shared with its siblings. These registers will only
> be reset as part of the first controller's reset. For proper operation
> it must be ensured that the UTMI configuration registers are reset
> before any of the EHCI controllers are enabled, irrespective of the
> probe order.
> 
> Commit a47cc24cd1e5 ("USB: EHCI: tegra: Fix probe order issue leading to
> broken USB") introduced code that ensures the first controller is always
> reset before setting up any of the controllers, and is never again reset
> afterwards.
> 
> This code, however, grabs the wrong reset. Each EHCI controller has two
> reset controls attached: 1) the USB controller reset and 2) the UTMI
> pads reset (really the first controller's reset). In order to reset the
> UTMI pads registers the code must grab the second reset, but instead it
> grabbing the first.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Any reason you don't want this backported to stable kernels?

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
