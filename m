From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 3/4] usb: phy-tegra-usb: use platform_{get,set}_drvdata()
Date: Tue, 27 Aug 2013 21:36:16 -0700
Message-ID: <20130828043616.GB21756@kroah.com>
References: <521C5EF3.2090907@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <521C5EF3.2090907-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Libo Chen <clbchenlibo.chen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, USB <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Li Zefan <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 27, 2013 at 04:10:27PM +0800, Libo Chen wrote:
> 
> Use the wrapper functions for getting and setting the driver data using
> platform_device instead of using dev_{get,set}_drvdata() with &pdev->dev,
> so we can directly pass a struct platform_device.
> 
> Signed-off-by: Libo Chen <libo.chen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/usb/phy/phy-tegra-usb.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

This patch doesn't apply to my tree :(
