From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] usb: host: tegra remove include of <mach/iomap.h>
Date: Wed, 24 Oct 2012 14:37:59 -0700
Message-ID: <20121024213759.GA5303@kroah.com>
References: <1349218165-3494-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1349218165-3494-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 02, 2012 at 04:49:25PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Almost nothing from this file is used, and the file will hopefully be
> deleted soon. Copy the tiny portions that are used directly into
> ehci-tegra.c. I believe that Venu Byravarasu is working on cleaning up
> our USB driver, and those cleanups will remove the need for these
> constants.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Greg, if this patch can get into 3.7 (it's late, I know) at a point before
> wherever you branch off your USB tree for 3.8, then that would be great.
> If not, may I please request this patch be merged into a separate branch/tag
> that is merged into both the Tegra and USB trees for 3.8, since I will
> probably have cleanup patches in the Tegra tree that depend on this change,
> and Venu will likely be sending patches through the USB tree that will need
> to be merged with this too.

I don't know how you want to do this, but this, and the other tegra
patch, are now in the usb-next branch of my usb.git tree.

I would recommend just cherry-picking the thing into your tree if you
want to do work on top of it, we can handle merge issues later on in
3.8-rc1.

thanks,

greg k-h
