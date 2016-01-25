From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V2 5/9] clk: tegra: pll: Fix potential
 sleeping-while-atomic
Date: Mon, 25 Jan 2016 13:41:25 +0100
Message-ID: <20160125124125.GI20452@ulmo.nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
 <1452799478-14791-6-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PWfwoUCx3AFJRUBq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452799478-14791-6-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--PWfwoUCx3AFJRUBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 02:24:34PM -0500, Rhyland Klein wrote:
> From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> Since the ->enable() callback is called with a spinlock held, we cannot
> call potentially blocking functions such as clk_get_rate() or
> clk_get_parent(), so use the unlocked versions instead.
>=20
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> [rklein: Adapted from ChromeOS patch, removing pllu_enable cleanup as
> it isn't present upstream]
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-pll.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--PWfwoUCx3AFJRUBq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphf1AAoJEN0jrNd/PrOhrMgP/jQhnCB7J5uGZV69boXpfULY
A8iJejOtkNEAkceVWSv/4Gt/iIjMxIqKDv6aYUr/k8PXo5nHBs3fnitBtxP+qrjL
EBcqt4REsr++ly0oMCM30jT0cux1Ttb6pnFFTXz3C0bWWsFDMlBbwFR68BDanhch
AmD9Dm4xjVfoPhLkzIAdcjsqI4K58QV1ql45SyM4V88StN9zvAI25OAkXT4LheCZ
NKqy9mvpHFapUlGRvuS+t4FttOZXg7Xk0skhdCX9ORGtbwd6C7C6i8osvDls1MH7
k7GjG7R3kq5UMZQX4A2He+sgkfTO9/SUEPcduOyDzFtjcKtZcZR+LTdurwvdv5Qs
Vum7D9Y9luj3KzXVZQVwJB0a2J1V4TTXZhv+zEkHbFW8cm0sklQOWjGLFSb/it5d
+qHEnbwrBHLz32/RXHnWD7CqeEOr67VQ+tkKAUXmzZzNjfcRfFIbQrVZLSwz747d
tpWDkS9NjV1jmlflYOxyYaOGcjE1rYGKJr88THi9VNbb+bJdy6O46tElkR0i/oYJ
FaqxPVEuqXpalgHuQLowYCxjEXKREYp2bx1OHYUGnq6NIkV6nbNgGBJKuFcbRFu0
f2wOod3LiLDKZwQEKEwkwJj6jyH//o7zlpA4Cv8M0NEqZvA9LEuCAFKVH9umMEWP
OSfiLXjf9M9UkjhVGJle
=+dKs
-----END PGP SIGNATURE-----

--PWfwoUCx3AFJRUBq--
