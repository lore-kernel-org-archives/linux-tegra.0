From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 3/3] ARM: tegra114: cpuidle: add powered-down state
Date: Tue, 04 Jun 2013 23:40:51 +0200
Message-ID: <51AE5EE3.3010607@linaro.org>
References: <1370342880-422-1-git-send-email-josephl@nvidia.com> <1370342880-422-4-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370342880-422-4-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/04/2013 12:48 PM, Joseph Lo wrote:
> This supports CPU core power down on each CPU when CPU idle. When CPU=
 go
> into this state, it saves it's context and needs a proper configurati=
on
> in flow controller to power gate the CPU when CPU runs into WFI
> instruction. And the CPU also needs to set the IRQ as CPU power down =
idle
> wake up event in flow controller.
>=20
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I would like to understand why there is a WARN with the
CPUIDLE_FLAG_TIMER_STOP flag set before queuing this patch and ensure i=
t
is not the tree hiding the forest.

Thanks
  -- Daniel

> ---
> V2:
> * remove some redundant code of memory barrier
> * remove the function declaration by rearranging the coding sequence=20
> ---
>  arch/arm/mach-tegra/cpuidle-tegra114.c | 51 ++++++++++++++++++++++++=
+++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-tegra/cpuidle-tegra114.c b/arch/arm/mach-t=
egra/cpuidle-tegra114.c
> index 1d1c602..e0b8730 100644
> --- a/arch/arm/mach-tegra/cpuidle-tegra114.c
> +++ b/arch/arm/mach-tegra/cpuidle-tegra114.c
> @@ -17,15 +17,64 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/cpuidle.h>
> +#include <linux/cpu_pm.h>
> +#include <linux/clockchips.h>
> =20
>  #include <asm/cpuidle.h>
> +#include <asm/suspend.h>
> +#include <asm/smp_plat.h>
> +
> +#include "pm.h"
> +#include "sleep.h"
> +
> +#ifdef CONFIG_PM_SLEEP
> +#define TEGRA114_MAX_STATES 2
> +#else
> +#define TEGRA114_MAX_STATES 1
> +#endif
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int tegra114_idle_power_down(struct cpuidle_device *dev,
> +				    struct cpuidle_driver *drv,
> +				    int index)
> +{
> +	local_fiq_disable();
> +
> +	tegra_set_cpu_in_lp2();
> +	cpu_pm_enter();
> +
> +	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_ENTER, &dev->cpu);
> +
> +	cpu_suspend(0, tegra30_sleep_cpu_secondary_finish);
> +
> +	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_EXIT, &dev->cpu);
> +
> +	cpu_pm_exit();
> +	tegra_clear_cpu_in_lp2();
> +
> +	local_fiq_enable();
> +
> +	return index;
> +}
> +#endif
> =20
>  static struct cpuidle_driver tegra_idle_driver =3D {
>  	.name =3D "tegra_idle",
>  	.owner =3D THIS_MODULE,
> -	.state_count =3D 1,
> +	.state_count =3D TEGRA114_MAX_STATES,
>  	.states =3D {
>  		[0] =3D ARM_CPUIDLE_WFI_STATE_PWR(600),
> +#ifdef CONFIG_PM_SLEEP
> +		[1] =3D {
> +			.enter			=3D tegra114_idle_power_down,
> +			.exit_latency		=3D 500,
> +			.target_residency	=3D 1000,
> +			.power_usage		=3D 0,
> +			.flags			=3D CPUIDLE_FLAG_TIME_VALID,
> +			.name			=3D "powered-down",
> +			.desc			=3D "CPU power gated",
> +		},
> +#endif
>  	},
>  };
> =20
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
