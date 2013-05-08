From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: disable LP2 cpuidle state if PCIe is enabled
Date: Wed, 08 May 2013 12:53:38 +0200
Message-ID: <518A2EB2.70006@linaro.org>
References: <1367872744-25002-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1367872744-25002-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/06/2013 10:39 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra20 HW appears to have a bug such that PCIe device interrupts, wh=
ether
> they are legacy IRQs or MSI, are lost when LP2 is enabled. To work ar=
ound
> this, simply disable LP2 if the PCI driver and DT node are both enabl=
ed.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Thierry,
>=20
> This patch is physically based on next-20130506 so that it doesn't
> conflict with any of the recent cpuidle cleanup work. I'm sending it =
with
> the expectation that you'll apply it to your PCIe development branch
> though. If you do that, you'll see some conflicts unless you rebase y=
our
> dev branch onto something more recent than next-20130422; I assume yo=
u'll
> do that rebase soon enough anyway, but if you weren't planning to, I =
can
> resend the patch based on your current dev branch.
>=20
>  arch/arm/mach-tegra/cpuidle-tegra20.c |   30 +++++++++++++++++++++++=
+++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm/mach-tegra/cpuidle-tegra20.c b/arch/arm/mach-te=
gra/cpuidle-tegra20.c
> index 0cdba8d..d2c9349 100644
> --- a/arch/arm/mach-tegra/cpuidle-tegra20.c
> +++ b/arch/arm/mach-tegra/cpuidle-tegra20.c
> @@ -25,6 +25,7 @@
>  #include <linux/cpu_pm.h>
>  #include <linux/clockchips.h>
>  #include <linux/clk/tegra.h>
> +#include <linux/of.h>
> =20
>  #include <asm/cpuidle.h>
>  #include <asm/proc-fns.h>
> @@ -212,10 +213,39 @@ static int tegra20_idle_lp2_coupled(struct cpui=
dle_device *dev,
>  }
>  #endif
> =20
> +static const struct of_device_id pcie_matches[] __initconst =3D {
> +	{ .compatible =3D "nvidia,tegra20-pcie" },
> +	{ }
> +};
> +
> +/*
> + * Tegra20 HW appears to have a bug such that PCIe device interrupts=
, whether
> + * they are legacy IRQs or MSI, are lost when LP2 is enabled. To wor=
k around
> + * this, simply disable LP2 if the PCI driver and DT node are both e=
nabled.
> + */
> +static void __init tegra20_cpuidle_disable_lp2_with_pcie(void)
> +{
> +	struct device_node *np;
> +
> +	if (!IS_ENABLED(CONFIG_PCI_TEGRA))
> +		return;
> +
> +	np =3D of_find_matching_node(NULL, pcie_matches);
> +	if (!np)
> +		return;
> +
> +	if (!of_device_is_available(np))
> +		return;
> +
> +	pr_info("Disabling LP2 cpuidle state, since PCIe is enabled\n");
> +	tegra_idle_driver.state_count =3D 1;

Won't be more clear to have the state disabled in the init function lik=
e
this ?

int __init tegra20_cpuidle_init(void)
{
	...
	if (tegra20_has_lp2_pcie_bug(void))
		tegra_idle_driver.states[1].disabled =3D true;
	...
}

It is similar than:

https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git/tree/a=
rch/sh/kernel/cpu/shmobile/cpuidle.c

> +}
> +
>  int __init tegra20_cpuidle_init(void)
>  {
>  #ifdef CONFIG_PM_SLEEP
>  	tegra_tear_down_cpu =3D tegra20_tear_down_cpu;
>  #endif
> +	tegra20_cpuidle_disable_lp2_with_pcie();
>  	return cpuidle_register(&tegra_idle_driver, cpu_possible_mask);
>  }
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
