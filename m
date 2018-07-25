From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: tegra: probe deferral error reporting
Date: Wed, 25 Jul 2018 16:24:55 -0700
Message-ID: <153256109511.48062.12389268791907553857@swboyd.mtv.corp.google.com>
References: <20180720075422.26563-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720075422.26563-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Marcel Ziswiler (2018-07-20 00:54:22)
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> =

> Actually report the error code from devm_regulator_get() which may as
> well just be a probe deferral.
> =

> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> =

> ---
> =

>  drivers/clk/tegra/clk-dfll.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index 48ee43734e05..b2123084e175 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -1609,8 +1609,9 @@ int tegra_dfll_register(struct platform_device *pde=
v,
>  =

>         td->vdd_reg =3D devm_regulator_get(td->dev, "vdd-cpu");
>         if (IS_ERR(td->vdd_reg)) {
> -               dev_err(td->dev, "couldn't get vdd_cpu regulator\n");
> -               return PTR_ERR(td->vdd_reg);
> +               ret =3D PTR_ERR(td->vdd_reg);
> +               dev_err(td->dev, "couldn't get vdd_cpu regulator: %d\n", =
ret);

Do you want to know that a probe defer is happening? Usually patches are
sent to make that error path silent.
