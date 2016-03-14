From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: tegra210: Add SLCG override gate clocks
Date: Mon, 14 Mar 2016 17:05:51 +0100
Message-ID: <20160314160551.GA21898@ulmo.nvidia.com>
References: <1457638685-31007-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457638685-31007-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 02:38:05PM -0500, Rhyland Klein wrote:
> From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Add some SLCG (Second Level Clock Gating) override clocks to control
> gating and un-gating their logics.
>=20
> Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-id.h               | 16 ++++++
>  drivers/clk/tegra/clk-tegra210.c         | 91 ++++++++++++++++++++++++++=
++++++
>  include/dt-bindings/clock/tegra210-car.h | 32 +++++------
>  3 files changed, 123 insertions(+), 16 deletions(-)

There's no rationale given here about why we need this. What will these
second level clock gates be used for? Why do we need these (seemingly)
duplicate clock entries.

Thierry

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW5uFfAAoJEN0jrNd/PrOh1TgP/1h9VPSQRARcsd6LdEVfaXU6
4hjfIEQf3INCd/1epqthnToW9vEGt9vk84gcZa3F3NoSKb540if3Jpylfm3f44Rg
2tPNn+/H0KMa6zd+wNT3h+wN7ImhZzSL9dj6NsJlHqQgqL/OaFDZ9ljTfeiiIUvY
DOMgZwGq85IxWjEOUAJZGD0nQSnMJCtRATHDi1ShmpV0olcs8e4lBjrVBJxA2Tyg
EK6mGK+YxPkQl1wUEfYu5Y4EKYyRGfXDsMQzZsJop86Nf0iTXfhZNn9+D/w86hfE
z2pCFmBvKTL1dzwJnBKO/88t9uMZM2IAn2PBkbDul//gGZ1Hai4LNUpfjZzOhHnq
g6iCc4PwMdAB4UL9D07IiROdeqiSJxriA5vllxOL4zedU+2ThKl4RVs90TNHhJYb
7BB8QTFNLVlcBAd8yLqe+s3/zcw6FtLJVWyyZdVsOK+TIzxBF4XmIMbg6F7wOkfU
UxOUE0ol2rrwHhFAAk3zl8wF5xEfMCbQefyeDDH1rwfJmHXK2QaLl864e4DpXoJX
2wMbeHMbExtpw0Kib8PaLKERt11lrGz/ZRppln02GXgUYc3JhqFckVV77LXnLmFK
66ZeYJM8DwVyqloFoXpdyfORdB7isfomk/irBsCSH6vy6vBMKc4nxtDAFmCT6kyy
DWXEd3yTyQ2fFafMa52l
=ztSB
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
