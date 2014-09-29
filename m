From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/tegra: Set the dsi lp clk parent and rate
Date: Mon, 29 Sep 2014 10:17:25 +0200
Message-ID: <20140929081724.GD12506@ulmo>
References: <1411156429-19797-1-git-send-email-seanpaul@chromium.org>
 <20140922174652.GP3290@leverpostej> <20140923072204.GJ30514@ulmo>
 <20140927200532.19023.95967@quantum>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1848626136=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140927200532.19023.95967@quantum>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mike Turquette <mike.turquette@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--===============1848626136==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZRyEpB+iJ+qUx0kp"
Content-Disposition: inline


--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 27, 2014 at 01:05:32PM -0700, Mike Turquette wrote:
> Quoting Thierry Reding (2014-09-23 00:22:05)
> > On Mon, Sep 22, 2014 at 06:46:52PM +0100, Mark Rutland wrote:
> > > On Fri, Sep 19, 2014 at 08:53:48PM +0100, Sean Paul wrote:
> > > > Per NVidia, this clock rate should be around 70MHz in
> > > > order to properly sample reads on data lane 0. In order
> > > > to achieve this rate, we need to reparent the clock from
> > > > clk_m which can only achieve 12MHz. Add parent_lp to the
> > > > dts bindings and set the parent & rate on init.
> > > >=20
> > > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > > ---
> > > >  .../devicetree/bindings/gpu/nvidia,tegra20-host1x.txt  | 10 ++++++=
++--
> > > >  drivers/gpu/drm/tegra/dsi.c                            | 18 ++++++=
++++++++++++
> > > >  drivers/gpu/drm/tegra/dsi.h                            |  3 +++
> > > >  3 files changed, 29 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-h=
ost1x.txt b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> > > > index b48f4ef..fef2918 100644
> > > > --- a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.t=
xt
> > > > +++ b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.t=
xt
> > > > @@ -191,6 +191,10 @@ of the following host1x client modules:
> > > >    - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
> > > >    - nvidia,edid: supplies a binary EDID blob
> > > >    - nvidia,panel: phandle of a display panel
> > > > +  - clock-names: Can include the following entries:
> > > > +    - lp_parent: The parent clock for lp
> > > > +  - clocks: Must contain an entry for each optional entry in clock=
-names.
> > > > +    See ../clocks/clock-bindings.txt for details.
> > >=20
> > > Did this driver previously acquire clocks?
> > >=20
> > > What order or names did it expect if so?
> >=20
> > This is badly placed. There are clocks and clock-names properties in a
> > "Required properties" section above this hunk which lists all the clocks
> > that this module uses. Presumably this was added to the optional section
> > because it isn't always needed.
> >=20
> > > >  - sor: serial output resource
> > > > =20
> > > > @@ -360,8 +364,10 @@ Example:
> > > >                     compatible =3D "nvidia,tegra20-dsi";
> > > >                     reg =3D <0x54300000 0x00040000>;
> > > >                     clocks =3D <&tegra_car TEGRA20_CLK_DSI>,
> > > > -                            <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
> > > > -                   clock-names =3D "dsi", "parent";
> > > > +                            <&tegra_car TEGRA124_CLK_DSIALP>,
> > > > +                            <&tegra_car TEGRA20_CLK_PLL_D_OUT0>,
> > > > +                            <&tegra_car TEGRA124_CLK_PLL_P>;
> > > > +                   clock-names =3D "dsi", "lp", "parent", "lp_pare=
nt";
> > >=20
> > > Please document _all_ the names you expect.
> > >=20
> > > What exactly are these two new clocks?
> >=20
> > "lp" isn't actually new, it's just missing from the example.
> >=20
> > > Is this all the clocks that feed into the DSI block? Are any of these
> > > not directly wired to the DSI block?
> > >=20
> > > Why exactly do you need to reparent it to this particular clock, and =
why
> > > do you need a reference here in order to do so, given it presumably
> > > doesn't feed directly into the DSI block?
> >=20
> > It seems like the hardware default is to use a parent clock unsuitable
> > for the DSI low-power mode, but as discussed elsewhere this should be
> > fixed in the clock driver where we already have a way to statically set
> > the parent clock at boot time.
>=20
> The driver fix is perfectly fine, but we also have the
> assigned-clock-parent stuff now if you prefer to manage it from DT.

I don't think this should be done in the driver. It should never have to
bother with what the parent of the LP clock is. The only reason why this
is necessary is because the hardware default isn't appropriate. For the
same reason I don't think it should be encoded in DT. It's an SoC-level
detail and likely will never need to change per board, so it'll just be
redundant information in DT.

We already have code in the Tegra clock driver to set up this parent and
rate properly, so I'm not even sure why this patch is necessary or where
the disconnect comes from. Perhaps this wasn't tested against the
upstream kernel?

Thierry

--ZRyEpB+iJ+qUx0kp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUKRWUAAoJEN0jrNd/PrOhfD0P/Av4dH/QhJwY/p0SAJZgkIEf
J5qBJi3tRbvs9sj6dv2e3suU9yYkrr0Nmud2pLTSU4+gQLw/N3BaGQVUTIwGOSQM
mJSVs+qu8AYtERHhkBCT69nOzkaKigdIFBaJC9H2HPCc9TqFmDDLD2PqWtBiNznI
YPsfc12CynNx5Xs0cRiMRIfr6ppQZUxzmHYC+mtpdtrY3L4kuzKfMgxI77xgMHYd
oSJ7/41Ozhz11FaMqh1kr2JHAWg4M0vDBP0JKKPkbXSoRIyhWsF9Nnryb4NMMcW1
iTvs6JQ+zOi0FV30nVGUuI0HG/Wxnay1aVHI6G2c6oRKTbQidysL3Ra8iKNym4hB
AUFK28aAc3yCgbI2J16eQ7DjRddftNqFGJgKbxO4VuFtjhbjl8w1Na1sTW4AmxzD
wo+vClDEn9Xg4tLC1QElEGhJZMkpccIFjmtzmcyGKsXRIHQnWkRMXPIL5kVkBru7
eNrhbYpJX6F0ZVBPXBitf90gIvbR5/IG/gTgGwqb08IM4BtYCd+Ls3bT86cJhmDG
e1Mjn4QLAYxTUKYo+ChhG/6nXdDAi/rlHQVR6RHCY23svv81A/V8zTb9f07pAUTb
djineihHRvKf1Cr+2SANCHe1fLuOpkLxON4SNKO3IbUv4yI7L4ADNSLUNYX0E0Sz
osCY9pXvmyU6OL6Zt5CG
=3Xsg
-----END PGP SIGNATURE-----

--ZRyEpB+iJ+qUx0kp--

--===============1848626136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1848626136==--
