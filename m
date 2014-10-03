From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ASoC: tegra: add mic detect gpio to tegra_max98090
Date: Fri, 3 Oct 2014 11:21:54 +0100
Message-ID: <20141003102154.GG4273@sirena.org.uk>
References: <1412268164-3333-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OMIeU0UG8ajn+69Z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412268164-3333-1-git-send-email-dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--OMIeU0UG8ajn+69Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 02, 2014 at 09:42:44AM -0700, Dylan Reid wrote:
> Add an optional mic detect gpio property.  If specified in device tree
> there will be a mic jack created for the given gpio.  This will be
> used by the Tegra-based Chromebooks.

Applied, thanks.

--OMIeU0UG8ajn+69Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJULnjBAAoJECTWi3JdVIfQ3W0H/2BFMnez/Oq1QXHlflDRDpY3
XxSxQttxK1kktnNpujIyVlvfFgYwUPBXWdd0xTuPEot0Au5Ew+D7vkieOI7QcLcn
JpU2tT4sjQaoaDnHnbHDer5vYTjdwxoxkmGtb+OGEU4XEoggtULhiHNYTFwO93uT
yp2d+pYK3Vs9IkEodJJnrwsxoYO75jpRgxLt60N+/VG/qLzwvr1qX54Qj1rC3y6c
2kCm0flYyBkVvQaaTEwr1EMssP1ZyrsouM0INiokVDykfO55htzAgz308BjGX9Ms
PoE4Dn7pmZs8HTm1AEkTP2AWtvFoK6cNBxqCPiRgQr3Kmzme0E39qjWD8cLa+wc=
=QtGY
-----END PGP SIGNATURE-----

--OMIeU0UG8ajn+69Z--
