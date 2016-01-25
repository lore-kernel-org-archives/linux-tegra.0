From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V2 5/9] clk: tegra: pll: Fix potential
 sleeping-while-atomic
Date: Mon, 25 Jan 2016 13:40:04 +0100
Message-ID: <20160125124004.GH20452@ulmo.nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
 <1452799478-14791-6-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k+G3HLlWI7eRTl+h"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452799478-14791-6-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--k+G3HLlWI7eRTl+h
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

--k+G3HLlWI7eRTl+h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphekAAoJEN0jrNd/PrOhXlsQAJCkU+FneOsQzZZXHPqyVfC8
WBtoO1Lsnc6AwmzGQbbjS54gku4TptEKrEbxz6h2AXilhmGZIEav9bu6J6hhBkpU
2npLKPpfQGq1+D4B2uxX9Np/IsqCQtIkraHmawVjy3Zo4ww3tSw3RJg8VeBTK6wZ
oGblDnXVPXD6oKQJx2hGg8soUTjHFuBR2HTYAWMOrPXDwjbw7P8bWthQo6fsK/e0
8+8Rs2sXLAQ1VPAV0lw3whTs9w9QqAIn6ioxpIk4pl3U5jenFSm1DcFLNDFDm35o
W3zwbax1Smt9ypA+4jbtBT3qmJDhMD8gejan9oZI9hWZvB2+SJZh4lEA7w/JS21A
OES/0eZXAKU5BBKHmUStMdGc7IUsAYKRvIXCCcA2NY7HIjQeFzPdxsw2uX4iiaHX
c7DwNCBqLxDMccRnlIM9KPNaKmwdVF1mvHo+14OKiYEXFPa3QoW8rbRa3O9azlts
VYs8z74zbGYnbBxFhm6e66vslAMSLS2MJTrORWej5sFr5m8Mw+bJQrwQJuENayyo
TmoZ97it1bZkFOtgr73fNPkYhmf0yAn2ROgN49xvMzmfxdG2dQYI97AALdgYrGhI
2XK6/LQZLkcedj9j8A0/mYIuYT19w16Jo0W5ko4Axa3rwN2KR35dcf3aJ4Dm4o1e
Q9KiCVHQvbrMBjb2Rd4/
=IBtp
-----END PGP SIGNATURE-----

--k+G3HLlWI7eRTl+h--
