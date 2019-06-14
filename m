From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1 1/2] mailbox: tegra: hsp: add noirq resume
Date: Fri, 14 Jun 2019 17:50:41 +0200
Message-ID: <20190614155041.GB26922@ulmo>
References: <1560515734-2085-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560515734-2085-1-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 05:35:33AM -0700, Bitan Biswas wrote:
> Add noirq resume instead of resume callback for Tegra HSP. Tegra HSP
> resume needs tegra_hsp_doorbell_startup() call to fix timeout error for
> tegra_bpmp_transfer() during genpd resume noirq on jetson-tx2.

s/jetson-tx2/Jetson TX2/?

>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/mailbox/tegra-hsp.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index 91f1a0c..f147374 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -771,10 +771,16 @@ static int tegra_hsp_probe(struct platform_device *=
pdev)
>  	return 0;
>  }
> =20
> -static int __maybe_unused tegra_hsp_resume(struct device *dev)
> +static int __maybe_unused tegra_hsp_noirq_resume(struct device *dev)

Maybe call this tegra_hsp_resume_noirq() to match the naming of the
dev_pm_ops callback?

>  {
>  	struct tegra_hsp *hsp =3D dev_get_drvdata(dev);
>  	unsigned int i;
> +	struct tegra_hsp_doorbell *db;
> +
> +	list_for_each_entry(db, &hsp->doorbells, list) {
> +		if (db && db->channel.chan)
> +			tegra_hsp_doorbell_startup(db->channel.chan);
> +	}
> =20
>  	for (i =3D 0; i < hsp->num_sm; i++) {
>  		struct tegra_hsp_mailbox *mb =3D &hsp->mailboxes[i];
> @@ -786,7 +792,9 @@ static int __maybe_unused tegra_hsp_resume(struct dev=
ice *dev)
>  	return 0;
>  }
> =20
> -static SIMPLE_DEV_PM_OPS(tegra_hsp_pm_ops, NULL, tegra_hsp_resume);
> +static const struct dev_pm_ops tegra_hsp_pm_ops =3D {
> +	.resume_noirq   =3D tegra_hsp_noirq_resume,

There seems to be two extra spaces before that =3D.

Thierry

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0DwlEACgkQ3SOs138+
s6FF9hAAiJ4bYQf3muX8DROz4Scc57EGDwt0MelsUs6uPgSREWy1pruYby4Ynmub
9bT2rhXcUZYDRHZTKqnwhgl1juMnbMMjfCWfjrbE68/2sX/6td5/qYhwCiUVq0uK
4j0rlF1SgzlqIoeEWaZaVVpxiWGuh192MH1NVacIYQvJvanWhlFxJzeO9yUKX5eb
5hDxA6MrLsU9hGx3GS8GJ64Df8mfHJOy3kZ6sACOaBY/w03oB3kU3GB6LIW3B/ck
ds5wx6VLvrfw1OCuM0jlijd7aFM72/u3Gv6U0kGLmXhAaptOZtSYYGVCTcbKlCL6
mwY6ryNasRgWIIk7S7Ni2ilTo9AJaHzmf4dL/XlXgPVAK7QDHKzRm3CYu5hjCmMx
c/WBwP9Cme+/ZtI3TK/gvEBtWwdHOsLDb+kpfE8GFHCFQ2exigovGEqMy+Fscqrl
9Vs7wGoVHFEKZafXike8rFB6otmdEhRhEh0+nFVXFmn4kqa2ZeTdsettOGRmXowR
o0FB4D4bHESnGmPzv2DpD8ievqDM9jFy2blj762OjxwITNw3V6AtQ47Ay9IYNOz0
L609ZNxyqi45+6PyYUkuIIj6XR0Ny/TaAHQCkzIUDMtbg4guV9qnVr9XQxytgm9H
hnCI5uBSdK4M9nv3eFFGSsgwBnIf9sc3+Zxl12TELCvroW5MJEQ=
=IXnu
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
