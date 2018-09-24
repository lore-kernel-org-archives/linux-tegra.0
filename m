From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] drm/tegra: dpaux: Fix always-failing probing of the
 driver
Date: Mon, 24 Sep 2018 15:30:00 +0200
Message-ID: <20180924133000.GC23547@ulmo>
References: <20180921114241.17002-1-digetx@gmail.com>
 <20180924115907.GW21032@ulmo>
 <3ccda930-8ec1-00b0-54e0-c689e7ee4b62@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0553194841=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <3ccda930-8ec1-00b0-54e0-c689e7ee4b62@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0553194841==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline


--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2018 at 01:32:41PM +0100, Jon Hunter wrote:
>=20
> On 24/09/18 12:59, Thierry Reding wrote:
> > On Fri, Sep 21, 2018 at 02:42:41PM +0300, Dmitry Osipenko wrote:
> >> Some of definitions in the code changed the meaning, unfortunately one
> >> place missed the change.
> >>
> >> Fixes: 0751bb5c44fe ("drm/tegra: dpaux: Add pinctrl support")
> >> Cc: <stable@vger.kernel.org> # v4.8+
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>
> >> I don't have HW to test DPAUX driver, apparently it has been broken for
> >> 2+ years now. There is also a known issue on with the DPAUX driver that
> >> prevents it from probing, that was discussed on the #tegra IRC. Thierr=
y,
> >> please take a closer look at this driver and test it thoroughly, it has
> >> some obvious problems.
> >>
> >>  drivers/gpu/drm/tegra/dpaux.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > It's odd that you claim that the driver is always failing probe and at
> > the same time you say that you don't have hardware to test the driver.
> > =3D)
> >=20
> > I know for a fact that this driver does not usually fail because it is
> > required on all recent chips (Tegra210 and later) to drive HDMI, which
> > we support on all boards, so it is indeed thoroughly tested.
> >=20
> >>
> >> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpa=
ux.c
> >> index d84e81ff36ad..ba5681fab73b 100644
> >> --- a/drivers/gpu/drm/tegra/dpaux.c
> >> +++ b/drivers/gpu/drm/tegra/dpaux.c
> >> @@ -521,7 +521,7 @@ static int tegra_dpaux_probe(struct platform_devic=
e *pdev)
> >>  	 * is no possibility to perform the I2C mode configuration in the
> >>  	 * HDMI path.
> >>  	 */
> >> -	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_HYBRID_PADCTL_MODE_I2C);
> >> +	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_I2C);
> >>  	if (err < 0)
> >>  		return err;
> >> =20
> >=20
> > If you look at the definitions of both DPAUX_HYBRID_PADCTL_MODE_I2C and
> > DPAUX_PADCTL_FUNC_I2C, you'll see that both are actually the same, which
> > is a good explanation for why the driver performs flawlessly.
> >=20
> > That said, your change is obviously correct. I've applied it, but since
> > it doesn't actually fix anything, and doesn't change anything from a
> > binary point of view, I've removed the Fixes: and Cc: stable tags.
>=20
> Did you change the subject for the patch because as you mentioned it
> does not seem related to the change?

Yes, I did.

> Otherwise for the fix you can have my ...
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

Added, thanks.

Thierry

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluo5tgACgkQ3SOs138+
s6EY6Q/8DsPgnGLHkucRwURMBGtOE5P+AktFqYt+rDpeof0FqehYIIJQN4AmDkv1
aH3zSIBNzmzpmbS9zVonGxJ0ip4Q7V19Rjf2VcCtNcTtMu54hMNQjV3iQYputPws
+GhbNltzBJMmw6RwuBbvDwlQMqarKZiZtL7SAPy8kguRYPcMiul8607uiRHrHAQp
rnlXRLwkdEIsqjP7UowyQ5ZBoOVztKimD9otwiY5R8uS0vZMorxk6ZNUm19dx/Bw
1hq/RGQpRbTeiw9+c0ldyL/Gz1UoIKWSsuS2HksZRFdEdnNeF52S2H0n3l9/jnKJ
ZpAVXOBzKYidV/kHcZ497QAISV1+Ge4NALnc2plwsrvbRvMH0zjwU/vI7TintQ4e
Tlxv5eAl2/djkzHmzzzmdLO3Uc+V9QQn7AGUVKVdKHIm7hGY8CHnAR+8Tae/7tzu
/r9EAql2ek/x1Zzf5ksNu6rfninkGQiSeFqpn4JMl1ww0QF4n5ifciuhSqNUxFv2
sIGXaJa0wRYgPjbn2iPs53wF4ZgmOqw+6gE58JALH8c5yNHRexxNr4Iy4kJVnfid
/H+7Eh8topMeB5yz4/ZL8199U0/2wB2/njhvCcpcIT3oNMlJ8G0JKLAy06+tw9Lp
PwN0gNxhQbLdCTpj5hFQVrWN+K/6QJbQhwDWtsTWVCwhjwborUI=
=/cnL
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--

--===============0553194841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0553194841==--
