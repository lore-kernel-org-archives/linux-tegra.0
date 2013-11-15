From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 10/31] ARM: tegra: pass reset to tegra_powergate_sequence_power_up()
Date: Fri, 15 Nov 2013 14:17:12 -0700
Message-ID: <CAErSpo7i_rGBNvjCb002VeXuL9xpkZ+Nx3APFA1OYH1PyMQ3yQ@mail.gmail.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org> <1384548866-13141-11-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384548866-13141-11-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 15, 2013 at 1:54 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>=
 wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Tegra's clock driver now provides an implementation of the common
> reset API (include/linux/reset.h). Use this instead of the old Tegra-
> specific API; that will soon be removed.
>
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Terje Bergstr=F6m <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
> Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

> ---
> This patch is part of a series with strong internal depdendencies. I'=
m
> looking for an ack so that I can take the entire series through the T=
egra
> and arm-soc trees. The series will be part of a stable branch that ca=
n be
> merged into other subsystems if needed to avoid/resolve dependencies.
> ---
>  arch/arm/mach-tegra/powergate.c | 8 +++++---
>  drivers/gpu/drm/tegra/gr3d.c    | 6 ++++--
>  drivers/pci/host/pci-tegra.c    | 3 ++-
>  include/linux/tegra-powergate.h | 4 +++-
>  4 files changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/po=
wergate.c
> index 85d28e756bb7..f6f5b54ff95e 100644
> --- a/arch/arm/mach-tegra/powergate.c
> +++ b/arch/arm/mach-tegra/powergate.c
> @@ -25,6 +25,7 @@
>  #include <linux/export.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> +#include <linux/reset.h>
>  #include <linux/seq_file.h>
>  #include <linux/spinlock.h>
>  #include <linux/clk/tegra.h>
> @@ -144,11 +145,12 @@ int tegra_powergate_remove_clamping(int id)
>  }
>
>  /* Must be called with clk disabled, and returns with clk enabled */
> -int tegra_powergate_sequence_power_up(int id, struct clk *clk)
> +int tegra_powergate_sequence_power_up(int id, struct clk *clk,
> +                                       struct reset_control *rst)
>  {
>         int ret;
>
> -       tegra_periph_reset_assert(clk);
> +       reset_control_assert(rst);
>
>         ret =3D tegra_powergate_power_on(id);
>         if (ret)
> @@ -165,7 +167,7 @@ int tegra_powergate_sequence_power_up(int id, str=
uct clk *clk)
>                 goto err_clamp;
>
>         udelay(10);
> -       tegra_periph_reset_deassert(clk);
> +       reset_control_deassert(rst);
>
>         return 0;
>
> diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3=
d.c
> index f629e38b00e4..0cbb24b1ae04 100644
> --- a/drivers/gpu/drm/tegra/gr3d.c
> +++ b/drivers/gpu/drm/tegra/gr3d.c
> @@ -279,7 +279,8 @@ static int gr3d_probe(struct platform_device *pde=
v)
>                 }
>         }
>
> -       err =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_3D,=
 gr3d->clk);
> +       err =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_3D,=
 gr3d->clk,
> +                                               gr3d->rst);
>         if (err < 0) {
>                 dev_err(&pdev->dev, "failed to power up 3D unit\n");
>                 return err;
> @@ -287,7 +288,8 @@ static int gr3d_probe(struct platform_device *pde=
v)
>
>         if (gr3d->clk_secondary) {
>                 err =3D tegra_powergate_sequence_power_up(TEGRA_POWER=
GATE_3D1,
> -                                                       gr3d->clk_sec=
ondary);
> +                                                       gr3d->clk_sec=
ondary,
> +                                                       gr3d->rst_sec=
ondary);
>                 if (err < 0) {
>                         dev_err(&pdev->dev,
>                                 "failed to power up secondary 3D unit=
\n");
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegr=
a.c
> index 174a5bc2d993..aace19edc469 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -956,7 +956,8 @@ static int tegra_pcie_power_on(struct tegra_pcie =
*pcie)
>         }
>
>         err =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_PCI=
E,
> -                                               pcie->pex_clk);
> +                                               pcie->pex_clk,
> +                                               pcie->pex_rst);
>         if (err) {
>                 dev_err(pcie->dev, "powerup sequence failed: %d\n", e=
rr);
>                 return err;
> diff --git a/include/linux/tegra-powergate.h b/include/linux/tegra-po=
wergate.h
> index c98cfa406952..b5ad64aca071 100644
> --- a/include/linux/tegra-powergate.h
> +++ b/include/linux/tegra-powergate.h
> @@ -19,6 +19,7 @@
>  #define _MACH_TEGRA_POWERGATE_H_
>
>  struct clk;
> +struct reset_control;
>
>  #define TEGRA_POWERGATE_CPU    0
>  #define TEGRA_POWERGATE_3D     1
> @@ -51,6 +52,7 @@ int tegra_powergate_power_off(int id);
>  int tegra_powergate_remove_clamping(int id);
>
>  /* Must be called with clk disabled, and returns with clk enabled */
> -int tegra_powergate_sequence_power_up(int id, struct clk *clk);
> +int tegra_powergate_sequence_power_up(int id, struct clk *clk,
> +                                       struct reset_control *rst);
>
>  #endif /* _MACH_TEGRA_POWERGATE_H_ */
> --
> 1.8.1.5
>
