From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 1/4] clk: tegra: mark fuse clock as critical
Date: Wed, 8 Jan 2020 12:59:49 +0100
Message-ID: <20200108115949.GA1993114@ulmo>
References: <20191003205033.98381-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8777011363908664921=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191003205033.98381-1-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============8777011363908664921==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2019 at 02:50:30PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> For a little over a year, U-Boot on Tegra124 has configured the flow
> controller to perform automatic RAM re-repair on off->on power transitions
> of the CPU rail1]. This is mandatory for correct operation of Tegra124.
> However, RAM re-repair relies on certain clocks, which the kernel must
> enable and leave running. The fuse clock is one of those clocks. Mark this
> clock as critical so that LP1 power mode (system suspend) operates
> correctly.
>=20
> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
>=20
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> v3: Added comment to the clock table entry indicating why the clock is
>     critical.
> v2: Set CRITICAL flag on the clock, rather than enabling it in
>     tegra124_init_table[].
> ---
>  drivers/clk/tegra/clk-tegra-periph.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to for-5.6/clk, thanks.

Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4VxDMACgkQ3SOs138+
s6F6PhAAlrIuajL3DdiqYncmRYYV7/TjqJxFw2VwBy9bhCisUem0d4zjoIWBl90E
0smLovIXi5278XwG2zdZAtPqA58tKy6xybLzZRez0CY3ACghUSPnfxC6fLH0EMpj
QecOh6LeN6mKkf0EtM810FDRTh+k2YJciaFGV7l5lz+d6qmxEPGeawy81VbnVNyB
F16b9sCYjzqPlEbz/UxySc/b6hD7po6+MBguko8kb6xXs0beKRiKVQ7hJxuOUA2F
RhR1h1amdCArtcqRwWIgTGhS+e+M2sMssv/JCywjBGhm9yMjI6hPffyKkawCoLJD
GUBbV2cnt3ucR1DxmWnnkm1Vks577M11PDro+7V4FM0qWMBsLysO4t2uq2QlkHpk
2tAhMt7X0VvSqtG7pO8aUteCezY+JPck26XOhMuzCVR/ByaaIVi2gEFOzwOezgDy
YuyAa0zL1oB92AjsaTwtgZ7jIULmUox+kEt2IwEJJcDesOGOmTDfsvZTWiXsJe0K
JfhmAsU3jnFHUkgUCATa6gSuZJiFhcfY1pPJoZ2GJDtEHDP0DTF63WDJDDqM/i8l
CTjNIg8dC4MX8wEkZvdZ1VP2Dp/A1zWEl2cppCLX/y5rQFCB8hSyIfYg++KvVN0b
whEWoIWUs0tJfDWAFroFO2GLa6B2n2NbzgaEIKl6tTN6A6p7BeY=
=zoua
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--


--===============8777011363908664921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8777011363908664921==--
