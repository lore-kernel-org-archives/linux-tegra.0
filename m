From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] drm/tegra: dpaux: Fix always-failing probing of the
 driver
Date: Mon, 24 Sep 2018 16:04:22 +0200
Message-ID: <20180924140422.GE23547@ulmo>
References: <20180921114241.17002-1-digetx@gmail.com>
 <20180924115907.GW21032@ulmo>
 <3ccda930-8ec1-00b0-54e0-c689e7ee4b62@nvidia.com>
 <3148e42b-70cf-a7b4-a644-b969f61724d6@gmail.com>
 <20180924133629.GD23547@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1481744221=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180924133629.GD23547@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1481744221==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9crTWz/Z+Zyzu20v"
Content-Disposition: inline


--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2018 at 03:36:29PM +0200, Thierry Reding wrote:
> On Mon, Sep 24, 2018 at 03:40:35PM +0300, Dmitry Osipenko wrote:
> > On 9/24/18 3:32 PM, Jon Hunter wrote:
> > >=20
> > > On 24/09/18 12:59, Thierry Reding wrote:
> > > > On Fri, Sep 21, 2018 at 02:42:41PM +0300, Dmitry Osipenko wrote:
> > > > > Some of definitions in the code changed the meaning, unfortunatel=
y one
> > > > > place missed the change.
> > > > >=20
> > > > > Fixes: 0751bb5c44fe ("drm/tegra: dpaux: Add pinctrl support")
> > > > > Cc: <stable@vger.kernel.org> # v4.8+
> > > > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > > > ---
> > > > >=20
> > > > > I don't have HW to test DPAUX driver, apparently it has been brok=
en for
> > > > > 2+ years now. There is also a known issue on with the DPAUX drive=
r that
> > > > > prevents it from probing, that was discussed on the #tegra IRC. T=
hierry,
> > > > > please take a closer look at this driver and test it thoroughly, =
it has
> > > > > some obvious problems.
> > > > >=20
> > > > >   drivers/gpu/drm/tegra/dpaux.c | 2 +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > It's odd that you claim that the driver is always failing probe and=
 at
> > > > the same time you say that you don't have hardware to test the driv=
er.
> > > > =3D)
> > > >=20
> > > > I know for a fact that this driver does not usually fail because it=
 is
> > > > required on all recent chips (Tegra210 and later) to drive HDMI, wh=
ich
> > > > we support on all boards, so it is indeed thoroughly tested.
> > > >=20
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegr=
a/dpaux.c
> > > > > index d84e81ff36ad..ba5681fab73b 100644
> > > > > --- a/drivers/gpu/drm/tegra/dpaux.c
> > > > > +++ b/drivers/gpu/drm/tegra/dpaux.c
> > > > > @@ -521,7 +521,7 @@ static int tegra_dpaux_probe(struct platform_=
device *pdev)
> > > > >   	 * is no possibility to perform the I2C mode configuration in =
the
> > > > >   	 * HDMI path.
> > > > >   	 */
> > > > > -	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_HYBRID_PADCTL_MODE_=
I2C);
> > > > > +	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_I2C);
> > > > >   	if (err < 0)
> > > > >   		return err;
> > > >=20
> > > > If you look at the definitions of both DPAUX_HYBRID_PADCTL_MODE_I2C=
 and
> > > > DPAUX_PADCTL_FUNC_I2C, you'll see that both are actually the same, =
which
> > > > is a good explanation for why the driver performs flawlessly.
> > > >=20
> > > > That said, your change is obviously correct. I've applied it, but s=
ince
> > > > it doesn't actually fix anything, and doesn't change anything from a
> > > > binary point of view, I've removed the Fixes: and Cc: stable tags.
> > >=20
> > > Did you change the subject for the patch because as you mentioned it
> > > does not seem related to the change?
> > >=20
> > > Otherwise for the fix you can have my ...
> > >=20
> > > Acked-by: Jon Hunter <jonathanh@nvidia.com>
> > >=20
> > > The dpaux driver has been working fine for me on Tegra210 Smaug when
> > > using the pins for I2C and I have not seen any probing problems.
> >=20
> > Guy with nickname "vlado" said on the IRC that the panel stopped to wor=
k on
> > T124 chromebook since 4.16 kernel, reverting commit [0] helps.
> >=20
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
/commit/drivers/gpu/drm/drm_dp_helper.c?id=3D17ab7806de0c10d27cdbda8ef57ca6=
80bdd24315
>=20
> I'm pretty sure that's something that we fixed, but I'll have to check.

Looks like we didn't fix that after all. Going through the patchwork log
linked to from that commit message I thought there wasn't actually an
issue with the code, but it turns out that I was wrong. The problem is
that for HDMI we don't use DPAUX in I2C mode, so we don't need to look
up the corresponding I2C controller and we just need the DPAUX driver to
program the pins into I2C mode, then use a real I2C controller for
communication.

What's special about Nyan is that it uses eDP and for eDP we use the
DPAUX for access to the DPCD *and* for DDC. eDP panels will look up the
phandle to the I2C controller used for EDID (DDC) via the ddc-i2c-bus
property. In order for that to work, we need to register the DPAUX I2C
controller with its OF node set to that of the DPAUX device.

Technically I don't think we need to query the EDID because we always
have at least one hard-coded mode in panel-simple. However, if the panel
has a slightly different mode from that, it'd still be good if the
driver used that instead of the built-in mode.

So I think we need to either bring back that patch or find some
alternative way to make the panel aware of the DDC bus that it needs to
talk to.

Thierry

--9crTWz/Z+Zyzu20v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluo7uMACgkQ3SOs138+
s6FGLBAAnTHLj+ftDQYzlgxFOXUcVrzTfPRrtESXoi3nJ1nXzO8dXgiUit/VnSnS
AVcm7BUaISSZZuz00XC7eGX8DjpL8YdUOUJEG8dxgPNFrpDXlcUB+itFPI4kOC9D
loWK4zPvdSZqw43Jdt7f/QV7MLAqkIqr0PRWhsuyP7DmPRf+1wV4UF4quGCtaEcW
/h3GRlg5HHTWnEEp14HaV94m8mM6um3PE/jpa0c5RGHta+KdMZLguVsWcke+zizy
aGgxB/dn0xaXR9NMRk1ynu0VAuV7ezD50qbEHJZjG/Cezh/vkS8gqcZZqHgi+CDg
Y2Q8/KIpzdM34peC4BGaVVK+hmHxvyvVGZlVbCnpm6yB7QH1VNb3Wo5N9ZwNXMZI
8/SobsUAvKlJ7Pj4MzyhCOA2fIllQtP/dt5rErFenBOGX9YStNYPeYwoBnBvSuiS
4QKZ/acp+OukcrQjW2YTUbMLHkbWCTdf9oZ6qnYQb9Y7azqK/dJj3d5WRD+/J007
XRJ9Y1JYLp96rQlo5w9En05lJBu5DNNT0T0LtntSSeur7gRScEJpLL5uYOr9eAjw
grK7707tkUw8MbtoGygZKlLikA1B9EW7QU5tYPNdYUEAX5MVt39/MQhyyy38QxJ8
j1YHHO6vG0TXJ/CGZb9F6gvDnwqL+UapTvDl78wZue7iNLKklio=
=4sCq
-----END PGP SIGNATURE-----

--9crTWz/Z+Zyzu20v--

--===============1481744221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1481744221==--
