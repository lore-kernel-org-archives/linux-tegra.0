From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: vic: Export module device table
Date: Mon, 25 Nov 2019 11:45:33 +0100
Message-ID: <20191125104533.GF1409040@ulmo>
References: <20191122133215.1317039-1-thierry.reding@gmail.com>
 <20191125095629.GK29965@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1826229041=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191125095629.GK29965@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1826229041==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FeAIMMcddNRN4P4/"
Content-Disposition: inline


--FeAIMMcddNRN4P4/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 10:56:29AM +0100, Daniel Vetter wrote:
> On Fri, Nov 22, 2019 at 02:32:15PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Export the module device table to ensure the VIC compatible strings are
> > listed in the module's aliases table. This in turn causes the driver to
> > be automatically loaded on boot if VIC is the only enabled subdevice of
> > the logical host1x DRM device.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> I noticed that the drm subdev driver also lacks the matches. How does that
> work? Just by getting loaded when any of the subdev drivers match?

Yeah, basically the host1x DRM driver registration causes a logical
device to be created. The driver will then finally bind to the device
after all the subdevices have been registered. Since all the subdevice
drivers are linked into a single module, all the module device tables
end up in that kernel module and that's enough to trigger the whole
process.

I ran into this issue when I was trying to run the Tegra DRM driver in
a "headless" configuration where all the display-related devices were
disabled via DT. Without exporting the VIC module device table, there
were no entries in the module's aliases list that would match the set
of devices registered to the system and the driver wouldn't load.

Thierry

> -Daniel
>=20
> > ---
> >  drivers/gpu/drm/tegra/vic.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> > index 9444ba183990..c4d82b8b3065 100644
> > --- a/drivers/gpu/drm/tegra/vic.c
> > +++ b/drivers/gpu/drm/tegra/vic.c
> > @@ -386,13 +386,14 @@ static const struct vic_config vic_t194_config =
=3D {
> >  	.supports_sid =3D true,
> >  };
> > =20
> > -static const struct of_device_id vic_match[] =3D {
> > +static const struct of_device_id tegra_vic_of_match[] =3D {
> >  	{ .compatible =3D "nvidia,tegra124-vic", .data =3D &vic_t124_config },
> >  	{ .compatible =3D "nvidia,tegra210-vic", .data =3D &vic_t210_config },
> >  	{ .compatible =3D "nvidia,tegra186-vic", .data =3D &vic_t186_config },
> >  	{ .compatible =3D "nvidia,tegra194-vic", .data =3D &vic_t194_config },
> >  	{ },
> >  };
> > +MODULE_DEVICE_TABLE(of, tegra_vic_of_match);
> > =20
> >  static int vic_probe(struct platform_device *pdev)
> >  {
> > @@ -516,7 +517,7 @@ static const struct dev_pm_ops vic_pm_ops =3D {
> >  struct platform_driver tegra_vic_driver =3D {
> >  	.driver =3D {
> >  		.name =3D "tegra-vic",
> > -		.of_match_table =3D vic_match,
> > +		.of_match_table =3D tegra_vic_of_match,
> >  		.pm =3D &vic_pm_ops
> >  	},
> >  	.probe =3D vic_probe,
> > --=20
> > 2.23.0
> >=20
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--FeAIMMcddNRN4P4/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3bsMoACgkQ3SOs138+
s6FoThAAhUfcvm5SqZ+TIOqRgajhQnfgkHhwZDhfHicescpanDkDVBEOAdBTa73I
ptkelRjZe2JADaQoOULcHA5Gy8e2cPXIXNMfmtvM3qvevYwnJu4Ts10fIWhUDgSq
UFjD7Ki8qDF+aFxTpXwSdV2Igt7jVsG/6rjEvVRVnHQKwcPFfP9ubWGkwiVfUce9
Y5N2vNI0neyeStrdkvpCOTowjTx4HxK8n3RS4IFpsoj0IEoAu6GgJoBMfzzEsf4+
aenWXcczAVjXxbkdLFNJA5aqyL1fcG7YJF9+bEf9+sU6kSPQfaQYyymFPBCZe4mz
gK/U9HX78ucvjtbzyfXKErzXIwCBUICdWQEi+K8uaqiNh3xrdaDbHZsRdvsyYcMw
fNmIjGiXkU7FgpxZVYnSygLfW5I0jQwIJg1tIjb50AfUx6+AwLXQZlN13XaUoMOf
yfXbdCYudBRB/9CcwYoUnmRUD0QNSaEOfdWs4yB1k9fitc4Dng+qQQc0N/HVRZ/o
ZamHoPqHzRJurHlYQBFOXldBHuQOVqpMGqgmWPRUVq7D62Pp71Owbz1cKJyg68ri
EEnRyQgf6AkIwh0hFvghJ0T02NE0uUl0xzMvDrbiv/F7hW4GWSLNii+q2LotEnKO
25dPSMDIoZ8MtB8W7u16kx5KZtNDtcglNeMj60Vqeg4RaTmKkC4=
=79xx
-----END PGP SIGNATURE-----

--FeAIMMcddNRN4P4/--

--===============1826229041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1826229041==--
