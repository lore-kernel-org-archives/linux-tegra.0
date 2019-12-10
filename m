From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Date: Tue, 10 Dec 2019 14:21:46 +0100
Message-ID: <20191210132146.GF2703785@ulmo>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
 <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yH1ZJFh+qWm+VodA"
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>, "heiko@sntech.de" <heiko@sntech.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>, Yangtao Li <tiny.windzz@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "palmer@sifive.com" <palmer@sifive.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "rfontana@redhat.com" <rfontana@redhat.com>, "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "john@phrozen.org" <john@p>
List-Id: linux-tegra@vger.kernel.org


--yH1ZJFh+qWm+VodA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2019 at 08:44:39PM +0000, Leonard Crestez wrote:
> On 09.12.2019 21:58, Yangtao Li wrote:
> > Use devm_platform_ioremap_resource() to simplify code.
> >=20
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >   drivers/clk/imx/clk-imx8qxp-lpcg.c | 6 +-----
> >   1 file changed, 1 insertion(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-i=
mx8qxp-lpcg.c
> > index c0aff7ca6374..10ae712447c6 100644
> > --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> > +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> > @@ -164,7 +164,6 @@ static int imx8qxp_lpcg_clk_probe(struct platform_d=
evice *pdev)
> >   	struct clk_hw_onecell_data *clk_data;
> >   	const struct imx8qxp_ss_lpcg *ss_lpcg;
> >   	const struct imx8qxp_lpcg_data *lpcg;
> > -	struct resource *res;
> >   	struct clk_hw **clks;
> >   	void __iomem *base;
> >   	int i;
> > @@ -173,10 +172,7 @@ static int imx8qxp_lpcg_clk_probe(struct platform_=
device *pdev)
> >   	if (!ss_lpcg)
> >   		return -ENODEV;
> >  =20
> > -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	if (!res)
> > -		return -EINVAL;
> > -	base =3D devm_ioremap(dev, res->start, resource_size(res));
> > +	base =3D devm_platform_ioremap_resource(pdev, 0);
> >   	if (!base)
> >   		return -ENOMEM;
>=20
> This breaks imx8qxp-mek boot by causing most peripherals (like uart) to=
=20
> fail to probe.
>=20
> The old and new paths are not equivalent: devm_platform_ioremap_resource
> calls devm_ioremap_resource which differs from devm_ioremap by also=20
> calling devm_request_mem_region.
>=20
> This prevents other mappings in the area and imx8qxp-lpcg nodes map=20
> whole hardware "subsystems" and overlap most peripherals. For example:
>=20
>                   adma_lpcg: clock-controller@59000000 {
>                           compatible =3D "fsl,imx8qxp-lpcg-adma";
>                           reg =3D <0x59000000 0x2000000>;
>                           #clock-cells =3D <1>;
> 		};
>=20
>                  adma_lpuart0: serial@5a060000 {
> 			reg =3D <0x5a060000 0x1000>;
> 			...
> 		};

The whole point of doing a request_mem_region() is to avoid having
multiple drivers trample on each others' mappings. What you do above
doesn't look right. Why does that clock controller need access to 32
MiB of I/O memory space?

That said, there are legitimate reasons for sharing mappings across
drivers, so I agree that automated conversions like this should be done
very carefully. The difficulty is that there are cases where drivers
simply omitted that request_mem_region() by mistake and where the
conversion can be correct (and in fact an improvement), but we can't
make the assumption blindly.

Thierry

> I don't know if this issue affects any other platforms (imx8 lpcg=20
> bindings are unusual) but if you found this with an automated tool=20
> perhaps it should be adjusted?
>=20
> By my count it's the 4th time this incorrect cleanup was posted.
>=20
> Previously: https://lkml.org/lkml/2019/12/4/487
>=20
> --
> Regards,
> Leonard

--yH1ZJFh+qWm+VodA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3vm+kACgkQ3SOs138+
s6GULxAAilZa8OEmaTs15SX7kJWFjGSMuGZCPAm85TmYwx53oHvbjOuvkDgdiJVy
bHs51DNXVvFeKTKCiiZLDflAjAhtV6lFBx0mqUk6re6p6Ix/wvmGqZUSJyFOgXBs
DR33v6akOaCrtnJTEyyCvVJf1RmYd4T+MeONWbm6rfz93xzxT9DZmrU4I7VmRsxn
8onxkgYw9VjtJQBxR++NgKmCqDoVmsf5nLBQxhuvZpFADhUPwhTfdkv4ehEmPETE
WcdPQkzbQtqqjWvIMq0SDMr5wxybbQzZKb1j/R0H5umvNAAJYdxihPcMsLuXf5iX
paNWTVxUjnRzmiPUzy8dPsxBYhlazonR791Clt22p91PJ+/WceAgPW7AaBWZnHT1
U2jGi1puhPTaUIe93EUS4mgmMUOmbXFoLGBdj7tw9gla4OW8fCsQyIr23gXgCSWp
iM2eHKLajC3q1sz7nwQ/YmJcEbXzu5BUF1XLo/MyOE04wdqnVAUGnDhSW06MOZpR
/28nhqZxRMGeTSpGN4wjLGl/7zVF7U9XZVF+1mkgGBAWLeKoHZ+zznk7eRRAs3jm
G55LaB83ZpUlJcRGTb6mvTMLntmcKTdff5IyNND9S5QRAzsxnUqS3PIGARSm5erh
aM8vbqsy8rN4viYsg6b4AnC3pkXuzP9g6CymxLl8NlFMykwKJZE=
=S6GE
-----END PGP SIGNATURE-----

--yH1ZJFh+qWm+VodA--
