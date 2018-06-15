From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] usb: xhci: remove the code build warning
Date: Fri, 15 Jun 2018 12:40:04 +0200
Message-ID: <20180615104004.GA2993@kroah.com>
References: <20180606143659.1476-1-gengdongjiu@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180606143659.1476-1-gengdongjiu@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dongjiu Geng <gengdongjiu@huawei.com>
Cc: mathias.nyman@intel.com, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 06, 2018 at 10:36:59PM +0800, Dongjiu Geng wrote:
> Initialize the 'err' variate to remove the build warning,
> the warning is shown as below:
> 
> drivers/usb/host/xhci-tegra.c: In function 'tegra_xusb_mbox_thread':
> drivers/usb/host/xhci-tegra.c:552:6: warning: 'err' may be used uninitialized in this function [-Wuninitialized]
> drivers/usb/host/xhci-tegra.c:482:6: note: 'err' was declared here
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
> How to reproduce:
> 1. make defconfig ARCH=arm
> 2. make -j100 CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm
> 
> Then you can see below warnings:
> drivers/usb/host/xhci-tegra.c: In function 'tegra_xusb_mbox_thread':
> drivers/usb/host/xhci-tegra.c:552:6: warning: 'err' may be used uninitialized in this function [-Wuninitialized]
> drivers/usb/host/xhci-tegra.c:482:6: note: 'err' was declared here

What changed from v1?  Always put that below the --- line.

Please fix up and resend a v3.

thanks,

greg k-h
