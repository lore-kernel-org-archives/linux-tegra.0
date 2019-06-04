From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 07/16] PM / devfreq: tegra: Properly disable interrupts
Date: Tue, 4 Jun 2019 13:07:44 +0200
Message-ID: <20190604110744.GG16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-8-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qoTlaiD+Y2fIM3Ll"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-8-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--qoTlaiD+Y2fIM3Ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:06AM +0300, Dmitry Osipenko wrote:
> There is no guarantee that interrupt handling isn't running in parallel
> with tegra_actmon_disable_interrupts(), hence it is necessary to protect
> DEV_CTRL register accesses and clear IRQ status with ACTMON's IRQ being
> disabled in the Interrupt Controller in order to ensure that device
> interrupt is indeed being disabled.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra-devfreq.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/devfreq/tegra-devfreq.c b/drivers/devfreq/tegra-devf=
req.c
> index b65313fe3c2e..ce1eb97a2090 100644
> --- a/drivers/devfreq/tegra-devfreq.c
> +++ b/drivers/devfreq/tegra-devfreq.c
> @@ -171,6 +171,8 @@ struct tegra_devfreq {
>  	struct notifier_block	rate_change_nb;
> =20
>  	struct tegra_devfreq_device devices[ARRAY_SIZE(actmon_device_configs)];
> +
> +	int irq;

Interrupts are typically unsigned int.

>  };
> =20
>  struct tegra_actmon_emc_ratio {
> @@ -417,6 +419,8 @@ static void tegra_actmon_disable_interrupts(struct te=
gra_devfreq *tegra)
>  	u32 val;
>  	unsigned int i;
> =20
> +	disable_irq(tegra->irq);
> +
>  	for (i =3D 0; i < ARRAY_SIZE(tegra->devices); i++) {
>  		dev =3D &tegra->devices[i];
> =20
> @@ -427,9 +431,14 @@ static void tegra_actmon_disable_interrupts(struct t=
egra_devfreq *tegra)
>  		val &=3D ~ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
> =20
>  		device_writel(dev, val, ACTMON_DEV_CTRL);
> +
> +		device_writel(dev, ACTMON_INTR_STATUS_CLEAR,
> +			      ACTMON_DEV_INTR_STATUS);
>  	}
> =20
>  	actmon_write_barrier(tegra);
> +
> +	enable_irq(tegra->irq);

Why do we enable interrupts after this? Is there any use in having the
top-level interrupt enabled if nothing's going to generate an interrupt
anyway?

>  }
> =20
>  static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
> @@ -604,7 +613,6 @@ static int tegra_devfreq_probe(struct platform_device=
 *pdev)
>  	struct resource *res;
>  	unsigned int i;
>  	unsigned long rate;
> -	int irq;
>  	int err;
> =20
>  	tegra =3D devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
> @@ -673,15 +681,16 @@ static int tegra_devfreq_probe(struct platform_devi=
ce *pdev)
>  		dev_pm_opp_add(&pdev->dev, rate, 0);
>  	}
> =20
> -	irq =3D platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "Failed to get IRQ: %d\n", irq);
> -		return irq;
> +	tegra->irq =3D platform_get_irq(pdev, 0);
> +	if (tegra->irq < 0) {
> +		err =3D tegra->irq;
> +		dev_err(&pdev->dev, "Failed to get IRQ: %d\n", err);
> +		return err;
>  	}

This is very oddly written. tegra->irq should really be an unsigned int
since that's the standard type for interrupt numbers. But since you need
to be able to detect errors from platform_get_irq() it now becomes
natural to write this as:

	err =3D platform_get_irq(pdev, 0);
	if (err < 0) {
		dev_err(...);
		return err;
	}

	tegra->irq =3D err;

Two birds with one stone. I suppose this could be done in a follow-up
patch since it isn't practically wrong in your version, so either way:

Acked-by: Thierry Reding <treding@nvidia.com>

--qoTlaiD+Y2fIM3Ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2UQAACgkQ3SOs138+
s6HPvRAAogvLg24roavW9e7A3VdF3hlMWEnqKCC24FEBd6eTJ4Nt7X3va3AxSlfE
S4tU3i5ZTylG1nrwSRetmfiz1mvRp8IXOymC/HY4u/JH9DOCkZZGuR+BX6UZNO02
ia2b2p4R1lJQ1Pma23WXwWq1cdZwuDLURu8jFOJXeya2AxwDMHvvEH5fRmTIi8Si
gWzaDJflpljuWmkq+BwQAbc3r3L/r06kuwhGpzEZlebWb3i/mdMz8fh1wN/Eaeq8
h5jy38K1DkUdE5ZrK9iGwx1XW7Zr7boGxDqvqcRH0Id7IPQFHmVP3FqKsrHc1Dh0
c/N413JawucZ5aTMjAMfg1sggJPSwYH0bni94CKnzXToLqRhcVDQzdFb4fmFRBUY
t7NRFkgGUqK0Q8bULX05mvuU1cuB6+aWu+lCIOuMRp0dOf+01dS8SHpVoJHA41od
LqEMJZTzlufBV06vHugV6N6LoTxiBiomyhgAmiJEexsYL778fZIm3TgPHqhPeEL5
dHOp8ray2NBNl8ufwAeI2ynRelZJhqk3+loyz+JkU6TeLnQArrmhSwGoJYX2/0U7
Kc5FNjzTI9nwrxgCetKV3VG56ut4qNVjo4CXr0QIsVQtV/yD2ufAB0y8fyBOFQ5X
Wfcjge3dgrtlqi0WrARpwL3Kiz9OMJyPdykYEIr1GFsXLiKMbG0=
=39a/
-----END PGP SIGNATURE-----

--qoTlaiD+Y2fIM3Ll--
