From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Date: Thu, 18 Jun 2020 15:39:30 +0100
Message-ID: <20200618143930.GI5789@sirena.org.uk>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
 <20200618110023.GB5789@sirena.org.uk>
 <20200618143046.GT1931@sasha-vm>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dMdWWqg3F2Dv/qfw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200618143046.GT1931@sasha-vm>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--dMdWWqg3F2Dv/qfw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 10:30:46AM -0400, Sasha Levin wrote:
> On Thu, Jun 18, 2020 at 12:00:23PM +0100, Mark Brown wrote:
> > On Wed, Jun 17, 2020 at 09:01:41PM -0400, Sasha Levin wrote:
> > > From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > >=20
> > > [ Upstream commit 3ef9d5073b552d56bd6daf2af1e89b7e8d4df183 ]
> > >=20
> > > The microphone-jack state needs to be masked in a case of a 4-pin jack
> > > when microphone and ground pins are shorted. Presence of nvidia,heads=
et
> > > tells that WM8903 CODEC driver should mask microphone's status if sho=
rt
> > > circuit is detected, i.e headphones are inserted.

> > This is a new feature not a bugfix.

> I saw this patch more as a hardware quirk.

Pretty much any DT property is a hardware quirk :(

--dMdWWqg3F2Dv/qfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7rfKEACgkQJNaLcl1U
h9D4egf9GAyUHzaf4lnzptpzMRgqOKL3WVybRfxzlzkgBkgbNNF3Rxgl2TGJpoPu
DQIe6X4ijMZ/LNocdFZi+BWCr/rh9ml0dUly5TEXbwjHQ1Im5SBdJgy9tLq1yjPD
OY1sD5faXc2gH1A+z3LQ7xYFpNnpRwug4G+SbyiPtfkPXhIXKnx+cF+tdcqYw8hz
dDcihB9jR8gPEYGqPBQOacSjd969ocvYYj2npO9TztHNXfwvFwNxErrg7pebwrI5
7NbFOUdEU7aLAPIx2AfHoHTD9FzDGvqY37Q/UZZYqqFxRQ46ZluGN1cyuOet3sEb
83lXKDitdxTNZOmNGYNNCEZL/dcdTA==
=Ja8t
-----END PGP SIGNATURE-----

--dMdWWqg3F2Dv/qfw--
