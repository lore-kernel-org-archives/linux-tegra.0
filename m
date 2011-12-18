From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/3] i2c: tegra: Support DVC controller in device tree
Date: Sun, 18 Dec 2011 16:46:21 +0100
Message-ID: <20111218154621.GB5600@avionic-0098.mockup.avionic-design.de>
References: <1324186101-23695-1-git-send-email-swarren@nvidia.com>
 <20111218154208.GA5600@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111218154208.GA5600-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Thierry Reding wrote:
> * Stephen Warren wrote:
> [...]
> > @@ -636,7 +649,18 @@ static int tegra_i2c_probe(struct platform_device =
*pdev)
> >  			i2c_dev->bus_clk_rate =3D be32_to_cpup(prop);
> >  	}
> > =20
> > -	if (pdev->id =3D=3D 3)
> > +#if defined(CONFIG_OF)
> > +	if (pdev->dev.of_node) {
> > +		const struct of_device_id *match;
> > +
> > +		match =3D of_match_device(tegra_i2c_of_match, &pdev->dev);
> > +		if (!match)
> > +			return -EINVAL;
> > +
> > +		i2c_dev->is_dvc =3D match->data;
> > +	}
> > +#endif
> > +	else if (pdev->id =3D=3D 3)
>=20
> Shouldn't the "else" move into the CONFIG_OF branch?

Okay, I hadn't seen v2. Please ignore.

Thierry

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7uCs0ACgkQZ+BJyKLjJp9zjgCgp3ScbUwDibzHsQp5Zax4T4ik
+v0AoKeC59wb36uy22bf4A8lQV/d1hT1
=0pd+
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
