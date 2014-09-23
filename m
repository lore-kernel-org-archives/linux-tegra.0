From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/tegra: Set the dsi lp clk parent and rate
Date: Tue, 23 Sep 2014 09:22:05 +0200
Message-ID: <20140923072204.GJ30514@ulmo>
References: <1411156429-19797-1-git-send-email-seanpaul@chromium.org>
 <20140922174652.GP3290@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1477018014=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140922174652.GP3290@leverpostej>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, mike.turquette@linaro.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--===============1477018014==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="07FIeBX8hApXX6Bi"
Content-Disposition: inline


--07FIeBX8hApXX6Bi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2014 at 06:46:52PM +0100, Mark Rutland wrote:
> On Fri, Sep 19, 2014 at 08:53:48PM +0100, Sean Paul wrote:
> > Per NVidia, this clock rate should be around 70MHz in
> > order to properly sample reads on data lane 0. In order
> > to achieve this rate, we need to reparent the clock from
> > clk_m which can only achieve 12MHz. Add parent_lp to the
> > dts bindings and set the parent & rate on init.
> >=20
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > ---
> >  .../devicetree/bindings/gpu/nvidia,tegra20-host1x.txt  | 10 ++++++++--
> >  drivers/gpu/drm/tegra/dsi.c                            | 18 ++++++++++=
++++++++
> >  drivers/gpu/drm/tegra/dsi.h                            |  3 +++
> >  3 files changed, 29 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1=
x.txt b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> > index b48f4ef..fef2918 100644
> > --- a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> > +++ b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> > @@ -191,6 +191,10 @@ of the following host1x client modules:
> >    - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
> >    - nvidia,edid: supplies a binary EDID blob
> >    - nvidia,panel: phandle of a display panel
> > +  - clock-names: Can include the following entries:
> > +    - lp_parent: The parent clock for lp
> > +  - clocks: Must contain an entry for each optional entry in clock-nam=
es.
> > +    See ../clocks/clock-bindings.txt for details.
>=20
> Did this driver previously acquire clocks?
>=20
> What order or names did it expect if so?

This is badly placed. There are clocks and clock-names properties in a
"Required properties" section above this hunk which lists all the clocks
that this module uses. Presumably this was added to the optional section
because it isn't always needed.

> >  - sor: serial output resource
> > =20
> > @@ -360,8 +364,10 @@ Example:
> >  			compatible =3D "nvidia,tegra20-dsi";
> >  			reg =3D <0x54300000 0x00040000>;
> >  			clocks =3D <&tegra_car TEGRA20_CLK_DSI>,
> > -				 <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
> > -			clock-names =3D "dsi", "parent";
> > +				 <&tegra_car TEGRA124_CLK_DSIALP>,
> > +				 <&tegra_car TEGRA20_CLK_PLL_D_OUT0>,
> > +				 <&tegra_car TEGRA124_CLK_PLL_P>;
> > +			clock-names =3D "dsi", "lp", "parent", "lp_parent";
>=20
> Please document _all_ the names you expect.
>=20
> What exactly are these two new clocks?

"lp" isn't actually new, it's just missing from the example.

> Is this all the clocks that feed into the DSI block? Are any of these
> not directly wired to the DSI block?
>=20
> Why exactly do you need to reparent it to this particular clock, and why
> do you need a reference here in order to do so, given it presumably
> doesn't feed directly into the DSI block?

It seems like the hardware default is to use a parent clock unsuitable
for the DSI low-power mode, but as discussed elsewhere this should be
fixed in the clock driver where we already have a way to statically set
the parent clock at boot time.

Thierry

--07FIeBX8hApXX6Bi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIR+cAAoJEN0jrNd/PrOhPkgQAJ10fdd97TiZtmNa5oiMTbWk
f6RB+B//7oaU9RjGzDlCO7fVpuyH1wBWh2siKVeZUBJLplHftG7+ma3sJg8twL5q
2T/dJNzk1/OlovCK/UCI25r0TJw/VmiZpJQTj7i9PUS6vOKmpCRqU3mA3Jxx0NWT
IRX6dNziRFHwWr76mhNqXBXnR/uW+qCptgXFh/iWgFZZJD3dU6Xm2Z0DLjPO/soj
snIudZSspZNjnMQY2yDnFTfZ0T2AQQTVSn6oHCdisN6D0EcgcIrErnBXzbWSZLtL
hsSD4OUVCfGwlpwv95xcTZ+rgWIGz6tdyLfnRj4NfDeoe2eZluofz86fAO5L9AJh
KdOriCs1AV5uPMt1UptcG4EC4s/SMIJ5kxvexZP0fcuz2fCND/DI9ZYdo3inpEQW
InC3aEodGWcipR4yNwdhzEbqF5Rj6T1R3eX2zVAXs4dse9LIi+zKZdofDfp0aFk+
xi2nMmB35cBPnRnux3NRPJGf1thahRcYbAhr5oP3AueXgIMuxt8VmGL+N+hZt1f0
HtyWiWpVM/ktB0DCH+pfcPWyReCRK2fOj70Wt6yR7gFtuj632Ur2YKe4nUrhP/o1
uf+8tQ7n4IjzF9hucjIKNej8zuLk0u4ordv7QytH571vCVHWDCs0PSNwnZ3ElPLe
zGYJu8PfzTHnidEsez8a
=+LYY
-----END PGP SIGNATURE-----

--07FIeBX8hApXX6Bi--

--===============1477018014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1477018014==--
