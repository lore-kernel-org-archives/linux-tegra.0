From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [TEGRA194_CPUFREQ Patch 1/3] firmware: tegra: adding function to
 get BPMP data
Date: Tue, 3 Dec 2019 18:42:29 +0100
Message-ID: <20191203174229.GA1721849@ulmo>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rjw@rjwysocki.net, viresh.kumar@linaro.org, catalin.marinas@arm.com, will@kernel.org, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bbasu@nvidia.com, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2019 at 11:02:26PM +0530, Sumit Gupta wrote:
> Adding new function of_tegra_bpmp_get() to get BPMP data.
> This function can be used by other drivers like cpufreq to
> get BPMP data without adding any property in respective
> drivers DT node.

What's wrong with adding the property in the DT node? We already do that
for Tegra186's CPU frequency driver, so it makes sense to continue that
for Tegra194.

Thierry

> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  drivers/firmware/tegra/bpmp.c | 38 ++++++++++++++++++++++++++++++++++++++
>  include/soc/tegra/bpmp.h      |  5 +++++
>  2 files changed, 43 insertions(+)
>=20
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index 6741fcd..9c3d7f1 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -38,6 +38,44 @@ channel_to_ops(struct tegra_bpmp_channel *channel)
>  	return bpmp->soc->ops;
>  }
> =20
> +struct tegra_bpmp *of_tegra_bpmp_get(void)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *bpmp_dev;
> +	struct tegra_bpmp *bpmp;
> +
> +	/* Check for bpmp device status in DT */
> +	bpmp_dev =3D of_find_compatible_node(NULL, NULL, "nvidia,tegra186-bpmp"=
);
> +	if (!bpmp_dev) {
> +		bpmp =3D ERR_PTR(-ENODEV);
> +		goto err_out;
> +	}
> +	if (!of_device_is_available(bpmp_dev)) {
> +		bpmp =3D ERR_PTR(-ENODEV);
> +		goto err_put;
> +	}
> +
> +	pdev =3D of_find_device_by_node(bpmp_dev);
> +	if (!pdev) {
> +		bpmp =3D ERR_PTR(-ENODEV);
> +		goto err_put;
> +	}
> +
> +	bpmp =3D platform_get_drvdata(pdev);
> +	if (!bpmp) {
> +		bpmp =3D ERR_PTR(-EPROBE_DEFER);
> +		put_device(&pdev->dev);
> +		goto err_put;
> +	}
> +
> +	return bpmp;
> +err_put:
> +	of_node_put(bpmp_dev);
> +err_out:
> +	return bpmp;
> +}
> +EXPORT_SYMBOL_GPL(of_tegra_bpmp_get);
> +
>  struct tegra_bpmp *tegra_bpmp_get(struct device *dev)
>  {
>  	struct platform_device *pdev;
> diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
> index f2604e9..21402d9 100644
> --- a/include/soc/tegra/bpmp.h
> +++ b/include/soc/tegra/bpmp.h
> @@ -107,6 +107,7 @@ struct tegra_bpmp_message {
>  };
> =20
>  #if IS_ENABLED(CONFIG_TEGRA_BPMP)
> +struct tegra_bpmp *of_tegra_bpmp_get(void);
>  struct tegra_bpmp *tegra_bpmp_get(struct device *dev);
>  void tegra_bpmp_put(struct tegra_bpmp *bpmp);
>  int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp,
> @@ -122,6 +123,10 @@ void tegra_bpmp_free_mrq(struct tegra_bpmp *bpmp, un=
signed int mrq,
>  			 void *data);
>  bool tegra_bpmp_mrq_is_supported(struct tegra_bpmp *bpmp, unsigned int m=
rq);
>  #else
> +static inline struct tegra_bpmp *of_tegra_bpmp_get(void)
> +{
> +	return ERR_PTR(-ENOTSUPP);
> +}
>  static inline struct tegra_bpmp *tegra_bpmp_get(struct device *dev)
>  {
>  	return ERR_PTR(-ENOTSUPP);
> --=20
> 2.7.4
>=20

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3mnoEACgkQ3SOs138+
s6GpwBAAvaZJp87NoF1TROjbDypFZ2E7Oov0yzlV1zJak8mF3KIV0tKaCHoXheWI
rcQZm8VFfh/Gqxw63Yk1Gn9nA1KJoqaIUY1On3cMHvY2wtVF7Wh/tFI+5JNXsCIi
H9et1e5q/J9LaFHxcdNsEeYaocswM31Zy+rNIhT1bpLzvTZObIzbQp5v5eao8U6i
VUdAUsr5XSj0vcN51HVz6CHFMpQsocQV1AsACAMUny+ajHL/FTmJYa5jvXvhqgpX
yH593XBFitXrqAhWj3kR6okHC2U9UAd2S9ZXsu15xawQNymTi2mdqnaoeohRajFj
z9GF5CxNbNCNOBMxvzAkF08s8dQCA/vsSkxQ518Z3BK+dPxu7Leho9yVeNs9muy/
7fOU5sc+gIBuBB0V/fwP2xiPbvoe/wozI2LtbmDa6akd5rwxYLi3ogJOKtS1QRhN
JHaTZ08hjuRiL64s8EAfz1VsQYF0MwkfomCfXKMoTCu+8mVXkcMuZcaotXul/Mck
LMYlsKbCwgLpM4NrNW++q1nTewTXmQpzrLN762Ae23ud7ARns1mwaaGa6UvfxIhE
cxZVU66dHXKEIdGsA6uSByRKUS8/1le4Iy6zRAu7O88XAbxSydYOm45/ovZTEzAz
jAymOGgaP0NBMXICJoBLt3/Z0WwBmSAZ/Vir1cbs2jsup+XvzaE=
=c7iN
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
