From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH -next] PCI: tegra: Add missing include file
Date: Fri, 20 Sep 2019 08:47:25 +0530
Message-ID: <1c864f34-a2a2-0057-5768-ed992871e927@nvidia.com>
References: <20190920014807.38288-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920014807.38288-1-yuehaibing@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, lorenzo.pieralisi@arm.com, andrew.murray@arm.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, treding@nvidia.com
Cc: linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 9/20/2019 7:18 AM, YueHaibing wrote:
> Fix build error without CONFIG_PINCTRL
> 
> drivers/pci/controller/dwc/pcie-tegra194.c: In function tegra_pcie_config_rp:
> drivers/pci/controller/dwc/pcie-tegra194.c:1394:8: error: implicit declaration of function pinctrl_pm_select_default_state;
>   did you mean prandom_seed_full_state? [-Werror=implicit-function-declaration]
>    ret = pinctrl_pm_select_default_state(dev);
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          prandom_seed_full_state
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: ab2a50e7602b ("PCI: tegra: Add support to configure sideband pins")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/pci/controller/dwc/pcie-tegra194.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 09ed8e4..b219d3b2 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -28,6 +28,7 @@
>   #include <linux/reset.h>
>   #include <linux/resource.h>
>   #include <linux/types.h>
> +#include <linux/pinctrl/consumer.h>
>   #include "pcie-designware.h"
>   #include <soc/tegra/bpmp.h>
>   #include <soc/tegra/bpmp-abi.h>
> 

Thanks for pushing this change.

Reviewed-by: Vidya Sagar <vidyas@nvidia.com>
