From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] drm/tegra: dpaux: Fix always-failing probing of the
 driver
Date: Mon, 24 Sep 2018 16:15:30 +0200
Message-ID: <20180924141530.GF23547@ulmo>
References: <20180921114241.17002-1-digetx@gmail.com>
 <20180924115907.GW21032@ulmo>
 <3ccda930-8ec1-00b0-54e0-c689e7ee4b62@nvidia.com>
 <3148e42b-70cf-a7b4-a644-b969f61724d6@gmail.com>
 <20180924133629.GD23547@ulmo>
 <8d467b07-c5cb-061f-d893-2c2c813877d3@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1282400879=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <8d467b07-c5cb-061f-d893-2c2c813877d3@gmail.com>
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


--===============1282400879==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hUH5gZbnpyIv7Mn4"
Content-Disposition: inline


--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2018 at 04:56:28PM +0300, Dmitry Osipenko wrote:
> On 9/24/18 4:36 PM, Thierry Reding wrote:
> > On Mon, Sep 24, 2018 at 03:40:35PM +0300, Dmitry Osipenko wrote:
> > > On 9/24/18 3:32 PM, Jon Hunter wrote:
> > > >=20
> > > > On 24/09/18 12:59, Thierry Reding wrote:
> > > > > On Fri, Sep 21, 2018 at 02:42:41PM +0300, Dmitry Osipenko wrote:
> > > > > > Some of definitions in the code changed the meaning, unfortunat=
ely one
> > > > > > place missed the change.
> > > > > >=20
> > > > > > Fixes: 0751bb5c44fe ("drm/tegra: dpaux: Add pinctrl support")
> > > > > > Cc: <stable@vger.kernel.org> # v4.8+
> > > > > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > > > > ---
> > > > > >=20
> > > > > > I don't have HW to test DPAUX driver, apparently it has been br=
oken for
> > > > > > 2+ years now. There is also a known issue on with the DPAUX dri=
ver that
> > > > > > prevents it from probing, that was discussed on the #tegra IRC.=
 Thierry,
> > > > > > please take a closer look at this driver and test it thoroughly=
, it has
> > > > > > some obvious problems.
> > > > > >=20
> > > > > >    drivers/gpu/drm/tegra/dpaux.c | 2 +-
> > > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >=20
> > > > > It's odd that you claim that the driver is always failing probe a=
nd at
> > > > > the same time you say that you don't have hardware to test the dr=
iver.
> > > > > =3D)
> > > > >=20
> > > > > I know for a fact that this driver does not usually fail because =
it is
> > > > > required on all recent chips (Tegra210 and later) to drive HDMI, =
which
> > > > > we support on all boards, so it is indeed thoroughly tested.
> > > > >=20
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/te=
gra/dpaux.c
> > > > > > index d84e81ff36ad..ba5681fab73b 100644
> > > > > > --- a/drivers/gpu/drm/tegra/dpaux.c
> > > > > > +++ b/drivers/gpu/drm/tegra/dpaux.c
> > > > > > @@ -521,7 +521,7 @@ static int tegra_dpaux_probe(struct platfor=
m_device *pdev)
> > > > > >    	 * is no possibility to perform the I2C mode configuration =
in the
> > > > > >    	 * HDMI path.
> > > > > >    	 */
> > > > > > -	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_HYBRID_PADCTL_MOD=
E_I2C);
> > > > > > +	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_I2C);
> > > > > >    	if (err < 0)
> > > > > >    		return err;
> > > > >=20
> > > > > If you look at the definitions of both DPAUX_HYBRID_PADCTL_MODE_I=
2C and
> > > > > DPAUX_PADCTL_FUNC_I2C, you'll see that both are actually the same=
, which
> > > > > is a good explanation for why the driver performs flawlessly.
> > > > >=20
> > > > > That said, your change is obviously correct. I've applied it, but=
 since
