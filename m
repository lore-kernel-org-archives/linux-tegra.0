From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH RESEND for 5.6 v1 1/3] clk: tegra: divider: Check UART's
 divider enable-bit state on rate's recalculation
Date: Fri, 10 Jan 2020 15:52:16 +0100
Message-ID: <20200110145216.GI2233456@ulmo>
References: <20191218184407.25790-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6lCXDTVICvIQMz0h"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191218184407.25790-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--6lCXDTVICvIQMz0h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 09:44:05PM +0300, Dmitry Osipenko wrote:
> UART clock is divided using divisor values from DLM/DLL registers when
> enable-bit is unset in clk register and clk's divider configuration isn't
> taken onto account in this case. This doesn't cause any problems, but
> let's add a check for the divider's enable-bit state, for consistency.
>=20
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-divider.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

All three patches applied to for-5.6/clk, thanks.

Thierry

--6lCXDTVICvIQMz0h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4Yj6AACgkQ3SOs138+
s6GxRRAAkhh+jeJ2znxH5p0u5lU7TnqfCZkhhIf9AuHOtxu8TBDgvsruRrJRS86P
hAc4z201mWg29UpR0R9fOvuQhGNGvuYAGU/m46Utq9XLQLlG5ZLNsettLgBmg/Ju
u4yX3YIrDvBde7/xgWB5GjBUhzTkDrcdn9nz12DHbE2weHao8xK5zeEosZw/LdYs
IDkKdGeuzYlFM3yo/Kro63RgHsG6srdoXid4elJt/RdcwrNY13hROSyGTuE5LXx6
6iZHUaMh/E947uCPe3/H3S+Sy2ZWR/6bu44kp3h6B6vh0ybyOUG4cfeJT2bqNXOb
YB6sqcXSwJapIpPy2jmQzx2LMUJPpsFglHF2E27IV2D1z7DEDSNdR8cGm0wy8CBR
xhKujgI0hs5y84GuJSFlqM1bTndC2/3GvAAqTW5BH0IekzmffvJt2a2NCwoi6jB4
HKji0Dxw4XzHkiWj+RE1tXfZu7IKOsz0W029+LX9G4EhiYAMJ7+KkJp3lHJ1f487
a3p2uRoBneOYSLMALSZ0OqNu9GWXqqUVd+nf+VH5WpLGCHpGqzXnfJyqIWyhpUey
XXkZfqhzFEjyawT4EAPVnkfOtwYuWjSV/Iz4v9qbGj/6GMy/yN6jZ6Y3LlV/kQ6y
pJq9/0eNDwcTjAsiD1z2+/eHLFhy3Pzks3GRi+Y8gdkjkxl+ppg=
=oKAe
-----END PGP SIGNATURE-----

--6lCXDTVICvIQMz0h--
