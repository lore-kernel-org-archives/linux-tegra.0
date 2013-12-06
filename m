From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ASoC: tegra: fix uninitialized variables in set_fmt
Date: Fri, 6 Dec 2013 22:07:11 +0100
Message-ID: <20131206210710.GA1685@mithrandir>
References: <1386362090-29250-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386362090-29250-1-git-send-email-swarren@wwwdotorg.org>
Sender: stable-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2013 at 01:34:50PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> In tegra*_i2s_set_fmt(), in the (fmt =3D=3D SND_SOC_DAIFMT_CBM_CFM) case,
> "val" is never assigned to, but left uninitialized. The other case does
> initialized it. Fix this by initializing val at the start of the
> function, and only ever ORing into it.
>=20
> Update the handling of "mask" so it works the same way for consistency.
>=20
> Update tegra20_spdif.c to use the same code-style for consistency, even
> though it doesn't happen to suffer from the same problem at present.
>=20
> Cc: <stable@vger.kernel.org>
> Fixes: 0f163546a772 ("ASoC: tegra: use regmap more directly")
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  sound/soc/tegra/tegra20_i2s.c   |  6 +++---
>  sound/soc/tegra/tegra20_spdif.c | 10 +++++-----
>  sound/soc/tegra/tegra30_i2s.c   |  6 +++---
>  3 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSojx+AAoJEN0jrNd/PrOhALIQAIxBxfbhbD1baWhgKa+OoQZf
xEeRKf2grsvbB7B3lWb9rEI70UwP8R6KWl0F03XOXGZGsBbTrmvOx9kshTvtdm0g
PLzg9iLFS4WVarHqdtln0x1/cz4er97N4iwNjOqpJsmsC8hIAsR55SOKqoRmoqLB
MFoG0B3McgZ0Q9xe8A60500+9gtFfnSgV62bEmqSSSEThV8TbPjB9hW9okdLNexL
fVzScWFHIeGYzNOmBEw9LCdEVItebDpBP6p+PCgWQRDc6X78kpyQgoUZjMO4Ornq
zb3UWhxATpXJt2XfykmCRGO0chsJEyZMU3IexNacULH/wxHwsRVkLuM2eqwK4Pm7
hgQyIEDap3VvnYPfXPp/kXPr/OEQgKz/2OwhXyJmEwRppQRbNxAfDSycj+x//LDW
4yVL1rvcZy2HhSrNwXO/VMAW2vCa659vYf+eOQN742LVun/BItflHr6b1pNQHs+z
X5Fj7bosc5XMMUjwUydwAYmawrHz7vy9Vw6XTV692oW/6p5I3Mgf8FjeYBZL/GX+
g6XZmXDFqtanLT6UZt37yIeLtu2bFHAaAQwHmxEu3zJ0yhEl1fanZ5i3a7XOqvzv
vFvq0rWdH+MYoo3dajBBr9ov8isYuSFBQuYyNLgDjhoV9odsxmNMeP6C3gTEVi5B
TENqyngtpk8dpE1g5Ml6
=gNd2
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
