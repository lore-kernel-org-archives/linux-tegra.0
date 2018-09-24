From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] drm/tegra: dpaux: Fix always-failing probing of the
 driver
Date: Mon, 24 Sep 2018 15:36:29 +0200
Message-ID: <20180924133629.GD23547@ulmo>
References: <20180921114241.17002-1-digetx@gmail.com>
 <20180924115907.GW21032@ulmo>
 <3ccda930-8ec1-00b0-54e0-c689e7ee4b62@nvidia.com>
 <3148e42b-70cf-a7b4-a644-b969f61724d6@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0695242135=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <3148e42b-70cf-a7b4-a644-b969f61724d6@gmail.com>
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


--===============0695242135==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Content-Disposition: inline


--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2018 at 03:40:35PM +0300, Dmitry Osipenko wrote:
> On 9/24/18 3:32 PM, Jon Hunter wrote:
> >=20
> > On 24/09/18 12:59, Thierry Reding wrote:
> > > On Fri, Sep 21, 2018 at 02:42:41PM +0300, Dmitry Osipenko wrote:
> > > > Some of definitions in the code changed the meaning, unfortunately =
one
> > > > place missed the change.
> > > >=20
> > > > Fixes: 0751bb5c44fe ("drm/tegra: dpaux: Add pinctrl support")
> > > > Cc: <stable@vger.kernel.org> # v4.8+
> > > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > > ---
> > > >=20
> > > > I don't have HW to test DPAUX driver, apparently it has been broken=
 for
> > > > 2+ years now. There is also a known issue on with the DPAUX driver =
that
> > > > prevents it from probing, that was discussed on the #tegra IRC. Thi=
erry,
> > > > please take a closer look at this driver and test it thoroughly, it=
 has
> > > > some obvious problems.
> > > >=20
> > > >   drivers/gpu/drm/tegra/dpaux.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > It's odd that you claim that the driver is always failing probe and at
> > > the same time you say that you don't have hardware to test the driver.
> > > =3D)
> > >=20
> > > I know for a fact that this driver does not usually fail because it is
> > > required on all recent chips (Tegra210 and later) to drive HDMI, which
> > > we support on all boards, so it is indeed thoroughly tested.
> > >=20
> > > >=20
> > > > diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/=
dpaux.c
> > > > index d84e81ff36ad..ba5681fab73b 100644
> > > > --- a/drivers/gpu/drm/tegra/dpaux.c
> > > > +++ b/drivers/gpu/drm/tegra/dpaux.c
> > > > @@ -521,7 +521,7 @@ static int tegra_dpaux_probe(struct platform_de=
vice *pdev)
> > > >   	 * is no possibility to perform the I2C mode configuration in the
> > > >   	 * HDMI path.
> > > >   	 */
> > > > -	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_HYBRID_PADCTL_MODE_I2=
C);
> > > > +	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_I2C);
> > > >   	if (err < 0)
> > > >   		return err;
> > >=20
> > > If you look at the definitions of both DPAUX_HYBRID_PADCTL_MODE_I2C a=
nd
> > > DPAUX_PADCTL_FUNC_I2C, you'll see that both are actually the same, wh=
ich
> > > is a good explanation for why the driver performs flawlessly.
> > >=20
> > > That said, your change is obviously correct. I've applied it, but sin=
ce
> > > it doesn't actually fix anything, and doesn't change anything from a
> > > binary point of view, I've removed the Fixes: and Cc: stable tags.
> >=20
> > Did you change the subject for the patch because as you mentioned it
> > does not seem related to the change?
> >=20
> > Otherwise for the fix you can have my ...
> >=20
> > Acked-by: Jon Hunter <jonathanh@nvidia.com>
> >=20
> > The dpaux driver has been working fine for me on Tegra210 Smaug when
> > using the pins for I2C and I have not seen any probing problems.
>=20
> Guy with nickname "vlado" said on the IRC that the panel stopped to work =
on
> T124 chromebook since 4.16 kernel, reverting commit [0] helps.
>=20
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/drivers/gpu/drm/drm_dp_helper.c?id=3D17ab7806de0c10d27cdbda8ef57ca680=
bdd24315

I'm pretty sure that's something that we fixed, but I'll have to check.

Is this patch reported to help with that issue, or where's the
connection?

Thierry

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluo6F0ACgkQ3SOs138+
s6EYaBAAqBdHjOostOWb/vMVn9RvFaGZn5FCGmSN1LDWp+CwAGuObLAYKluYYimD
RK/7TH5b/8Wyd+KmDevGqeHFzF+AYVdd5Y17zKJlwV5ukkrhiK7N/bjlmlNvxa0f
RW8yhShFyW5+wkmkvBjEcuDjr2LO221BGpztSPVjnMxEWHkrLjAGiRv0f0yx1ctC
4SU8Awal6KGLTGFbb3CjeOztkt2kRMEGLbj7mcUB8iKXdzkZb9z6nQRe17P6dwkv
/q7vncFyq0CQo0AvfRUCjHGCaQ0+RgzfFqHMG8zI/wWeOXH81+XQi/mJD6Y5ZtWq
rrVTo/v6QrpfvjRDXehQWsixWLvURfEaFlvlgvJV0ld0YIL0oBDes56ZUO/KgGuJ
Jf0HfsLSNOUEjHxPPUfmKbTMKeCXovXNiNWrgRXydSaEzz80I9Ys8C7PoMj5VyFo
KsJWGZ6IMaKG2sCXPcMuUhCmNFeDYKDj4AB+Con79DChHmByPFf8I/zYJSXZvQ1b
AMywVT735iNk5WZg9aFf8DPEO0Z+suu958mE25T9nh6MyUQpkU1rAmTpEnbksh8X
DpX30J/EBK0h/EPeW9zcshmHX0Bd6wpqxm/xruq8x+uRRDvyJ1BvBDXgT8Q/hqMt
hOip0cZtDBOHBk3AHzVWu6eIoNXomSplO+qLoIUEqOEvu3xxgqI=
=/C4I
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--

--===============0695242135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0695242135==--
