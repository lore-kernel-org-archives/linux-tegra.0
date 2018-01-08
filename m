From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] drm/tegra: Changes for v4.16-rc1
Date: Mon, 8 Jan 2018 16:49:49 +0100
Message-ID: <20180108154949.GB3324@ulmo>
References: <20180105141726.29713-1-thierry.reding@gmail.com>
 <558f572b-8174-c8ee-3ff8-79e591c0648d@gmail.com>
 <20180108074250.GA10590@ulmo>
 <20180108123943.GA13522@ulmo>
 <58e08004-cd76-997d-8d80-e102e31c8cda@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <58e08004-cd76-997d-8d80-e102e31c8cda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2018 at 04:47:42PM +0300, Dmitry Osipenko wrote:
> On 08.01.2018 15:39, Thierry Reding wrote:
> > On Mon, Jan 08, 2018 at 08:42:50AM +0100, Thierry Reding wrote:
> >> On Fri, Jan 05, 2018 at 05:58:17PM +0300, Dmitry Osipenko wrote:
> >>> On 05.01.2018 17:17, Thierry Reding wrote:
> >>>> Hi Dave,
> >>>>
> >>>> The following changes since commit 9428088c90b6f7d5edd2a1b0d742c7533=
9b36f6e:
> >>>>
> >>>>   drm/qxl: reapply cursor after resetting primary (2017-12-08 13:37:=
02 +1000)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>   git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.16-=
rc1
> >>>>
> >>>> for you to fetch changes up to ebae8d07435ae91314f4a28d69b530d09c625=
815:
> >>>>
> >>>>   drm/tegra: dc: Implement legacy blending (2017-12-21 14:55:55 +010=
0)
> >>>>
> >>>> Thanks,
> >>>> Thierry
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> drm/tegra: Changes for v4.16-rc1
> >>>>
> >>>> The bulk of these changes are preparation work and addition of suppo=
rt
> >>>> for Tegra186. Currently only HDMI output (the primary output on Jets=
on
> >>>> TX2) is supported, but the hardware is also capable of doing DSI and
> >>>> DisplayPort.
> >>>>
> >>>> Tegra DRM now also uses the atomic commit helpers instead of the ope=
n-
> >>>> coded variant that was only doing half its job. As a bit of a byprod=
uct
> >>>> of the Tegra186 support the driver also gained HDMI 2.0 as well as z=
pos
> >>>> property support.
> >>>>
> >>>> Along the way there are also a few patches to clean up a few things =
and
> >>>> fix minor issues.
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> Arnd Bergmann (2):
> >>>>       drm/tegra: Mark Tegra186 display hub PM functions __maybe_unus=
ed
> >>>>       drm/tegra: Fix non-debugfs builds
> >>>>
> >>>> Dmitry Osipenko (3):
> >>>>       drm/tegra: dc: Link DC1 to DC0 on Tegra20
> >>>>       drm/tegra: gem: Correct iommu_map_sg() error checking
> >>>>       drm/tegra: Correct timeout in tegra_syncpt_wait
> >>>>
> >>>> Thierry Reding (43):
> >>>>       drm/fourcc: Fix fourcc_mod_code() definition
> >>>>       drm/tegra: Sanitize format modifiers
> >>>>       gpu: host1x: Rewrite conditional for better readability
> >>>>       gpu: host1x: Cleanup on initialization failure
> >>>>       dt-bindings: display: tegra: Update SOR for Tegra186
> >>>>       drm/tegra: dc: Move register definitions into a table
> >>>>       drm/tegra: dsi: Move register definitions into a table
> >>>>       drm/tegra: hdmi: Move register definitions into a table
> >>>>       drm/tegra: sor: Move register definitions into a table
> >>>>       drm/tegra: dc: Reshuffle some code
> >>>>       drm/tegra: dc: Register debugfs in ->late_register()
> >>>>       drm/tegra: dsi: Register debugfs in ->late_register()
> >>>>       drm/tegra: hdmi: Register debugfs in ->late_register()
> >>>>       drm/tegra: sor: Root debugfs files at the connector
> >>>>       drm/tegra: sor: Register debugfs in ->late_register()
> >>>>       drm/tegra: Do not wrap lines unnecessarily
> >>>>       drm/tegra: vic: Properly align arguments
> >>>>       drm/tegra: dc: Support background color
> >>>>       drm/tegra: Use atomic commit helpers
> >>>>       drm/tegra: Remove custom page-flip handler
> >>>>       drm/tegra: dc: Remove tegra_primary_plane_destroy()
> >>>>       drm/tegra: dc: Remove duplicate plane funcs
> >>>>       drm/tegra: dc: Remove tegra_overlay_plane_destroy()
> >>>>       drm/tegra: dc: Remove duplicate plane funcs
> >>>>       drm/tegra: dc: Move state definition to header
> >>>>       drm/tegra: Move common plane code to separate file
> >>>>       drm/tegra: Add Tegra186 display hub support
> >>>>       drm/tegra: dc: Add Tegra186 support
> >>>>       drm/tegra: Support ARGB and ABGR formats
> >>>>       drm/tegra: sor: Parameterize register offsets
> >>>>       drm/tegra: sor: Add Tegra186 support
> >>>>       drm/tegra: sor: Support HDMI 2.0 modes
> >>>>       drm/tegra: dpaux: Implement runtime PM
> >>>>       drm/tegra: dpaux: Add Tegra186 support
> >>>>       drm/tegra: fb: Force alpha formats
> >>>>       drm/tegra: dc: Support more formats
> >>>>       drm/tegra: dc: Use direct offset to plane registers
> >>>>       drm/tegra: dc: Remove redundant spinlock
> >>>>       drm/tegra: Implement zpos property
> >>>>       gpu: host1x: Use IOMMU groups
> >>>>       drm/tegra: Use IOMMU groups
> >>>>       drm/tegra: dpaux: Keep reset defaults for hybrid pad parameters
> >>>
> >>>
> >>>>       drm/tegra: dc: Implement legacy blending
> >>>
> >>> Please hold on this patch. First of all it doesn't work correctly, se=
e my last
> >>> reply to the patch. Secondly, it introduces bug that breaks YUV plane.
> >>
> >> I thought we had already concluded that this version doesn't cause any
> >> regressions. And since this is new functionality I'm not too worried if
> >> it doesn't work in all cases, we've got plenty of time to fix those up.
> >>
> >> As for the YUV plane bug, can you point me at a test case, or describe
> >> what exactly you're trying to do so that I can reproduce and fix it?
> >>
> >> I'd like to make forward progress on this rather than hold back on
> >> patches out of fear that they may break existing functionality. In ord=
er
> >> to do that we need tests that can be run to validate existing
> >> functionality.
> >=20
> > I think I was able to reproduce the bug you mentioned by running this on
> > a TrimSlice:
> >=20
> > 	$ modetest -M tegra -s HDMI-A-1@34:1920x1080 -P 28@34:256x256+64+64@XR=
24 -P 30@34:256x256+384+64@UYVY
> >=20
> > This currently fails with the above patch, but I can fix it using the
> > below diff. Essentially we treat YUV planes as opaque, but currently
> > error out on YUV formats because they have no "alpha" equivalent. The
> > fix is to simply return the same format.
> >=20
> > Can you see any more issues after applying this fix? I wasn't able to
> > find a situation where it doesn't work.
>=20
> This is the only issue with YUV that I experienced.
>=20
> >=20
> > --- >8 ---
> > diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plan=
e.c
> > index 154b4d337d0a..36a06a993698 100644
> > --- a/drivers/gpu/drm/tegra/plane.c
> > +++ b/drivers/gpu/drm/tegra/plane.c
> > @@ -276,6 +276,11 @@ bool tegra_plane_format_has_alpha(unsigned int for=
mat)
> >=20
> >  int tegra_plane_format_get_alpha(unsigned int opaque, unsigned int *al=
pha)
> >  {
> > +	if (tegra_plane_format_is_yuv(opaque, NULL)) {
> > +		*alpha =3D opaque;
> > +		return 0;
> > +	}
> > +
> >  	switch (opaque) {
> >  	case WIN_COLOR_DEPTH_B5G5R5X1:
> >  		*alpha =3D WIN_COLOR_DEPTH_B5G5R5A1;
> >=20
>=20
> Alternatively we can make tegra_plane_format_get_alpha() to return modifi=
ed
> format like I did here [0], which I think makes code a bit cleaner.

I'd like to keep the possibility to return an error. We've already seen
how this caught an issue (return -EINVAL for YUV formats). Returning the
format would silently return the opaque format, which may not be the
right thing to do in all cases. Again, I'd like this to remain as
explicit as possible so we don't start to rely on implicit behaviour and
have hard to find errors creep in that way.

Thierry

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlpTkx0ACgkQ3SOs138+
s6HUFhAAt2vHSRd12PzK58E89XW7faN0+TzIVWUTpMyLufeTREWlOo2O9YXPdSEs
P0VICnK10enTYPvdegmLf96Y97RcTfldFvzpg9WzejpsQPxBBurmVVCFRzy0Xup4
8J84KX+mvHb1Pu9RwaFMyACXHEc4bzFrvHz2Itb1Hhicsy5u5LExbFibfCHDgvV5
5B/XVbgvvyVwkjZ+kNwO/TbTQS/iBf/cdZIkLSNF0aF4Pf0cKR5Jmlg9YXnai8vi
XBBjoNsTZ0oDttSfU2rD9ZfabZG4lgNnILpdv0zEjypYqManH5+BLUWBOd9SOpV+
CLUYkD3Pitj2feJ3565DAEMPt27jzFz5gYrlJogeel59t5btOFIyBv2WLXQdoZL2
1XjTn10Zm98/5MTVDtm8ucwE4yg7GBkdXnnHAQW5HA23M7bXta+9XublcYe+xbXm
H7NDpI+BdKj0opZWp516bU/+eOXNpQ7on6xAmQ92sZn8rR6aBMAXsMBh/6gTkWwf
A2DjgucJIyVhUOeNqH44gUSCMtC+Y4ANfhg0c3lTk62NiihcPX8XfwnHL1pKieY1
wa3FF9hGzDl5IrUN1lRTtE2nM+gjqc6ZUBtZKkrmTbxC3kAVVL6k3Rt/T+i4Zjxj
5lmsXH1LdUCZ3pEKWI7qYly6vSBCj5LSJwr8ZOi49cTfTXjwBws=
=v0Eh
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
