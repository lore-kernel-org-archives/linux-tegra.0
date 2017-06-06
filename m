From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] dmaengine: tegra-apb: Really fix runtime-pm usage
Date: Tue, 6 Jun 2017 16:48:20 +0200
Message-ID: <20170606144820.GB21217@ulmo>
References: <1496753369-5356-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1496753369-5356-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2017 at 01:49:29PM +0100, Jon Hunter wrote:
> Commit edd3bdbe9db1 ("dmaengine: tegra-apb: Correct runtime-pm usage")
> added pm_runtime_get/put() calls to the tegra-apb DMA system suspend
> callbacks. Runtime PM is disabled during system suspend and so these
> APIs cannot be used. Fix the suspend handling for the tegra-apb DMA by
> moving the save and restore of the DMA register context into the
> runtime PM suspend and resume callbacks, and then use the
> pm_runtime_force_suspend/resume() APIs to invoke the runtime PM
> callbacks during system suspend.
>=20
> Fixes: edd3bdbe9db1 ("dmaengine: tegra-apb: Correct runtime-pm usage")
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> Changes since V1:
> - Drop the custom suspend/resume callbacks and use
>   pm_runtime_force_suspend/resume directly in SET_SYSTEM_SLEEP_PM_OPS.
>=20
>  drivers/dma/tegra20-apb-dma.c | 50 +++++++++----------------------------=
------
>  1 file changed, 10 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 3722b9d8d9fe..b9d75a54c896 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -1494,35 +1494,7 @@ static int tegra_dma_remove(struct platform_device=
 *pdev)
>  static int tegra_dma_runtime_suspend(struct device *dev)
>  {
>  	struct tegra_dma *tdma =3D dev_get_drvdata(dev);
> -
> -	clk_disable_unprepare(tdma->dma_clk);
> -	return 0;
> -}
> -
> -static int tegra_dma_runtime_resume(struct device *dev)
> -{
> -	struct tegra_dma *tdma =3D dev_get_drvdata(dev);
> -	int ret;
> -
> -	ret =3D clk_prepare_enable(tdma->dma_clk);
> -	if (ret < 0) {
> -		dev_err(dev, "clk_enable failed: %d\n", ret);
> -		return ret;
> -	}
> -	return 0;
> -}
> -
> -#ifdef CONFIG_PM_SLEEP
> -static int tegra_dma_pm_suspend(struct device *dev)
> -{
> -	struct tegra_dma *tdma =3D dev_get_drvdata(dev);
>  	int i;
> -	int ret;
> -
> -	/* Enable clock before accessing register */
> -	ret =3D pm_runtime_get_sync(dev);
> -	if (ret < 0)
> -		return ret;
> =20
>  	tdma->reg_gen =3D tdma_read(tdma, TEGRA_APBDMA_GENERAL);
>  	for (i =3D 0; i < tdma->chip_data->nr_channels; i++) {
> @@ -1543,21 +1515,21 @@ static int tegra_dma_pm_suspend(struct device *de=
v)
>  						  TEGRA_APBDMA_CHAN_WCOUNT);
>  	}
> =20
> -	/* Disable clock */
> -	pm_runtime_put(dev);
> +	clk_disable_unprepare(tdma->dma_clk);
> +
>  	return 0;
>  }
> =20
> -static int tegra_dma_pm_resume(struct device *dev)
> +static int tegra_dma_runtime_resume(struct device *dev)
>  {
>  	struct tegra_dma *tdma =3D dev_get_drvdata(dev);
> -	int i;
> -	int ret;
> +	int i, ret;
> =20
> -	/* Enable clock before accessing register */
> -	ret =3D pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	ret =3D clk_prepare_enable(tdma->dma_clk);
> +	if (ret < 0) {
> +		dev_err(dev, "clk_enable failed: %d\n", ret);
>  		return ret;
> +	}
> =20
>  	tdma_write(tdma, TEGRA_APBDMA_GENERAL, tdma->reg_gen);
>  	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
> @@ -1582,16 +1554,14 @@ static int tegra_dma_pm_resume(struct device *dev)
>  			(ch_reg->csr & ~TEGRA_APBDMA_CSR_ENB));
>  	}
> =20
> -	/* Disable clock */
> -	pm_runtime_put(dev);
>  	return 0;
>  }
> -#endif
> =20
>  static const struct dev_pm_ops tegra_dma_dev_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_dma_runtime_suspend, tegra_dma_runtime_resume,
>  			   NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(tegra_dma_pm_suspend, tegra_dma_pm_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)

Is that even necessary? I thought runtime PM was going to be triggered
for system sleep anyway, but it looks like there are other examples of
this usage, so maybe I'm mistaken.

Thierry

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk2wLQACgkQ3SOs138+
s6EgaQ/+J7Nq5V5vgGxxq04j7FUB05O5lice72fS5HcpM4R9RP57FgobyYh56AUe
2JSl94+uvXL/EVuAI1Er9vlCF4xd3rs/0iki1oHWxOnVhFMVU/uP30yLjaCrOcGa
xg1SrJd0TizXCdnhic5E1C32HALStNTDF0gMvKE+s5p6qvNbfsA6icTikXuf4djH
wq3Nq5Y4VROvsfFf1eKF1bAzWVHtti1WolfDcizc1RQShzr6gtAXa1WXNMafMezo
i7H6iGtNLcNeScCf4KHJcZ8cyunnVZ8K04NGcI+Ow8JoDalIdH7TfD0CzrDxAiH9
XioNEHrpj+6+7zWUNEp8IcwsGpLOvL2xInJYXaoZ2FW1sQoUSjUdnLjANxhSuHJQ
0jDAsZ+QJX8PoFKPk1lot2HAW/+JiYzYq17MhUBKV/hwwKzS2fOULJAMhrQO4AXI
8H5jGZaTE2Ianaa/uHhf4iG+teXqhy7DIaD5RcjJoW+2oHJfC4fwt6kF/WJJMKA5
MyNjj9cw9bpu1Oy/17z+0qTjzZtof7efMpFaJ/AjqPnOT/BImUwmlMSxL4VrDnbK
7ihx0aSLU3RHoFHP3l/h+Us1ebGUj29iINDx0dU02IZZjh86vhCodG3DIYPj80ua
h0iqqr6F7azaDsLSCy/29e9hEK/LTVbhJDvAZSE/DkIjftET7uE=
=73Dk
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
