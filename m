From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] drm/tegra: Changes for v4.16-rc1
Date: Mon, 8 Jan 2018 08:42:50 +0100
Message-ID: <20180108074250.GA10590@ulmo>
References: <20180105141726.29713-1-thierry.reding@gmail.com>
 <558f572b-8174-c8ee-3ff8-79e591c0648d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <558f572b-8174-c8ee-3ff8-79e591c0648d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2018 at 05:58:17PM +0300, Dmitry Osipenko wrote:
> On 05.01.2018 17:17, Thierry Reding wrote:
> > Hi Dave,
> >=20
> > The following changes since commit 9428088c90b6f7d5edd2a1b0d742c75339b3=
6f6e:
> >=20
> >   drm/qxl: reapply cursor after resetting primary (2017-12-08 13:37:02 =
+1000)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.16-rc1
> >=20
> > for you to fetch changes up to ebae8d07435ae91314f4a28d69b530d09c625815:
> >=20
> >   drm/tegra: dc: Implement legacy blending (2017-12-21 14:55:55 +0100)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > drm/tegra: Changes for v4.16-rc1
> >=20
> > The bulk of these changes are preparation work and addition of support
> > for Tegra186. Currently only HDMI output (the primary output on Jetson
> > TX2) is supported, but the hardware is also capable of doing DSI and
> > DisplayPort.
> >=20
> > Tegra DRM now also uses the atomic commit helpers instead of the open-
> > coded variant that was only doing half its job. As a bit of a byproduct
> > of the Tegra186 support the driver also gained HDMI 2.0 as well as zpos
> > property support.
> >=20
> > Along the way there are also a few patches to clean up a few things and
> > fix minor issues.
> >=20
> > ----------------------------------------------------------------
> > Arnd Bergmann (2):
> >       drm/tegra: Mark Tegra186 display hub PM functions __maybe_unused
> >       drm/tegra: Fix non-debugfs builds
> >=20
> > Dmitry Osipenko (3):
> >       drm/tegra: dc: Link DC1 to DC0 on Tegra20
> >       drm/tegra: gem: Correct iommu_map_sg() error checking
> >       drm/tegra: Correct timeout in tegra_syncpt_wait
> >=20
> > Thierry Reding (43):
> >       drm/fourcc: Fix fourcc_mod_code() definition
> >       drm/tegra: Sanitize format modifiers
> >       gpu: host1x: Rewrite conditional for better readability
> >       gpu: host1x: Cleanup on initialization failure
> >       dt-bindings: display: tegra: Update SOR for Tegra186
> >       drm/tegra: dc: Move register definitions into a table
> >       drm/tegra: dsi: Move register definitions into a table
> >       drm/tegra: hdmi: Move register definitions into a table
> >       drm/tegra: sor: Move register definitions into a table
> >       drm/tegra: dc: Reshuffle some code
> >       drm/tegra: dc: Register debugfs in ->late_register()
> >       drm/tegra: dsi: Register debugfs in ->late_register()
> >       drm/tegra: hdmi: Register debugfs in ->late_register()
> >       drm/tegra: sor: Root debugfs files at the connector
> >       drm/tegra: sor: Register debugfs in ->late_register()
> >       drm/tegra: Do not wrap lines unnecessarily
> >       drm/tegra: vic: Properly align arguments
> >       drm/tegra: dc: Support background color
> >       drm/tegra: Use atomic commit helpers
> >       drm/tegra: Remove custom page-flip handler
> >       drm/tegra: dc: Remove tegra_primary_plane_destroy()
> >       drm/tegra: dc: Remove duplicate plane funcs
> >       drm/tegra: dc: Remove tegra_overlay_plane_destroy()
> >       drm/tegra: dc: Remove duplicate plane funcs
> >       drm/tegra: dc: Move state definition to header
> >       drm/tegra: Move common plane code to separate file
> >       drm/tegra: Add Tegra186 display hub support
> >       drm/tegra: dc: Add Tegra186 support
> >       drm/tegra: Support ARGB and ABGR formats
> >       drm/tegra: sor: Parameterize register offsets
> >       drm/tegra: sor: Add Tegra186 support
> >       drm/tegra: sor: Support HDMI 2.0 modes
> >       drm/tegra: dpaux: Implement runtime PM
> >       drm/tegra: dpaux: Add Tegra186 support
> >       drm/tegra: fb: Force alpha formats
> >       drm/tegra: dc: Support more formats
> >       drm/tegra: dc: Use direct offset to plane registers
> >       drm/tegra: dc: Remove redundant spinlock
> >       drm/tegra: Implement zpos property
> >       gpu: host1x: Use IOMMU groups
> >       drm/tegra: Use IOMMU groups
> >       drm/tegra: dpaux: Keep reset defaults for hybrid pad parameters
>=20
>=20
> >       drm/tegra: dc: Implement legacy blending
>=20
> Please hold on this patch. First of all it doesn't work correctly, see my=
 last
> reply to the patch. Secondly, it introduces bug that breaks YUV plane.

I thought we had already concluded that this version doesn't cause any
regressions. And since this is new functionality I'm not too worried if
it doesn't work in all cases, we've got plenty of time to fix those up.

As for the YUV plane bug, can you point me at a test case, or describe
what exactly you're trying to do so that I can reproduce and fix it?

I'd like to make forward progress on this rather than hold back on
patches out of fear that they may break existing functionality. In order
to do that we need tests that can be run to validate existing
functionality.

Thierry

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlpTIPYACgkQ3SOs138+
s6Ertw/9EIDJvNBP4cXNha6azHEdfVEAp3Bc11VeyBF/PbOQkh50bRm2OwuQLU+c
g+rz+hSnSoavy4bQ2Zfko1G4bPjmV7Uhb0w+sjrVq7x3J9kg8Xv/35e6pdtz8owt
Laf4yvs1FN9VsUtZAqPrNrvBH+x0yEMLl7nEGBToynUMlrhgNBjLiUhMqC6myCMT
2f+AnrXZAhCBhInGcNARWRBxiEPQB83lz7SiFnEPxkjOd/2SDgxCu05Q/94BFGtG
Vtnr4foWHGzlpnq8AkNhhZKPQwtCaDgnGq1/kYBE1hJnarrNR/03676y8KAPL60/
RJrZD4dRapoiBecvmV19C9dy1Mcw68wsQFay8Aflz6BiZLzAvtrU8+GSDNUVqYAU
mrdqawtsx2go/c18Gf1kvZ/GtcuQvdsQghEBc8XXjVMB7Tcnysp0g+OV32W8+HUN
A0wg1hBsYLYNBTygzJR8tR0dd94cgDVK4gPvRocRrRzYlRtcDsTHnnXEbGIoHnwU
p252y7d0ELegYqiTOeJi8NbmjDuy/WdhjPQRcfpJxHyjNwqgHGbbfDvYZpveOnfU
STuLbqQE1z9BRG3bKB0l65iFdL8yMIyz98jvZf6eP0Fjhsn97qAWEHr+lqrSi6WV
CKcTrwGY3BCiDY7STI/43bhFNaquv3T02CJV7lwvmOwahJrPBAE=
=zEb1
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
