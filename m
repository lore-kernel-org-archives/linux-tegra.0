From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 06/11] thermal: tegra: add a debugfs to show registers
Date: Thu, 21 Jan 2016 15:50:33 +0100
Message-ID: <20160121145033.GC32301@ulmo>
References: <1453111437-12401-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453111437-12401-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2016 at 06:03:57PM +0800, Wei Ni wrote:
[...]
> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soc=
therm.c
[...]
> +static void soctherm_debug_init(struct platform_device *pdev)
> +{
> +	struct tegra_soctherm *tegra =3D platform_get_drvdata(pdev);
> +	struct dentry *root, *file;
> +
> +	root =3D debugfs_create_dir("tegra_soctherm", NULL);

Perhaps leave away the tegra_ prefix here? It's kind of redundant.

> +	if (!root) {
> +		dev_err(&pdev->dev, "failed to create debugfs directory\n");
> +		return;
> +	}
> +
> +	tegra->debugfs_dir =3D root;
> +
> +	file =3D debugfs_create_file("regs", 0644, root, pdev, &regs_fops);

Can we call this something different, please? "summary" would be a
better name, in my opinion.

> +	if (!file)
> +		dev_err(&pdev->dev, "failed to create debugfs file\n");
> +}
> +#else
> +static inline void soctherm_debug_init(struct platform_device *pdev)
> +{ return 0; }

Please follow the regular CodingStyle here, too:

	...
	{
		return 0;
	}

> @@ -178,6 +309,10 @@ static int tegra_soctherm_probe(struct platform_devi=
ce *pdev)
>  	if (!tegra)
>  		return -ENOMEM;
> =20
> +	dev_set_drvdata(&pdev->dev, tegra);
> +
> +	tegra->soc =3D soc;

This looks odd here. Does this perhaps belong in one of the previous
patches?

Thierry

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWoPA5AAoJEN0jrNd/PrOhSX4QAJiVg/riFnVmMO7WjpswhKWu
TZFWqLMZfk0MLtSRCU3E82l5qZ92RrHPLJkTfCXwhmk4wkWBO8byr0Vjq91Q17vW
cb9RrpAz0PHpzieoY2mQhvAqIobtl/BLkPB/sQF5hd+L/5JsVrTZDhmq3+Ekd0T3
k7BIPxPu8scb6a6ImWsAS4GPBPoY2fTmsgTJsOviajywhHHSO5cCqJIwL+AJq44U
RzqbOAx2Hai1Yay2F2oWdOwmH3SWhM4hKbsXci7pCZKG0uGo6lGGG5NeANGfB97N
9KPNWfenbl3Q3PnpDy/VGIQotvumuHO2TXH+79bb35bPqUKZSxTwLXDJpSb02x5k
0hpqfrh7HR5e3NjwDdpKEfcJD5OSi5bnXVruvY2KyRXe5zKaxRibeY81TZXWMeZE
lZtCDsI7mJmiS/3ub/uTBFpf0Mak49M1aURvlux+5Ke+BpBLvNOQjqjfl1cmKiz0
Fm1jMatXxWAVrshwvvGZR3UpPN9/1u8du8Br+Z7kg9pLHK50Xrv55fEbVUeC4xGL
xay+rsodlfFN+z6KeNf1EVoEGfoSpfbQ1CZXp+LUOSJczjW+juQnbyf32x7BuVSB
iygJbIX5MtbyQW2/kuLTFt876AHuY73hSoTL1x+aoa6esZiqXqVy46Z/xluwL1yF
Ji+U31ojiuLUUhsyQfZQ
=R3VW
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
