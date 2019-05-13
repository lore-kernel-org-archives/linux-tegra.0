From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v1 5/6] soc/tegra: regulators: Add regulators coupler
 for Tegra20
Date: Mon, 13 May 2019 18:38:16 +0100
Message-ID: <20190513173816.GG5168@sirena.org.uk>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-6-digetx@gmail.com>
 <20190508075706.GW14916@sirena.org.uk>
 <9756d8ca-0778-5185-5b6b-3168d63819ec@gmail.com>
 <20190512090627.GO21483@sirena.org.uk>
 <586b4f29-1937-2d7b-3944-c29311502878@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <586b4f29-1937-2d7b-3944-c29311502878@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2019 at 08:42:39PM +0300, Dmitry Osipenko wrote:
> 12.05.2019 12:06, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > This seems like it should be easy enough to describe - we just need
> > minimum and maximum spreads between pairs of rails.

> Yes, but the proper CORE/RTC minimum voltages shall be maintained until
> all drivers will get support for the voltage management, which likely to
> take a lot of time to get upstreamed. So I'd want to get at least some
> basics working for the start, later on it should be possible to consider
> generalization of the regulators coupling. Mark, are you okay with
> having the custom regulators coupler as an interim solution?

Let me think about it.  Interim solutions have this habit of hanging
around and the bit with needing to get all the drivers loaded is very
much an open and substantial question...  :/  Definitely not something
I'd close the door on at this point though.

--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzZq4cACgkQJNaLcl1U
h9CQ6wf+PvgtU7EJ2C1PXYPtCxlox08atULwBABD9ftnREB2Y8nHew4DsD+aJt1o
w3IaUDNm5Q+xv195r7SA7OmyEdfaL3SI/FviIlskTwr/m8it/7fg5mZp7A10wHoy
FBsy42N7DvCqQOpLKLGqN9BEjn2kLPB+LeTVeqhjhLhzh0mfF6hNsmY1Xi64pDW3
17EuV55sxfBFVfvho1pnRX9dbnJK3ZhUOjqCfig2B3nSXNGKx4SMa7JFmOFAXr8I
bfMundBb26g8He+AJ+Zc4WP2nmiRYZDjZEb/9zMWChAd3I1aGNCA1V7ySPpH+RqI
/AkdKVJLDk1ipcBaE15F1udmls8ACA==
=GaLr
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--
