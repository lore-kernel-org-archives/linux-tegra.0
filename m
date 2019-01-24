From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V2 1/4] i2c: tegra: Sort all the include headers
 alphabetically
Date: Fri, 25 Jan 2019 00:31:34 +0300
Message-ID: <e896f4af-1c20-3188-f1f8-253ce4893a50@gmail.com>
References: <1548363113-25969-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548363113-25969-1-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

24.01.2019 23:51, Sowjanya Komatineni пишет:
> This patch sorts all the include headers alphabetically for the
> I2C tegra driver
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  [V2] : Added this in V2 to sort the headers in tegra I2C
> 
>  drivers/i2c/busses/i2c-tegra.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index e417ebf7628c..ef854be4c837 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -6,24 +6,23 @@
>   * Author: Colin Cross <ccross@android.com>
>   */
>  
> -#include <linux/kernel.h>
> -#include <linux/init.h>
> -#include <linux/platform_device.h>
> +#include <asm/unaligned.h>

What about to clean up the includes as well? Seems <asm/unaligned.h> is not needed by the code.

>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
> -#include <linux/io.h>
> +#include <linux/init.h>
>  #include <linux/interrupt.h>
> -#include <linux/delay.h>
> -#include <linux/slab.h>
> -#include <linux/of_device.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/reset.h>
> +#include <linux/of_device.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/iopoll.h>
> -
> -#include <asm/unaligned.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
>  
>  #define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(1000))
>  #define BYTES_PER_FIFO_WORD 4
> 
