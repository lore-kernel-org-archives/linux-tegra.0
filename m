From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v1 6/6] soc/tegra: regulators: Add regulators coupler
 for Tegra30
Date: Wed, 15 May 2019 15:56:35 +0100
Message-ID: <20190515145635.GG5613@sirena.org.uk>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-7-digetx@gmail.com>
 <20190508075848.GX14916@sirena.org.uk>
 <af6de446-ab45-1745-30e5-426c6b34421f@gmail.com>
 <20190512090446.GN21483@sirena.org.uk>
 <3988cfb6-55fe-48c4-5365-ac79871f7fd2@gmail.com>
 <20190513174000.GH5168@sirena.org.uk>
 <9e13bbd1-ff28-1570-b1a6-0cc6337b8f6c@gmail.com>
 <20190515090557.GB5613@sirena.org.uk>
 <3be50306-d3e0-f931-9d6b-0ae0ad5c78ce@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9Iq5ULCa7nGtWwZS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3be50306-d3e0-f931-9d6b-0ae0ad5c78ce@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--9Iq5ULCa7nGtWwZS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2019 at 02:44:33PM +0300, Dmitry Osipenko wrote:
> 15.05.2019 12:05, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, May 14, 2019 at 09:30:05PM +0300, Dmitry Osipenko wrote:

> >> I'm afraid this is just a way of abusing the OPP's. I actually already

> > There's nothing wrong with handling regulators in an OPP, that's a
> > totally normal thing.

> Only if those regulators are directly related to the hardware unit,
> which is not the case here. Regulators coupling is the right abstraction
> that glues things together, there is absolutely no need in trying to
> make workarounds using OPP.

The thing with OPPs is that they are often system level rather than
related to one specific parrt of the device - one of the reasons people
use them is that they eliminate the needs to think about dynamic
combinations of things and instead pick a suitable configuration off a
relatively short menu.  This makes both validation and runtime easier.

--9Iq5ULCa7nGtWwZS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzcKKMACgkQJNaLcl1U
h9B+NwgAgLI94SGFcIjf5e/zV+qGvk219uqkypT4TVitsRux+TDwXPBqqpipHToV
Y2NXTgG5QUiNeMvAYRKlJaOc4JKTm6kUiU1EKyhOfjom9CbyNUZt6hkzDssVP4L+
wg7iQ3Xs19lWCMOXLjrmJmfUhDvvXsT5SQl0xxyzLmlXeq6QQ/saeGi6QXorG6Uz
GDz6A+BItUayv1ZLakLeGoUcRKngFHpUjJzIy8yO/zJ9WzWkS252z2u8z4TnhTms
59I9K9q2ia/syGa//PM2mNT2cbCGsHQykgYSlWIRWlldgL/OnxtIdS5vUvUhnl9G
+Vv/NLM9ommlZnjuTVxUCVp4J81D/A==
=JHHM
-----END PGP SIGNATURE-----

--9Iq5ULCa7nGtWwZS--
