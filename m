From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 5/5] i2c: tegra: Add I2C interface timing support
Date: Thu, 31 Jan 2019 13:50:15 +0100
Message-ID: <20190131125015.GK23438@ulmo>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
 <1548915387-28826-5-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UlsYxwg8UDQn+EKZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548915387-28826-5-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--UlsYxwg8UDQn+EKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2019 at 10:16:27PM -0800, Sowjanya Komatineni wrote:
> This patch adds I2C interface timing registers support for
> proper bus rate configuration along with meeting the i2c spec
> setup and hold times based on the tuning performed on Tegra210,
> Tegra186 and Tegra194 platforms.
>=20
> I2C_INTERFACE_TIMING_0 register contains TLOW and THIGH field
> and Tegra I2C controller design uses them as a part of internal
> clock divisor.
>=20
> I2C_INTERFACE_TIMING_1 register contains the setup and hold times
> for start and stop conditions.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  [V8] : Updated to handle timing implementation within tegra_i2c_init dir=
ectly
>  [V7] : Minor updates to timing implementation
>  [V5/V6] : Added this Interface timing patch in V5 of the patch series.
>=20
>  drivers/i2c/busses/i2c-tegra.c | 187 ++++++++++++++++++++++++++++++++++-=
------
>  1 file changed, 158 insertions(+), 29 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--UlsYxwg8UDQn+EKZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxS7wcACgkQ3SOs138+
s6EuAg//R7O3xNYPKqmFBL6WnIleMs2ii8nXNh4msfa3KTIS2p86SUSE36a2zpL2
2UoflWAc39ZMNpomvrI0NwZrUBoUWFYczEiWHtda6N3CLHzzqvLCOWUJ9Moo43Vq
LiCsMJUYLonikftcCrr9ADY+9cxdAmSs4+DV4ADtZFEVAeUU+E0cd5Y8aFOUONwc
yVEflqm11tID7jgwZMgszxMCAgAM5FPStc+/TdZxvUpCd2wCqzsOYYSC8HiHEbX6
/oxJ+BUTF5qeQaRIgfw0LAL3dleeIkqNIDWBk6/Pi6giNhCaDKxPfUJG/9OC34/j
Fxwb0qnHSIMKDKH8i0GMPU2G00Wmcva+TgpuGfuyLoA4xEKb3ffPtRgtDQsc/xz+
kVrNrG1i/6BJKV2TJ8Pv/lmijCjSGPbK0AuPRa5J2remVRwyzkOG2jDD9LW+GZjp
T5IHTl2zFXGjz+PVQK7BjA6dEbZiZpai7+MI1W0um/SHMfjqWilMkciV2P2uD3xY
LQdvvZutNMnXwuYjFfM7Get4ozjzuBU/ds+FgK28Lhg4nPrtpnsQq+hKe87ACTm1
ogq/Dtg+uWgZLbDQHp4IpqbnKfjabj07fqOSKdUIXhRoR7sF2YPT7B3PmwECeS9P
u/pEWi3YNIrqgqgArG5P8wCzhru7dTsI1Bw5H1FPacLp5I/91CM=
=fS/Z
-----END PGP SIGNATURE-----

--UlsYxwg8UDQn+EKZ--
