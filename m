From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v1 0/2] NVIDIA Tegra20 video decoder driver
Date: Tue, 26 Sep 2017 08:54:47 +0200
Message-ID: <20170926065447.GC6250@kroah.com>
References: <cover.1506377430.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1506377430.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 26, 2017 at 01:15:41AM +0300, Dmitry Osipenko wrote:
> This driver provides accelerated video decoding to NVIDIA Tegra20 SoC's,
> it is a result of reverse-engineering efforts. Driver has been tested on
> Toshiba AC100 and Acer A500, it should work on any Tegra20 device.
> 
> In userspace this driver is utilized by libvdpau-tegra [0] that implements
> VDPAU interface, so any video player that supports VDPAU can provide
> accelerated video decoding on Tegra20 on Linux.

Why not use the v4l2 api instead?  Doesn't that provide the same needed
user/kernel api here instead of creating yet-another-custom ioctl?

thanks,

greg k-h
