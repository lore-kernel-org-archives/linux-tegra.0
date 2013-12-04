From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/31] ARM: tegra: add missing clock documentation to DT
 bindings
Date: Wed, 4 Dec 2013 20:27:14 +0100
Message-ID: <20131204192713.GA23010@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-2-git-send-email-swarren@wwwdotorg.org>
 <20131129114900.GN22771@ulmo.nvidia.com>
 <529B8888.3010801@wwwdotorg.org>
 <20131202085257.GA17834@ulmo.nvidia.com>
 <529E2364.6000205@wwwdotorg.org>
 <20131204084811.GF19943@ulmo.nvidia.com>
 <529F6799.1070609@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529F6799.1070609-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2013 at 10:34:17AM -0700, Stephen Warren wrote:
> On 12/04/2013 01:48 AM, Thierry Reding wrote:
> > On Tue, Dec 03, 2013 at 11:31:00AM -0700, Stephen Warren wrote:
> >> On 12/02/2013 01:52 AM, Thierry Reding wrote:
> >>> On Sun, Dec 01, 2013 at 12:05:44PM -0700, Stephen Warren=20
> >>> wrote:
> >>>> On 11/29/2013 04:49 AM, Thierry Reding wrote:
> >>>>> On Fri, Nov 15, 2013 at 01:53:56PM -0700, Stephen Warren=20
> >>>>> wrote: [...]
> >>>>>> @@ -60,6 +81,12 @@ of the following host1x client=20
> >>>>>> modules: - compatible: "nvidia,tegra<chip>-dc" - reg:=20
> >>>>>> Physical base address and length of the controller's=20
> >>>>>> registers. - interrupts: The interrupt outputs from the=20
> >>>>>> controller. +  - clocks : Must contain an entry for each=20
> >>>>>> entry in clock-names. +    See=20
> >>>>>> ../clocks/clock-bindings.txt for details. +  -=20
> >>>>>> clock-names : Must include the following entries: +    -
> >>>>>>  disp1 or disp2 (depending on the controller instance)
> >>>>>=20
> >>>>> I'm not sure if this makes sense. The name could be the=20
> >>>>> same independent of which controller uses it. If it isn't=20
> >>>>> then the driver would need additional code to find out=20
> >>>>> which instance it is and construct a dynamic string.
> >>>>>=20
> >>>>> Any objection to just make this entry "disp", or "dc"?
> >>>>=20
> >>>> This patch simply documents the binding that the various=20
> >>>> drivers already require and/or whatever is already in the DT=20
> >>>> files if there are any clocks the drivers don't currently=20
> >>>> use. I did consider fixing up all the current usage to=20
> >>>> actually be sane, but that would require even more driver=20
> >>>> changes (in addition to those required for the reset=20
> >>>> framework patches).
> >>>=20
> >>> Okay, I understand. I still think we should change the usage=20
> >>> for this particular use-case subsequently. In retrospect the=20
> >>> entry in clock-names wasn't thought out very well. It seems=20
> >>> like the reason for using disp1 and disp2 respectively was so=20
> >>> that it would match the system-wide clock name, rather than
> >>> the clock's label within the display controller's context.
> >>>=20
> >>> Just to clarify what I mean, if we stick to the above, then=20
> >>> we'll need to add code to the driver along the lines of:
> >>>=20
> >>> char clock_name[6];
> >>>=20
> >>> if (regs->start =3D=3D 0x54200000) index =3D 1; else index =3D 2;
> >>>=20
> >>> sprintf(clock_name, "disp%u", index);
> >>>=20
> >>> clk =3D devm_clk_get(&pdev->dev, clock_name);
> >>>=20
> >>> rather than the much more simple and elegant:
> >>>=20
> >>> clk =3D devm_clk_get(&pdev->dev, "disp");
> >>>=20
> >>> The whole purpose of the clock consumer ID is to be generic
> >>> and as such independent of the specific IP block or instance=20
> >>> thereof.
> >>=20
> >> I think if the code needs this clock, I'd be tempted to do the=20
> >> following:
> >>=20
> >> clk =3D clk_get(dev, "disp1"); if (IS_ERR(clk) && PTR_ERR(clk) !=3D=20
> >> -EPROBE_DEFERRED) clk =3D clk_get(dev, "disp2"); if (IS_ERR(clk))=20
> >> return PTR_ERR(clk);
> >>=20
> >> That avoids having to hard-code IP block base addresses and=20
> >> construct clock names at run-time.
> >=20
> > I think perhaps we're getting our wires crossed. What I've been=20
> > trying to say is that I think the binding should define the first=20
> > clock to be named simply "disp".
> >=20
> > The reason why I think "disp" is a better choice than "disp1" and=20
> > "disp2" is that it merely encodes the purpose of the clock for the
> >  display controller, and doesn't contain knowledge about the=20
> > particular instance of the display controller. That's analogous to=20
> > I2C or SPI nodes where the clock isn't named "i2c1", "i2c2", ...
> > or "spi1", "spi2", ... but simply "i2c" or "spi" respectively.
> >=20
> > I know that existing DTS files use "disp1" and "disp2",=20
> > respectively, but I think that was a wrong choice back at the time=20
> > and therefore I suggest that we change it while we still can (DTS=20
> > files are changing in 3.14 anyway because of the reset and DMA=20
> > binding updates).
> >=20
> > Is that any clearer than what I was saying before?
>=20
> No, because I know what you meant before:-)
>=20
> The thing I was missing is that the existing disp1/disp2 naming is
> /only/ something that's in the DT. The driver (and hence the exiting
> as-yet-undocumented ABI) looks up this clock as "index 0" not as "name
> disp1". Hence, we /can/ change the documented name without affecting
> the ABI at all, and not affecting the ABI is something I was trying to
> avoid in this patch.

