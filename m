From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] clk: tegra: move _calc_dynamic_ram_rate out of #ifdef
Date: Fri, 20 Nov 2015 16:10:32 +0100
Message-ID: <20151120151031.GD3300@ulmo.nvidia.com>
References: <4290741.p1jMzEOUEU@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <4290741.p1jMzEOUEU@wuerfel>
Content-Disposition: inline
Sender: linux-clk-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rhyland Klein <rklein@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2015 at 11:32:33PM +0100, Arnd Bergmann wrote:
> _calc_dynamic_ram_rate is defined inside an #ifdef but called
> later in the same file outside of that #ifdef, which can cause a
> build error:
>=20
> drivers/clk/tegra/clk-pll.c: In function '_tegra_clk_register_pll':
> drivers/clk/tegra/clk-pll.c:1541:29: error: '_calc_dynamic_ramp_rate' und=
eclared (first use in this function)
>=20
> This moves both _calc_dynamic_ram_rate and _pll_fixed_mdiv in
> front of the #ifdef to make all configurations compile again.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 44c8b9fa432c ("clk: tegra: pll: Fix _pll_ramp_calc_pll logic and _=
calc_dynamic_ramp_rate")
> ----
> The patch that caused it appears to be older, but I only ran into
> the randconfig bug today for the first time. Apparently the commit
> is only in linux-next at the moment, not in 4.4-rc1

Hmm... this looks familiar, I thought I had included an equivalent patch
in the clock tree. I'll go do some digging, but this looks exactly like
what I had done at the time.

Thanks,
Thierry

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWTzfmAAoJEN0jrNd/PrOhxC0QAL0mKUm99890XJQWumHt3akC
e7nPpyPLhi9s89HzoPd1y1BwI9lT2mY/09OAxeAsgM//7blAucf+9+HSLmPe7JJc
puLZYDXy6QAgmqqPODFahJcemU6PfRcU+JDM5+73Ym6lc71v3KEsFKtqWhy+FT+a
XO02Vw9IL8w5pN1QtZ2jG0l4T8Rj2V66WreGl4+4/of6F/IL+p/MrIV7tNdaFDdi
brWKGLBh21ihHjmhd/5W2UkpSlg+lbl5O7JJlCeneHfSVHXhYXvXiK1zziUeMSo+
P6BASGqY+K88s0i+dQt+VOUpgUJP+swFY60eH3ynjc69/+QMRdafyKUsRtIDvryY
Smr8YRXGypmHfyDPdZJEgnineGscfy2Yxl/AHub5/QNaa7OJE/Rj2vTBq+e+j7SP
RAO/UAcNDQ1R7k3jb1/lz62s7GBAmt5MJJ+Q9WXWgxF8wxHOayD7D7dlMquWvCzP
YOsVwymMb5CRcs2DxuSsFVPojtc4bVYiXopMg1DfL+uCKFx+qEM7EeyoIDKHfKvd
l1SQ+5T4EOKx5NnmmEN9aXXBIJS9taep2Yyr2AUv/yerSgAByOplwki0JiKzpRky
GGhL6wmkzSpmxgwmQYxFn9nKYgd8DuciJOh47qpQ8w6tFL/Ub08kFemow2dnF93B
8O1rQ4OGzgFRf48nDnDx
=K6N1
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
