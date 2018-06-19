From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3] usb: xhci: remove the code build warning
Date: Tue, 19 Jun 2018 11:08:00 +0100
Message-ID: <44d08036-c147-ea05-90af-47e0836a0f0b@nvidia.com>
References: <20180617023018.7952-1-gengdongjiu@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180617023018.7952-1-gengdongjiu@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dongjiu Geng <gengdongjiu@huawei.com>, gregkh@linuxfoundation.org, mathias.nyman@intel.com, thierry.reding@gmail.com, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 17/06/18 03:30, Dongjiu Geng wrote:
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
> change since v1:
> 1. Add 'Acked-by: Thierry Reding <treding@nvidia.com>'
> 
> How to reproduce:
> 1. make defconfig ARCH=arm
> 2. make -j100 CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm
> 
> Then you can see below warnings:
> drivers/usb/host/xhci-tegra.c: In function 'tegra_xusb_mbox_thread':
> drivers/usb/host/xhci-tegra.c:552:6: warning: 'err' may be used uninitialized in this function [-Wuninitialized]
> drivers/usb/host/xhci-tegra.c:482:6: note: 'err' was declared here
> ---
>  drivers/usb/host/xhci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index a8c1d07..d50549f 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -481,7 +481,7 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb *tegra,
>  	unsigned long mask;
>  	unsigned int port;
>  	bool idle, enable;
> -	int err;
> +	int err = 0;
>  
>  	memset(&rsp, 0, sizeof(rsp));

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic
