From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: support new register layouts in Tegra124
Date: Mon, 14 Oct 2013 14:56:44 +0100
Message-ID: <20131014135644.GX2443@sirena.org.uk>
References: <1381527797-18447-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="krsqJi1PDCheOQxO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381527797-18447-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--krsqJi1PDCheOQxO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2013 at 03:43:17PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra124 introduces some small changes to the layout of some registers.
> Modify the affected drivers to program those registers appropriately
> based on which SoC they're running on.

Applied, thanks.

--krsqJi1PDCheOQxO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSW/gZAAoJELSic+t+oim9gTIP/1d2iMIXtzD2fVP6rWluy2LS
WJaMGSXHfgEXHe/WZV8JfFkdPsl2Evc0wYNpxFM0rHX+l+zWuRqsyX6NusaV4x1N
T6YIp/mplt3Ihd4wGd3HeDcancXqyblrdTEZBAVhjwmVENmyubzdkbH2FqhVeH2i
3AqsqlB77L+dPrfvvBSwOTkd54an6zy1xle7aSbTJlPFzkVD1pOGy+wb8SP4NtU3
kiZ7VQD2rp+toJGiJsLJtkeyH25SLB/3wokJF0zUPE4+tUnbp65aTBtuy93ypzoR
+2IpEybahrV+rxpEEufBuEew4KzOLvFbnIs4j+38NJcpn2QZdF9sw0X2rhiV7F8W
tle4j4xPjz6M8cqus/UqR1p4rADjJOFxVCj3jcaomu4i6tfgntcV9HwbmGx5Cz4A
h2+p2w3zr7nI4u+02rKCjIn3BeC/wBMmxs0pVEuucXPFO9SI6eHyqj0PNze9jJ3Q
P/VTiix45AiJ2n6wfVSBCrFGEC4tS8sC18J5OAWQSKyunLftytjlhTeEuts9Xd6O
E24XyKzzp5wlCTVFk25tDCPje8XSw5nFBemwqZe18XO8CRa0MrGsrzjE8szECRNE
MGuSGQ18HYMnOtxhox7m2gOKucVdE4sYfSeEFuAqWfcs22COSeQ4a6HsXOuF7Mwm
18aetY6fPECLR2tj/+xg
=DtNp
-----END PGP SIGNATURE-----

--krsqJi1PDCheOQxO--
