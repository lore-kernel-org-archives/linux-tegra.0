From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: Tegra: Rename clk_dev1/2 to cdev1/2
Date: Wed, 23 Feb 2011 13:06:40 -0800
Message-ID: <AANLkTi=Wbe_og3fJ__cC+Rdgagb_RQNgWPmoZUjvRYAD@mail.gmail.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-4-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298487532-5000-4-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 10:58 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> The ASoC machine driver was written assuming my previous patch to add
> complete support for these clocks, which named them cdev1/2. Rename
> the clocks to match that, to avoid churn in the ASoC driver.
>
> This rename also makes the clocks more consistent with other Tegra
> clocks irrespective of any of that.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> NOTE: This patch should apply right now.
>
> =A0arch/arm/mach-tegra/tegra2_clocks.c | =A0 12 ++++++------
> =A01 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegr=
a/tegra2_clocks.c
> index ee3f9d7..6d7c4ee 100644
> --- a/arch/arm/mach-tegra/tegra2_clocks.c
> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
> @@ -1823,8 +1823,8 @@ static struct clk tegra_clk_d =3D {
> =A0};
>
> =A0/* dap_mclk1, belongs to the cdev1 pingroup. */
> -static struct clk tegra_dev1_clk =3D {
> - =A0 =A0 =A0 .name =A0 =A0 =A0=3D "clk_dev1",
> +static struct clk tegra_clk_cdev1 =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0=3D "cdev1",
> =A0 =A0 =A0 =A0.ops =A0 =A0 =A0 =3D &tegra_cdev_clk_ops,
> =A0 =A0 =A0 =A0.rate =A0 =A0 =A0=3D 26000000,
> =A0 =A0 =A0 =A0.max_rate =A0=3D 26000000,
> @@ -1834,8 +1834,8 @@ static struct clk tegra_dev1_clk =3D {
> =A0};
>
> =A0/* dap_mclk2, belongs to the cdev2 pingroup. */
> -static struct clk tegra_dev2_clk =3D {
> - =A0 =A0 =A0 .name =A0 =A0 =A0=3D "clk_dev2",
> +static struct clk tegra_clk_cdev2 =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0=3D "cdev2",
> =A0 =A0 =A0 =A0.ops =A0 =A0 =A0 =3D &tegra_cdev_clk_ops,
> =A0 =A0 =A0 =A0.rate =A0 =A0 =A0=3D 26000000,
> =A0 =A0 =A0 =A0.max_rate =A0=3D 26000000,
> @@ -2276,8 +2276,8 @@ struct clk *tegra_ptr_clks[] =3D {
> =A0 =A0 =A0 =A0&tegra_clk_hclk,
> =A0 =A0 =A0 =A0&tegra_clk_pclk,
> =A0 =A0 =A0 =A0&tegra_clk_d,
> - =A0 =A0 =A0 &tegra_dev1_clk,
> - =A0 =A0 =A0 &tegra_dev2_clk,
> + =A0 =A0 =A0 &tegra_clk_cdev1,
> + =A0 =A0 =A0 &tegra_clk_cdev2,
> =A0 =A0 =A0 =A0&tegra_clk_virtual_cpu,
> =A0 =A0 =A0 =A0&tegra_clk_blink,
> =A0 =A0 =A0 =A0&tegra_clk_cop,
> --
> 1.7.1
>
>

Ack, I'll put it in for-next
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
