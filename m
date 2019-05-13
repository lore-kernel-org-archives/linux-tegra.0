From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v1 6/6] soc/tegra: regulators: Add regulators coupler
 for Tegra30
Date: Mon, 13 May 2019 18:40:00 +0100
Message-ID: <20190513174000.GH5168@sirena.org.uk>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-7-digetx@gmail.com>
 <20190508075848.GX14916@sirena.org.uk>
 <af6de446-ab45-1745-30e5-426c6b34421f@gmail.com>
 <20190512090446.GN21483@sirena.org.uk>
 <3988cfb6-55fe-48c4-5365-ac79871f7fd2@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4C6bbPZ6c/S1npyF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3988cfb6-55fe-48c4-5365-ac79871f7fd2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--4C6bbPZ6c/S1npyF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2019 at 09:29:54PM +0300, Dmitry Osipenko wrote:
> 12.05.2019 12:04, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, May 08, 2019 at 04:27:42PM +0300, Dmitry Osipenko wrote:

> > Those seem like they should be doable in generic code, though the fact
> > that the constraint is variable makes it annoying to specify - otherwise
> > it'd just be a minimum and maximum spread.  I'm not really coming up
> > with any great ideas right now, it's getting into OPP type territory but
> > it sounds like there's more flexibility for ramping the core voltage so
> > you'd end up with silly numbers of OPPs.

> The OPP shouldn't have to do anything in regards to the regulators
> coupling. The whole idea of the regulators coupling is to make device
> drivers to not churn with the coupling. The coupling in this case is
> specific to SoC and not to a particular board.

The thing with OPPs is that they specify a whole table of values that
work together including regulator settings, the result being that you
have many fewer options but don't need to think about constraints.

> I think the current approach with the customized regulators coupler is
> the best solution for the time being. We may consider something more
> generic if there will be other users with a similar coupling
> requirements, otherwise it's quite difficult to judge what is "generic".
> Do you agree?

Some of the constraints (like having drivers loaded) are kind of fun...

--4C6bbPZ6c/S1npyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzZq+8ACgkQJNaLcl1U
h9Dtswf/f4sgl8pKS8cZdLJ7aTJAOm1gCl9vpwFvrhRXFUi7Zmj5BQyd/G1GAWXu
OxtEoUI8JWPsrf9vk9UxD2Qk1xlVTBXIWt1UfGn7HXXAOcgAMmHya1QRYJSy7rNh
2bUCy/+Sh+tjmz2fqWe+YnoecfV1GyxCoTXF0WgA6+k86sXKZT8SNss1F6MJCJ14
5pgJmTikPDbjOR8g/Wdd+5x315iaAjY/zv6q6d2uxgwvybHYVIx+YMwowzEI8FyH
y2keI9ZHfPbZtmAw2SuxCJ2+74W+4ffAu7xiVANCFtdr5F665+/wa3V4AM9t7k4L
dBlGd+z0XFj1J7KCxxmllK1RSYwJIA==
=1OqR
-----END PGP SIGNATURE-----

--4C6bbPZ6c/S1npyF--
