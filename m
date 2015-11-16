From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: use "depends on" for SoC configs instead of "if"
 after prompt
Date: Mon, 16 Nov 2015 10:31:13 +0100
Message-ID: <20151116093113.GI32142@lukather>
References: <1447643170-23773-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4037397319716636747=="
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1447643170-23773-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens@csie>
List-Id: linux-tegra@vger.kernel.org


--===============4037397319716636747==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+ZmrHH5cGjskQnY1"
Content-Disposition: inline


--+ZmrHH5cGjskQnY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 16, 2015 at 12:06:10PM +0900, Masahiro Yamada wrote:
> Many ARM sub-architectures use prompts followed by "if" conditional,
> but it is wrong.
>=20
> Please notice the difference between
>=20
>     config ARCH_FOO
>             bool "Foo SoCs" if ARCH_MULTI_V7
>=20
> and
>=20
>     config ARCH_FOO
>             bool "Foo SoCs"
>             depends on ARCH_MULTI_V7
>=20
> These two are *not* equivalent!
>=20
> In the former statement, it is not ARCH_FOO, but its prompt that
> depends on ARCH_MULTI_V7.  So, it is completely valid that ARCH_FOO
> is selected by another, but ARCH_MULTI_V7 is still disabled. As it is
> not unmet dependency, Kconfig never warns.  This is probably not what
> you want.
>=20
> The former should be used only when you need to do so, and you really
> understand what you are doing.  (In most cases, it should be wrong!)
>=20
> For enabling/disabling sub-architectures, the latter is always correct.
>=20
> As a good side effect, this commit fixes some entries over 80 columns
> (mach-imx, mach-integrator, mach-mbevu).
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

For the sunxi part,

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--+ZmrHH5cGjskQnY1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWSaJhAAoJEBx+YmzsjxAgRzAP/2IPDrr1+XTvepBrNOnbtx7p
gZlC40SHosXsKjn4otsKaqDSBNL9r5UwJ6oVtTy5PMWkjJqmgCmAk1gMTMbLaczH
88pXkM5r6FYngnYu0IclQO8sUBKLvK61zs1HnVfQwAQygz6JMmBsuY3lGrOX8oO0
1FeoHFgz+2QzUkqgVV0nc6xQeBLQ3CKtrKH/V+8CCAww+IQ8Wl0HfnhbF1GUcZch
dFEJ1iFDQwt6S394aNrODKyGgU7dj8kKIewKHpoUVgFryZDZwQwV25gJ8nliIr41
HCaSq74VzocA+l0ET6DR1xFB6My2YemyuZ/6nySOFGLUXF5j479hCBJI1Ne+A4FR
MouoalBgAW4zvBE1mN0bbFa0aaJlcSIk0zPZOqNWCw7sCdkroMsHsv/5CbF+piEy
J/7MK/pYey1oy6NSqO5Wisi6Y7c9xhgI982SA7FBxTeBkMw21cF9aJeI3vUbaZ0R
6+pnuuKvBNDWHkGvF5Q95JCa0cvpNzSbX1xrsSnERbI4qneuC/T3FCV+0ia8OO2v
jLybvlPpCbRdFonEh2LVd6SsJ1Um+vmDgTiYQwtWmtwNJPvwnSj+pIlLoJKjQ2Sa
kdABVg7Da55C1P99ulXapER90yiyRB4F/toKZ4hetrfZhE55nxAmfa/g2FObfKuB
49K0+EWWledbW9iy3vxg
=ANCV
-----END PGP SIGNATURE-----

--+ZmrHH5cGjskQnY1--


--===============4037397319716636747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4037397319716636747==--
