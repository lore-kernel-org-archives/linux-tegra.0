From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: Select SOC_TEGRA_PMC to fix linking error
Date: Mon, 20 Mar 2017 13:44:22 +0100
Message-ID: <20170320124422.GB22463@ulmo.ba.sec>
References: <20170311202614.6052-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7981699059981307315=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170311202614.6052-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Joseph Lo <josephl@nvidia.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============7981699059981307315==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2017 at 10:26:14PM +0200, Krzysztof Kozlowski wrote:
> It is possible to create a ARMv7 config with ARCH_TEGRA but without any
> SoC specific flavors.  Such configs fails because mach-tegra/pm.c is
> compiled always and it references SOC_TEGRA_PMC driver:
>=20
> 	arch/arm/mach-tegra/built-in.o: In function `tegra_pm_set':
> 	arch/arm/mach-tegra/pm.c:188: undefined reference to `tegra_pmc_enter_su=
spend_mode'
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/mach-tegra/Kconfig | 1 +
>  drivers/soc/tegra/Kconfig   | 4 ----
>  2 files changed, 1 insertion(+), 4 deletions(-)

I was going to apply this, when Arnd sent in a variant that fixes this
in a way that is more in line with how we handle this for other drivers.

I've credited you with a Reported-by, though.

Thanks,
Thierry

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljPzqYACgkQ3SOs138+
s6HOhBAApvOHSUUr0YmXQUyDtT3l3e/ddFfriWhA0LJwDhz/D7SwoRPV/Jh7w1i2
95+J4W3IJQqZEjBReZCuY0gjzBNwzuuO99jZPwd6ijXKP7BDKMBdL7u8vVAb1cbV
7yoZnZR8BGaB02cfR3+OsPfvBd/PKF0cVZFCOS5AA3uVPv7lVgmZs982lBGOpXXh
xlZAdHKsFCEPGKHwE8/pv/HgfcP4j3i35CmnJJsMGhXYRXUtZDJsJ4CHvsuMBWXB
wmq+YE8ORJtVP0I9BwS1RoDT4vFRHnXvYQ9I2/A4xMWCaesQJjRCQ+OLXfk8kK0j
rbwi9Su0Qxs0LrxTz9FcdJjHY4JnSGq/yN4kYhCArfGrxW3xXT1RX7ujvY0zP2pI
9krNFeHlQGxGcYi3qXjhECwGiEupwg5Mk6YnvY9tnvFjwClTgxRzSyUrWXX4Hc/3
C93IFJs0obpAkTHYzQPlbJdSx42T4WEip2SxK9WFkC168rfuao3iusYYKYJEmRX+
nqw30ClVylUyykfYojS1YC8jeVV5BWUj7Qx72gsf88rmpsOhMtGWdDY3ui4uHuwu
8xkxQjoKPdWVj+YyYefMM7BBtesTthZmoiUcfXubUTI/6GZxi5TzNjm/wdWVeJ7s
Ao2lxc1ROJVvtseHjIj4pabrf2lZrTG/dPlfIyx/pc2md9U0O60=
=/qnz
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--


--===============7981699059981307315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7981699059981307315==--
