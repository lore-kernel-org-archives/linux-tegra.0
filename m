From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v1 6/6] soc/tegra: regulators: Add regulators coupler
 for Tegra30
Date: Wed, 15 May 2019 10:05:57 +0100
Message-ID: <20190515090557.GB5613@sirena.org.uk>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-7-digetx@gmail.com>
 <20190508075848.GX14916@sirena.org.uk>
 <af6de446-ab45-1745-30e5-426c6b34421f@gmail.com>
 <20190512090446.GN21483@sirena.org.uk>
 <3988cfb6-55fe-48c4-5365-ac79871f7fd2@gmail.com>
 <20190513174000.GH5168@sirena.org.uk>
 <9e13bbd1-ff28-1570-b1a6-0cc6337b8f6c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9e13bbd1-ff28-1570-b1a6-0cc6337b8f6c@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2019 at 09:30:05PM +0300, Dmitry Osipenko wrote:
> 13.05.2019 20:40, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > The thing with OPPs is that they specify a whole table of values that
> > work together including regulator settings, the result being that you
> > have many fewer options but don't need to think about constraints.

> I'm afraid this is just a way of abusing the OPP's. I actually already

There's nothing wrong with handling regulators in an OPP, that's a
totally normal thing.

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzb1nQACgkQJNaLcl1U
h9B+uAf+ICo1YFwIDtc0IRXVChQYg8IxHaOtl3E0HssgAOIT+MbeRs+M+SSk6EbC
Kr1Psm76LVW/stVAjPoOmyapJczTaKrlNHDwDHwrQE7gEXgQ31AsOFzEMjQrVKzU
P2FBDNi1dIOvNJ27+0+FqDcBQOMIDZHUy/Z/bJhdQGtdg0YXp+SyTHxSnUIuNLTI
4DCFaCyP76gLH3Q8wkQjE5MmUeFQ8E0v4RlrImFH4NaJndqwKGoVMKGsCqPo6DTr
1bQdnF0AgJoRLEvsD/tPhff5AlaGjnuSfVeENJ4A2YQPLWcTDbs+uqh8T88D5Y59
0RP2BxB9PjODwkZuyRaWsFUDGNkkqQ==
=k+RW
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
