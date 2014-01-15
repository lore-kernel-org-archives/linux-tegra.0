From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drm/tegra: Obtain head number from DT
Date: Wed, 15 Jan 2014 10:06:28 +0100
Message-ID: <20140115090627.GC27135@ulmo.nvidia.com>
References: <1389710758-29444-1-git-send-email-treding@nvidia.com>
 <1389710758-29444-3-git-send-email-treding@nvidia.com>
 <52D5798F.1020500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52D5798F.1020500-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2014 at 10:53:19AM -0700, Stephen Warren wrote:
> On 01/14/2014 07:45 AM, Thierry Reding wrote:
> > The head number of a given display controller is fixed in hardware and
> > required to program outputs appropriately. Relying on the driver probe
> > order to determine this number will not work, since that could yield a
> > situation where the second head was probed first and would be assigned
> > head number 0 instead of 1.
> >=20
> > By explicitly specifying the head number in the device tree, it is no
> > longer necessary to rely on these assumptions. As a fallback, if the
> > property isn't available, derive the head number from the display
> > controller node's position in the device tree. That's somewhat more
> > reliable than the previous default but not a proper solution.
>=20
> The series,
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This patch should really have been sent to the DT maintainers and list
> since it changes a DT binding...

Indeed. I'll resend this to the appropriate people and lists. Sorry
about that.

> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>=20
> > +static int tegra_dc_parse_dt(struct tegra_dc *dc)
> > +{
> > +	struct device_node *np;
> > +	u32 value =3D 0;
> > +	int err;
> > +
> > +	err =3D of_property_read_u32(dc->dev->of_node, "nvidia,head", &value);
>=20
> If of_property_read_u32() returns an error, does it guarantee that value
> is left unchanged? I suspect it'd be safer to add ...

That's the way it's always been at least. of_property_read_u32() ends up
calling of_property_read_u32_array(), which looking at the code only
modifies the out_values parameter when it knows that it will succeed.

Furthermore the function's kernel-doc explicitly says that "out_values
is modified only if a valid u32 value can be decoded" (i.e. on success).

Thierry

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS1k+TAAoJEN0jrNd/PrOha/kP/2HlNp0s9IBitUX3xuGBOSom
DlsZviFlRulXDsJi2crj9BgosYqsxuXjjoVDhud3F4UjA/yX/MfvO9OJb4kmMvxr
tb05PB5STsX1Uud8IeFrO7TDMsCnKzGaYRInuhpUsLWLEOqqk1FtmANrb7DarIJ8
jPglDBkss2Xh12prQUgYWMpHNzI6tkbJ0fEZlf7oyPEzHsHfftvtT1QLZosFIAyb
A0yCjmoHQzROfp/9wPLXflkS/6dy9gq4Vh9QMyQ+sz18Uph6LOj8pA2k8Il/ludE
wtsnZSkLqKnCxLscmj2wi3J+cRCebkWbbPADnI2f/5sgc7zaY+S9iusxDpA9Stgk
dFobv5YqlCrN4awKF4uccoXa0C4/4bkkeRwqJOSLGAedRi2+3DBElK2Z4csRwCSY
M2FQ+2nhorWbAdR+qnQ2aicf+ByGrkf2zsw56sFOrLMv2T/uBfSk/yP01FP3Hf8E
LvOnAoidwncU43jzOLhNuyPKF0GuRgouqoPjty0hecjAxtCn9lQb13A/Mbv/tg37
LGj+WrrRE/P6KtD7USyReenxU+xTZc5qj+mCnKV+s90XGmwQP50nNOsvyWwyjVnr
+QEUQABebXxmSS7+nV3Z8PTkDv4rwU0baWHQxKxH08TK9p/CZ+zwWBk9NrE53GEm
Iz3xdVBE9S1FAYcZx/rE
=pWcz
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--