Excellent. Glad we're finally on the same page.

> So, how about I fold the following into this patch:
>=20
> > diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1=
x.txt b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> > index 42fe3a498e71..ab45c02aa658 100644
> > --- a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> > +++ b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> > @@ -111,7 +111,7 @@ of the following host1x client modules:
> >    - clocks: Must contain an entry for each entry in clock-names.
> >      See ../clocks/clock-bindings.txt for details.
> >    - clock-names: Must include the following entries:
> > -    - disp1 or disp2 (depending on the controller instance)
> > +    - dc
> >        This MUST be the first entry.
> >      - parent
> >    - resets: Must contain an entry for each entry in reset-names.
> > diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20=
=2Edtsi
> > index 01c20c7dbb51..648c494e927f 100644
> > --- a/arch/arm/boot/dts/tegra20.dtsi
> > +++ b/arch/arm/boot/dts/tegra20.dtsi
> > @@ -89,7 +89,7 @@
> >                         interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks =3D <&tegra_car TEGRA20_CLK_DISP1>,
> >                                  <&tegra_car TEGRA20_CLK_PLL_P>;
> > -                       clock-names =3D "disp1", "parent";
> > +                       clock-names =3D "dc", "parent";
> >                         resets =3D <&tegra_car 27>;
> >                         reset-names =3D "dc";
> > =20
> > @@ -104,7 +104,7 @@
> >                         interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks =3D <&tegra_car TEGRA20_CLK_DISP2>,
> >                                  <&tegra_car TEGRA20_CLK_PLL_P>;
> > -                       clock-names =3D "disp2", "parent";
> > +                       clock-names =3D "dc", "parent";
> >                         resets =3D <&tegra_car 26>;
> >                         reset-names =3D "dc";
> > =20
> > diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30=
=2Edtsi
> > index 58a3dca24c49..829eb4b5091d 100644
> > --- a/arch/arm/boot/dts/tegra30.dtsi
> > +++ b/arch/arm/boot/dts/tegra30.dtsi
> > @@ -165,7 +165,7 @@
> >                         interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks =3D <&tegra_car TEGRA30_CLK_DISP1>,
> >                                  <&tegra_car TEGRA30_CLK_PLL_P>;
> > -                       clock-names =3D "disp1", "parent";
> > +                       clock-names =3D "dc", "parent";
> >                         resets =3D <&tegra_car 27>;
> >                         reset-names =3D "dc";
> > =20
> > @@ -180,7 +180,7 @@
> >                         interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks =3D <&tegra_car TEGRA30_CLK_DISP2>,
> >                                  <&tegra_car TEGRA30_CLK_PLL_P>;
> > -                       clock-names =3D "disp2", "parent";
> > +                       clock-names =3D "dc", "parent";
> >                         resets =3D <&tegra_car 26>;
> >                         reset-names =3D "dc";
> > =20

That looks perfect. Thanks!

Thierry

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSn4IQAAoJEN0jrNd/PrOh3RcQALgoRJzHasYDat4oC2wKr02V
O+at6jHiy/6Y262khJ1ijqgobTM0Kxgj4T2CxTTwZiUNSW1aif7No3wVRvtoHRpm
rFwWlkRK637WVPc03yCSpB9dDTQzpG7UHWXR2eNps2gIvi8DQjZLfLY4ncTcf5g2
ZKhcobc8GMF1wogDa8+nyBm5xWyeb2j0Mi1S/3watsymMi5Zz/gfWF2P7HC/WdTP
oO1/UXaZ3QxEYMrKFdd+NYV/PFyRPffuPDvhDAvylcgFbW4lJW6XZiIpSke/P1+h
NvWxW3cKocR+k1VPu7KcoCHpth91ctr7XOl2RNbTkhyTKiHZvp4fxhdPeTpHAMf0
qVyeSoxzelPLoRxk9PTU/5frqugw0KjuGA6lmxZp3aD8Kjewh3SJIJ5K7sTaizjD
dr3DpauP8J4j79LW68F+tRFYMdLPbd1zFS+LML18Okvg+dfOxuPd4VRYTP6IBEfy
LS5RmdNzh3G/m/vePSyaZGoMPxtCvGX076pVsUgP0dCsGNlPK08sME4os9gK6SBN
42ZnE3yhUI8Rg3pq1vbw1SAK9vZ817m5rrt7bd/ErW+bOQzgwCCITtIiGtMv0KT0
/rWmA4MHdwhiBbE80FBv00+pnO0y34wVDCEzlOcjwY5F7Bg/TqfXIG8+xC2ygk24
GE38x52meYFHVS6SoRiE
=FDnG
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
