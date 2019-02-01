From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V9 1/5] i2c: tegra: sort all the include headers
 alphabetically
Date: Fri, 1 Feb 2019 22:05:27 +0300
Message-ID: <8769ec28-ac09-797a-ae5b-5289717dbcc0@gmail.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

01.02.2019 20:07, Sowjanya Komatineni пишет:
> This patch sorts all the include headers alphabetically for the
> I2C Tegra driver.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  [V9] : Rebased to 5.0-rc4
>  [V3/V4/V5/V7/V8] : Removed unsued headers in tegra I2C
>  [V2] : Added this in V2 to sort the headers in tegra I2C
> 
>  drivers/i2c/busses/i2c-tegra.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index c77adbbea0c7..79c6aa87499b 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -6,24 +6,21 @@
>   * Author: Colin Cross <ccross@android.com>
>   */
>  
> -#include <linux/kernel.h>
> -#include <linux/init.h>
> -#include <linux/platform_device.h>
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
>  
>  #define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(1000))
>  #define BYTES_PER_FIFO_WORD 4
> 

I gave couple R-B's in v8, please don't shy to add them to the patches.

Also a small hint for the future: if somebody makes a review of your patches and you want that person to take a look at the next versions, you should add that person to email's CC because sometime patches are getting delayed by mailing list for a very substantial time (days) or even getting lost. 


Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
