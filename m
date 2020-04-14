From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 14 Apr 2020 16:45:25 +0200
Message-ID: <20200414144525.GI3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <7b2f8a7c-94f1-08d0-b0ce-c61f4eb0a436@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VaKJWhUROU/xPxjb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7b2f8a7c-94f1-08d0-b0ce-c61f4eb0a436-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--VaKJWhUROU/xPxjb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2020 at 10:00:13PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static void tegra210_emc_debugfs_init(struct tegra210_emc *emc)
> > +{
> > +	struct device *dev =3D emc->dev;
> > +	unsigned int i;
> > +	int err;
> > +
> > +	emc->debugfs.min_rate =3D ULONG_MAX;
> > +	emc->debugfs.max_rate =3D 0;
> > +
> > +	for (i =3D 0; i < emc->num_timings; i++) {
> > +		if (emc->timings[i].rate * 1000UL < emc->debugfs.min_rate)
> > +			emc->debugfs.min_rate =3D emc->timings[i].rate * 1000UL;
> > +
> > +		if (emc->timings[i].rate * 1000UL > emc->debugfs.max_rate)
> > +			emc->debugfs.max_rate =3D emc->timings[i].rate * 1000UL;
> > +	}
> > +
> > +	if (!emc->num_timings) {
> > +		emc->debugfs.min_rate =3D clk_get_rate(emc->clk);
> > +		emc->debugfs.max_rate =3D emc->debugfs.min_rate;
> > +	}
> > +
> > +	err =3D clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
> > +				 emc->debugfs.max_rate);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to set rate range [%lu-%lu] for %pC\n",
> > +			emc->debugfs.min_rate, emc->debugfs.max_rate,
> > +			emc->clk);
> > +		return;
> > +	}
> > +
> > +	emc->debugfs.root =3D debugfs_create_dir("emc", NULL);
> > +	if (!emc->debugfs.root) {
> > +		dev_err(dev, "failed to create debugfs directory\n");
> > +		return;
> > +	}
> > +
> > +	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root, em=
c,
> > +			    &tegra210_emc_debug_available_rates_fops);
> > +	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
> > +			    emc, &tegra210_emc_debug_min_rate_fops);
> > +	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
> > +			    emc, &tegra210_emc_debug_max_rate_fops);
>=20
> I assume you used the checkpatch before sending the patches, no?

I have a pre-commit hook that runs checkpatch, but for some reason it
was disabled. Fixed these to be numeric now.

> I sent out a patch recently to make the permissions readable, please
> take a look if you haven't seen it yet.
>=20
> https://patchwork.ozlabs.org/patch/1254301/

I've applied this now.

Thierry

--VaKJWhUROU/xPxjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6VzIUACgkQ3SOs138+
s6FpRRAAk0TEKZBPjG+SsTHg1xIN9BMOUI9LqXdMGnagdaP0yEi/mTRNkmrsImxZ
awLe6BQXHKI9FGW/mrjyB1d3Ly+FQSerx04N5iwg6imigOmaTXRyuy4gXuEH6+D1
R4U84Jnx74lntZsS3aqcg/P1gNborKoirVl1xkcvn/mJ4K+BhFBq3NqbgyKJ7xGa
51izgm0mPVSldljky86GBwHfYiyirLXF4K6+Qg3Is1m40p01z3jhrUGYXtnD0cOr
29VnWLSpJs+Qrzs0Fy9Q66C3h5f+ZeshjDCdQJorVDbaiXp8+7YIUW1LPCZcwUrI
tCBxKuzyi7KpFpZmno/li8nOEv+ByqEcg3fF0SrDton95JKMuK/WplZJsVisQ/lN
8SQePeIzU005hN5GwnPfoQVMqLsMqans4M0lh+qRtdzqX4JlH1aBjHsG6UHPcwQb
7ePg54J49LruLhrDaipx5YMZ+zfRuidiat4l5lxvtgxoKImx2iKXRS+w0X1kNVX5
byOLywrBi5wNbAz5G4nsCwA67f3JuB+M5m6VA48MoY3NANz4AdRtE3gcsmmgK2Ac
rM+asAhZyI3p+b1iQujqDdRBE5FvOBFEkS3CwZzZ5kl+wdFTdWPXVDwGYbCKS7NR
bH9mSiKbX48G/8pq6m4xFteYGr91cstkAwv1o7Km4Pe1vsOZN54=
=WHMF
-----END PGP SIGNATURE-----

--VaKJWhUROU/xPxjb--
