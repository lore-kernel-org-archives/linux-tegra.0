From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 17/31] ASoC: tegra: call pm_runtime APIs around register
 accesses
Date: Sat, 16 Nov 2013 10:02:05 +0000
Message-ID: <20131116100205.GG15393@sirena.org.uk>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-18-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t4apE7yKrX2dGgJC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-18-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--t4apE7yKrX2dGgJC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:12PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Call pm_runtime_get_sync() before all register accesses; the HW requires
> clocks to be running when accessing registers.
>=20
> This hasn't been needed to date, since all register IO was performed
> while playback was active, and hence the ASoC core had already called
> pm_runtime_get(). However, an imminent future commit will allocate and
> set up the FIFOs and routing during probe(), when that "protection"
> won't be in place.

Acked-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

However should we fix this at the regmap level in the same way that we
do for clocks?  That would need to be using _put_autosuspend() to avoid
being horrific.  Or alternatively should the driver be making the device
cache only when runtime PM is disabled?

--t4apE7yKrX2dGgJC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSh0KaAAoJELSic+t+oim9yNYP/03HbgxKX7ChIe6rPxpivMEn
JooJ4Fv2je6opqeimK0YsQq6uS2WLGWHaHSD2TrycjUta2gpujM2WkiacIUL0Xok
RRXxcPpXl1IYURrvhHfZfabULD/hikpxUd+rPxAhRfeWGZzcc7RJ9elQS2owDgKx
BZ3nOMpee8fMbHzVe0cTaYB++Wvikn5+BywVv6rN1lPyb3lLHdxGlrdiCzzKDc0G
4vWD2eIdBGFQIT0h2KGxsoumJgpAzfdJTu/It1+9rcU2f8bJpkUUd/2OAgLswfBG
PVKgLqQgEbh2VUaGl/1t939qVaJANacE3ANiFokRQqDaudPBROk5H6S9vywc+4Ys
+UDGMkcR6B7Y7fe476lr2GUr1bYGb1LFRIiQ0AVSExSmKg19Hk+Y/4KKmPp/ndZG
2cBXryiqtDKjWukjfAB0DGTN1W3CSHct4HzfABsqbrj5imuSC9kk3iRQuK2+AR4g
tz2puHbbT1xpj4dWP2haOCEfPQrFiNQXqYDZhlgMamsc5IQXYSBhlZG3mHeLvxTO
eigQym2noW/OrfCc0a7881uhqWTS2IksOIpyBXiVtZhkRbkYOrnNB/mSwDJ1HNjI
xz0bHJeAbgaU2jA+QpcyxvzUB6LHCLaMTVGcTEZ5rQFwyQKjze5f4KuoIsYhVZU6
FrdPBFnZu1dymhmJCBil
=pumE
-----END PGP SIGNATURE-----

--t4apE7yKrX2dGgJC--