> > > > > it doesn't actually fix anything, and doesn't change anything fro=
m a
> > > > > binary point of view, I've removed the Fixes: and Cc: stable tags.
> > > >=20
> > > > Did you change the subject for the patch because as you mentioned it
> > > > does not seem related to the change?
> > > >=20
> > > > Otherwise for the fix you can have my ...
> > > >=20
> > > > Acked-by: Jon Hunter <jonathanh@nvidia.com>
> > > >=20
> > > > The dpaux driver has been working fine for me on Tegra210 Smaug when
> > > > using the pins for I2C and I have not seen any probing problems.
> > >=20
> > > Guy with nickname "vlado" said on the IRC that the panel stopped to w=
ork on
> > > T124 chromebook since 4.16 kernel, reverting commit [0] helps.
> > >=20
> > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/drivers/gpu/drm/drm_dp_helper.c?id=3D17ab7806de0c10d27cdbda8ef57c=
a680bdd24315
> >=20
> > I'm pretty sure that's something that we fixed, but I'll have to check.
> >=20
> > Is this patch reported to help with that issue, or where's the
> > connection?
>=20
> Reverting of the patch was reported to help with the problem. Check the I=
RC
> history, you can also just ask the original reporter for more details on
> #tegra. IIUC, the DPAUX driver probing is getting deferred because regula=
tor
> isn't ready during of the first invocation and then for some reason driver
> is never getting re-probed.

My IRC logs are a bit spotty because I had some intermittent failure on
the server that my client was running on. But I think you're referring
to the drm_dp_helper.c patch. I was just getting confused because you
referred to it from this thread, and I don't see the connection between
the two.

Okay, so my other reply has all the background on why this is failing.
It would also explain why the driver "always" fails. panel-simple fails
to find the I2C adapter for the ddc-i2c-bus property, so it reports
-EPROBE_DEFER, which is then propagated to Tegra DRM.

So let me resume the discussion on the lists about the offending revert
and see if we can get that fixed.

Thierry

--hUH5gZbnpyIv7Mn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluo8YAACgkQ3SOs138+
s6G1Sg//QsTZfv0WipQsWPq3FqOdas8VSxl5Hj8dGiGXRauOgbQU0HsJeKhrBAw0
yWrDA1pmbCMTXxquAJEQ7aHg7d9Wu1U06oH5HWjRHSoSdTgmM0kWMzxQbxWWAKMZ
e89XE7313TsMQkNn/SL70HWffXU3S0t5sVs+esKWfm7Zs0KnSZBHi9CrpMi1JbPi
xJRJiNnomXpewvM4rX818uwMjz24wZKUBiKz3ghE+9ctjCHpm4h6s50xGk8tpQOw
8trJOT1vYtMHCMhQd7IVLNZ49PCrWKpKtXZ8snAzUEvHKGPT4y/MRSU2ElerPUlc
x1mrzaIADYtTU0fgbP1Ejga1ePoyJDBTNWW1qOggZDLROWw73UOyZdkAJ+xBwA34
xMhOJyZVVIZkbVGAqTuObZhx4kDHUgbwtUn/HJJ1dEmXou2MJXycYVWO5R5x1FCz
ykugh1nildfPxq+ZMfcbWlQnw5Qe1dEzfMhWQqSsSsUfBnsLUkpT53vA6hYfRbct
4zA2Y4o5FlQCrFo0zUJILp9fUcBEAhIC9Lu47GF7R1SSVM+xaxDKYn7L4r6/h+D6
Cm5VDT6vnt//Egls7U1gRr6NM3Cg9Xazyuns3KafoJ7RM8mIH4+gzu+DHz0wXXu0
X9jKzB/KpbhNYCLysTkOfvaOYNKDQdR2Ttrxz4aaZn//YyzboHw=
=P8ac
-----END PGP SIGNATURE-----

--hUH5gZbnpyIv7Mn4--

--===============1282400879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1282400879==--
