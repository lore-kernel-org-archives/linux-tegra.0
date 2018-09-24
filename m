From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: Return the exact clock rate from
 clk_round_rate
Date: Mon, 24 Sep 2018 13:40:37 +0200
Message-ID: <20180924114037.GT21032@ulmo>
References: <20180921220149.17136-1-decatf@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bn6XL8m8Y51x7rzV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180921220149.17136-1-decatf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ryang <decatf@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--bn6XL8m8Y51x7rzV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 06:01:49PM -0400, ryang wrote:
> The current behavior is that clk_round_rate would return the same clock
> rate passed to it for valid PLL configurations. This change will return
> the exact rate the PLL will provide in accordance with clk API.
>=20
> Signed-off-by: ryang <decatf@gmail.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

With Peter's comment addressed:

Acked-by: Thierry Reding <treding@nvidia.com>

--bn6XL8m8Y51x7rzV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluozTUACgkQ3SOs138+
s6FelhAAvGzqVXT5LttZWdkwXLxdR4HGb90RkeYQLaA8/CAl+SaBOCatNzcT3Lir
pdceI62Jl9PjVK5WiPCXcm3BuIWCNmXBDuiaHZ9qi4Zv7USl7Jc2/7Pq/Mtr/CJW
plmhdu65Elad217ExedOptrsO8rRTEuh+mJKY4kBmN7MxovhPSt8jQCXZeMhMa1U
2FJKM66nZIxR0Eq40BH16WOovqXkbT2+mQZNiZyssyCh5VrqKhru5Qw4tG6p6sUi
VCiFt9RbT/OCXFlBatu8i19J+EPvT3mgyjXjpz1O40kWO0oQFAL7QUmLUQhqoybS
XQ5lq7+UiOeLRq90+FldMZsAAylMwzg6dxFLDd+zGjcYJYMIYWBvUPUZxcG708mz
/RefvWtwk1r4GokkfwZfZqDzd/71Cxs3WJp/hMcbxzIYDw+9nK54YgNxvVU2CDdK
QONWALQwQBUutxH0R1lTH10u8yBUg1OAMyq9K8f/XQx2Z9Elcz69Dwml5s9Ot/wI
K1Cu2r3cn6kZD3rKiphNQxEdPX3jER8OoB8FnCj1D7/YOmdyOlxX/GI0YS4oS8UB
xhlxJhK6Q6dbGpiYyJk6o2KJ+r/BmHhUy6fgCHPg2pJ/nXYmwXy/Dd0UVmuGCrLo
8ZXxbSkAN8RbjTNOd7X+zeXINLP/osPv8+ev5teCgUZNslFh4cM=
=xTtX
-----END PGP SIGNATURE-----

--bn6XL8m8Y51x7rzV--
