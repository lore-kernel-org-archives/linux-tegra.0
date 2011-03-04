From: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: Re: CHROMIUM: arm: tegra: Add platfrom devices for Cypress
	trackpad (issue6623011)
Date: Fri, 4 Mar 2011 11:49:37 +0000
Message-ID: <20110304114936.GA9995@trinity.fluff.org>
References: <20cf3005123492db71049da6a54a@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20cf3005123492db71049da6a54a-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dudl-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel@vger
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 04, 2011 at 11:42:54AM +0000, dudl-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org wrote:
> Reviewers: ccross_android.com, konkers_android.com, olof_lixom.net,  
> linux_arm.linux.org.uk, linux-tegra_vger.kernel.org,  
> linux-arm-kernel_lists.infradead.org, linux-kernel_vger.kernel.org, Micah 
> C, dudl,
>
> Description:
> CHROMIUM: arm: tegra: Add platfrom devices for Cypress trackpad
>
> 1. Add platfrom data strcuture cyapa_platfrom_data.
> 2. Add trackpad device into platfrom I2C bus 0.
> 3. Initialize platfrom data for cyapa_platfrom_data.
> 4. This code is merged based kernel version 2.7.37-rc5.
>
>
> Change-Id: I3591317ac9c3b7d5328a9c617d662ad6be6065a2
> Signed-off-by: Du, Dudley <dudl-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>
>
> BUG=None
> TEST=Test on arm tegra2 seaborad and kaen platform
>
> Please review this at http://codereview.chromium.org/6623011/
>
> SVN Base: http://git.chromium.org/git/kernel-next.git-LXZp9+5mMc2lvm3HrB1tsNBU3+rWoM1G@public.gmane.org
>
> Affected files:
>   M arch/arm/mach-tegra/board-seaboard.h
>   M arch/arm/mach-tegra/board-seaboard.c
>
>
> Index: arch/arm/mach-tegra/board-seaboard.c
> diff --git a/arch/arm/mach-tegra/board-seaboard.c  
> b/arch/arm/mach-tegra/board-seaboard.c
> index  
> 75fbab68ef61c0c117bb8dafa2aaca90947a860b..de272cc73794c6600994af3c0e834dd884f6b56b 
> 100644
> --- a/arch/arm/mach-tegra/board-seaboard.c
> +++ b/arch/arm/mach-tegra/board-seaboard.c
> @@ -303,6 +303,36 @@ static struct tegra_i2c_platform_data  
> seaboard_dvc_platform_data = {
>  	.is_dvc		= true,
>  };
>
> +/* for Cypress Trackpad. */
> +#include <linux/cyapa.h>
> +
> +static int cyapa_i2c_platform_init(void)
> +{
> +	return 0;
> +}
> +
> +static int cyapa_i2c_platform_wakeup(void)
> +{
> +	return 0;
> +}
> +
> +static struct cyapa_platform_data cyapa_i2c_platform_data = {
> +	.flag = 0,
> +	.gen = CYAPA_GEN2,
> +	.power_state = CYAPA_PWR_ACTIVE,
> +	.use_absolute_mode = false,
> +	.use_polling_mode = false,
> +	.polling_interval_time_active = CYAPA_ACTIVE_POLLING_INTVAL_TIME,
> +	.polling_interval_time_lowpower = CYAPA_LOWPOWER_POLLING_INTVAL_TIME,
> +	.active_touch_timeout = CYAPA_ACTIVE_TOUCH_TIMEOUT,
> +	.name = CYAPA_I2C_NAME,
> +	.irq_gpio = TEGRA_GPIO_CYTP_INT,
> +	.report_rate = CYAPA_REPORT_RATE,
> +
> +	.wakeup = cyapa_i2c_platform_wakeup,
> +	.init = cyapa_i2c_platform_init,

if these aren't needed, then why not get the driver to check for NULL
and not call them?

-- 
Ben Dooks, ben-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
