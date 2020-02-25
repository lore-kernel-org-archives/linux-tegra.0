From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] USB: Replace zero-length array with flexible-array member
Date: Tue, 25 Feb 2020 09:44:57 +0100
Message-ID: <20200225084457.GO32540@localhost>
References: <20200220132017.GA29262@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200220132017.GA29262@embeddedor>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Gustavo A. R. Silva" <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Minas Harutyunyan <hminas-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 20, 2020 at 07:20:17AM -0600, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
> ---
>  drivers/usb/atm/usbatm.h              | 2 +-
>  drivers/usb/dwc2/hcd.h                | 2 +-
>  drivers/usb/host/ehci-tegra.c         | 2 +-
>  drivers/usb/host/ehci.h               | 4 ++--
>  drivers/usb/host/fotg210.h            | 2 +-
>  drivers/usb/host/ohci.h               | 4 ++--
>  drivers/usb/host/xhci-mtk.h           | 2 +-
>  drivers/usb/host/xhci.h               | 4 ++--
>  drivers/usb/serial/io_usbvend.h       | 4 ++--
>  drivers/usb/serial/ti_usb_3410_5052.c | 4 ++--
>  include/linux/usb.h                   | 4 ++--
>  include/linux/usb/audio-v2.h          | 2 +-
>  include/linux/usb/audio-v3.h          | 2 +-
>  include/linux/usb/gadget.h            | 2 +-
>  include/linux/usb/hcd.h               | 2 +-
>  include/linux/usbdevice_fs.h          | 2 +-
>  16 files changed, 22 insertions(+), 22 deletions(-)

Looks like your scripts still doesn't catch every instance. A simple
grep like 

	git grep -A1 '\[0\];$' drivers/usb/ | grep -B1 '}'

found at least three more in 

	drivers/usb/atm/ueagle-atm.c
	drivers/usb/gadget/function/f_phonet.c
	drivers/usb/musb/musb_host.c

Johan
