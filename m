From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/7] soc/tegra: pmc: Sort includes alphabetically
Date: Fri, 25 Jan 2019 10:53:10 +0000
Message-ID: <7a5419b1-3729-8778-17d6-5d2e23467387@nvidia.com>
References: <20190125102255.6862-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125102255.6862-1-thierry.reding@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 25/01/2019 10:22, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This will make it easier to insert new includes in the right place in
> subsequent patches.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 7ea3280279ff..cd865be3b195 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -20,7 +20,6 @@
>  
>  #define pr_fmt(fmt) "tegra-pmc: " fmt
>  
> -#include <linux/kernel.h>
>  #include <linux/clk.h>
>  #include <linux/clk/tegra.h>
>  #include <linux/debugfs.h>
> @@ -30,16 +29,17 @@
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> -#include <linux/irq.h>
>  #include <linux/irqdomain.h>
> -#include <linux/of.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
>  #include <linux/of_address.h>
>  #include <linux/of_clk.h>
> +#include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> -#include <linux/pinctrl/pinctrl.h>
> -#include <linux/pinctrl/pinconf.h>
>  #include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinctrl.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/reboot.h>
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon
-- 
nvpublic
