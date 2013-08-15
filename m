From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: fix Tegra30 I2S capture parameter setup
Date: Thu, 15 Aug 2013 11:08:06 +0100
Message-ID: <20130815100806.GV2401@sirena.org.uk>
References: <1376511856-28044-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K5z5w9fsx/Hrkgg3"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1376511856-28044-1-git-send-email-swarren@wwwdotorg.org>
Sender: stable-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--K5z5w9fsx/Hrkgg3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2013 at 02:24:16PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> The Tegra30 I2S driver was writing the AHUB interface parameters to the
> playback path register rather than the capture path register. This
> caused the capture parameters not to be configured at all, so if
> capturing using non-HW-default parameters (e.g. 16-bit stereo rather
> than 8-bit mono) the audio would be corrupted.

Applied, thanks.

--K5z5w9fsx/Hrkgg3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSDKiDAAoJELSic+t+oim9yaAP/iwHm4f05BvzHCu+q2Lmiewe
hpQDLtxFaeQjHbSHsJvvjkvJ1JxSh37RBFnqTsCi5VM/RC5Te8OX/o7DrMnM4Y8m
ytvVJYr3dd17YkM/l8oMwBjRTzhqO5NEd13AdLfwQG4Ko8Q1A6B2QAgWlDRFT58s
8R8xR2d6wvCvc++HGFhtH36dBlkcu7mCqukPJZzyzbV1nwBnr0lGVza2kB3/WQyC
gJ8J5Ec+SoRy+gAslXj1CyYDIJj+FfL15h4WtqSnlSS/NlEF5H6ThDzDOx63yZxY
VK13GUocTR2X73KRd5aPuK+mqoQdK437+X1LMxvqKtLjs0u0u9p4YFFZtMRGwCfX
1GdeQxNl1n5tt9rDGPNu/nLK3sTTE1BhslOs6HFzsFSgHofbGULZkT+YdMUb+1pL
4QrAkWwJ0YblsNf+iA87+lHG/BiwflY/75G4PDNmMTzYL/KJCDbbdyP1O3agVbz/
ue5cu1SjEWzF+tiZP+GwodtXSrUtdBnK/L8PjYt8FWrRPF4NJWu4qLt58QrSQ1FK
y8Rc2DjnLAPbZ2jQxM/GDK11b9W4yt7iAEOSDTZKU9i+kEfa71Nzj6GdxHabz39v
jOZHYLjQRwyofgvqvw9UtjcezfYjuYjudPh+aH1nm/kQ3Ct/gfTC+oajc4XaNxoo
t+o3iB5OekU/q947nV3z
=mQp6
-----END PGP SIGNATURE-----

--K5z5w9fsx/Hrkgg3--
