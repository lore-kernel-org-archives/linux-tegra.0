From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH V2] usb: tegra: Fix allocation for the FPCI context
Date: Thu, 23 Jul 2020 13:19:34 +0200
Message-ID: <20200723111934.GA1964033@kroah.com>
References: <20200712102837.24340-1-jonathanh@nvidia.com>
 <20200715113842.30680-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200715113842.30680-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 15, 2020 at 12:38:42PM +0100, Jon Hunter wrote:
> Commit 5c4e8d3781bc ("usb: host: xhci-tegra: Add support for XUSB
> context save/restore") is using the IPFS 'num_offsets' value when
> allocating memory for FPCI context instead of the FPCI 'num_offsets'.
> 
> After commit cad064f1bd52 ("devres: handle zero size in devm_kmalloc()")
> was added system suspend started failing on Tegra186. The kernel log
> showed that the Tegra XHCI driver was crashing on entry to suspend when
> attempting the save the USB context. On Tegra186, the IPFS context has a
> zero length but the FPCI content has a non-zero length, and because of
> the bug in the Tegra XHCI driver we are incorrectly allocating a zero
> length array for the FPCI context. The crash seen on entering suspend
> when we attempt to save the FPCI context and following commit
> cad064f1bd52 ("devres: handle zero size in devm_kmalloc()") this now
> causes a NULL pointer deference when we access the memory. Fix this by
> correcting the amount of memory we are allocating for FPCI contexts.
> 
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 
> Fixes: 5c4e8d3781bc ("usb: host: xhci-tegra: Add support for XUSB context save/restore")
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> 
> Changes since V1:
> - Corrected commit message
> - Added Thierry's ACK
> 
>  drivers/usb/host/xhci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

No cc: to linux-usb@vger?  :(

I'll go queue this up, but I would have caught it sooner if you had done
so...

thanks,

greg k-h
