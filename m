From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] drm/tegra: Obtain head number from DT
Date: Tue, 14 Jan 2014 15:14:19 +0100
Message-ID: <20140114141416.GE10936@ulmo.nvidia.com>
References: <1389622894-9574-1-git-send-email-treding@nvidia.com>
	<1389622894-9574-3-git-send-email-treding@nvidia.com>
	<52D42685.1040603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0242007790=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <52D42685.1040603@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0242007790==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Content-Disposition: inline


--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2014 at 10:46:45AM -0700, Stephen Warren wrote:
> On 01/13/2014 07:21 AM, Thierry Reding wrote:
> > The head number of a given display controller is fixed in hardware and
> > required to program outputs appropriately. Relying on the driver probe
> > order to determine this number will not work, since that could yield a
> > situation where the second head was probed first and would be assigned
> > head number 0 instead of 1.
>=20
> This change makes the new properties mandatory, yet they aren't part of
> the DT files yet. So, won't this patch break all display on Tegra?

I don't think it'll make anything worse than it currently is, since both
display controllers can't run at the same time with the current code.

They can do so on Dalmore, so I guess that would be broken by the patch.

> To avoid having to modify the Tegra DTs in this patch, can't the code
> fall back to the existing broken algorithm if the property is missing, i.=
e.:
>=20
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>=20
> > -	dc->pipe =3D tegra->drm->mode_config.num_crtc;
>=20
> Instead,:
>=20
> 	if (dc->pipe =3D=3D -1)
> 		dc->pipe =3D tegra->drm->mode_config.num_crtc;
>=20
> > +static int tegra_dc_parse_dt(struct tegra_dc *dc)
> > +{
> > +	u32 value;
> > +	int err;
> > +
> > +	err =3D of_property_read_u32(dc->dev->of_node, "nvidia,head", &value);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	dc->pipe =3D value;
>=20
> Instead:
>=20
> 	err =3D ...
> 	if (!err)
> 		dc->pipe =3D value;
> 	else
> 		/* Perhaps also emit an error message here */
> 		dc->pipe =3D -1;

Yeah, that should work. It's still suboptimal because we fallback to
something that's broken and known not to work.

My original proposal was to make the dc->pipe assignment depend on the
physical address of the display controller's registers. That's ugly,
but all SoCs in existence do use the very same offset. So we could
reason that for anything that's still using the old DTB files we can
rely on the physical address of the registers, while any new DTBs
should include the new nvidia,head property.

I have a feeling that you won't like it, though.

One other method would be to iterate over all DT nodes that match the
display controller compatible and use the index for the pipe number.
That should fix the current issues, but is still a wee bit hackish
because it assumes that nodes in DTB will be in the same order as in
the DTS. That has been true since the beginning of DT on Linux AFAIK
and therefore should be reasonably safe.

Thierry

--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS1UY4AAoJEN0jrNd/PrOhpeUQALwDJrzoiJrQ3yjJ8XNRCQdl
bqgPzkbp7PpuBLs3rVNoFADX/ywbDV/V/QeU3361cKkCLh+P+zhTcyo3sDPxIEO/
+6ANKJei7oJ2u58A6NC0xR45DlGXGTsjlWkAxr60QJ1uSgYBnyaE6LnVmE23D6rD
CpqdpmfcrEUqCAFjJEHFJCtUk9irlvHSTrVgO9qhPdG4OCxpRBihNgc1IVFvInZS
3/hlVoQX2C5b3f9pA8Cl+SQ4BgfFSBxd8qunpHBI1XDJu8kQyFMsjOJB9+QgFbNe
mLTFClf0BBM2abez2H+5D5JmM8UvDkXRGCvL0AwDVx8GqnEqQEbE+qwLHKlUwBOA
SOaKE3yL3nCt9I3NJe9d4tyMrVm40GW4aTjhu2IpxqN10Kz6sBImS81dhTtvdY3j
ttQdlThRWE4psgLWpMZNLk5Qpa2nwjTql402Nnes6kDsOeqAq2o87AksYAH2DWv7
w1WUKyvzSDPqTtZNg4v+Nwrda3BmvNmZDHfSl3ihJcAf84Wdf1kQm7bjbfLtNtMm
bNNrrEKJZFKkPNjleBD0wmW6q+OXHVCWSJzBVtBvetRd7bXrP1i1YzOciS6k5ru2
69DvLg9MemZfBJOHaU29dWKcdkCHsL0AeVcLVirkxdjDdla8oJOqjkH0s+GjrXiG
aHgNURgt9EeAI4Fwkml3
=HE3o
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--

--===============0242007790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0242007790==--
