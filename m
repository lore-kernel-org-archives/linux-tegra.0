From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH] PCI: tegra: include linux/pinctrl/consumer.h
Date: Fri, 20 Sep 2019 16:07:14 +0100
Message-ID: <20190920150714.GK9720@e119886-lin.cambridge.arm.com>
References: <20190920145518.1721180-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190920145518.1721180-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, Thierry Reding <treding@nvidia.com>, linux-pci@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 20, 2019 at 04:55:05PM +0200, Arnd Bergmann wrote:
> Without this, we can run into a build failure:
> 
> drivers/pci/controller/dwc/pcie-tegra194.c:1394:8: error: implicit declaration of function 'pinctrl_pm_select_default_state' [-Werror,-Wimplicit-function-declaration]
> 
> Fixes: ab2a50e7602b ("PCI: tegra: Add support to configure sideband pins")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for this. Another fix for this came in earlier today:

https://patchwork.ozlabs.org/patch/1165139/

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

Thanks,

Andrew Murray

> ---
>  drivers/pci/controller/dwc/pcie-tegra194.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 09ed8e473cff..f89f5acee72d 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -22,6 +22,7 @@
>  #include <linux/of_pci.h>
>  #include <linux/pci.h>
>  #include <linux/phy/phy.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/random.h>
> -- 
> 2.20.0
> 
