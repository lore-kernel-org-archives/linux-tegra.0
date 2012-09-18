From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC v2 5/5] drm: Add NVIDIA Tegra support
Date: Tue, 18 Sep 2012 08:22:52 +0200
Message-ID: <20120918062252.GC1459@avionic-0098.mockup.avionic-design.de>
References: <1335347102-14905-1-git-send-email-thierry.reding@avionic-design.de>
 <1335347102-14905-6-git-send-email-thierry.reding@avionic-design.de>
 <5033D69B.8020104@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5033D69B.8020104-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 12:42:35PM -0600, Stephen Warren wrote:
> On 04/25/2012 03:45 AM, Thierry Reding wrote:
> > This commit adds a very basic DRM driver for NVIDIA Tegra SoCs. It
> > currently has rudimentary GEM support and can run a console on the
> > framebuffer as well as X using the xf86-video-modesetting driver. Only
> > the RGB output is supported.
> >=20
> > HDMI support was taken from NVIDIA's Linux kernel tree but it doesn't
> > quite work. EDID data can be retrieved but the output doesn't properly
> > activate the connected TV.
> >=20
> > The DSI and TVO outputs and the HOST1X driver are just stubs that setup
> > the corresponding resources but don't do anything useful yet.
>=20
> > diff --git a/drivers/gpu/drm/tegra/tegra-dc.c b/drivers/gpu/drm/tegra/t=
egra-dc.c
>=20
> > +	switch (crtc->fb->pixel_format) {
> > +	case DRM_FORMAT_XRGB8888:
> > +		win.fmt =3D WIN_COLOR_DEPTH_R8G8B8A8;
>=20
> I think that should be WIN_COLOR_DEPTH_B8G8R8A8 instead. At least,
> making that change solves the R/B color swap on my Springbank(Seaboard)
> board. The component ordering in the names matches better, so it seems
> likely this is generally applicable.
>=20
> The same comment applies in the default case below.

Yes, you're absolutely right. I ran some basic testing but it turned out
that all those were either black and white or something like glxgears
where the colors of the gears were just switched so I didn't notice. =3D)

> BTW, I added these patches to a kernel based on next-20120820, and will
> be using a netbook running with them to take notes at the conference
> next week. It's awesome to be running a Tegra system with graphics using
> 100% Open-Source and nearly 100% upstream SW (even all the
> BCT/bootloader/flashing tools too).

Yes, I'm really happy where things are going. We've come a long way.

I'm in the process of going through my patches and getting things sorted
out. My Tegra branch has grown unwieldy so I'm trying to get the easier
patches merged first so that for the more complex series (PCIe and DRM)
things will hopefully become easier to handle. So please bear with me.

Thierry

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQWBM8AAoJEN0jrNd/PrOhi6wP/RbjORLmXRN771Y2dofuscSj
c5bD2vAu0YoCDhdfd48M0OZpNfPFJegyHP/Gj7gbgBuPqnqApMLUzZp3Os4ykQWN
hwlOkMOMcjS7oS9EOqIpLOw7WprKne2FoRg4LCDYzzZJD+N9hDwhmP35s3I5Hyiw
HhjLffB0dzOLNWkhynuK1rMROVOq28C+3RGVyoCD5otBNvQi26JliZLuCldPU4Kj
Nr9dhugmTDtSjGNdpQXeyH3GhisQLLvOc2hST0R8bsSa2x28BhqqeJ0cuOg+5E/U
dJv+krTuPQXRYQ37AAb4JpMDfiBUJRfFdcdkanTJmrEmhEbYzSHoMsq0x5uHSOiJ
zF45Yrpc+datWjPbjRZ0iygLH5nV6Px/cFSoIjpiNbDFQONW2HdxNdRE1kgDVA1W
NweXTw+YiXQLpzmjWD55lnhDPOJknEd64xjHBO6S6K4u4YawN7Dj7qTxSqhHJ26a
ur0z+gu+Ic4Kh1ag2+TZM/qjTDFKA6kCDoLI7QGJLw1aKBpqVOYL9uaygczTaVB7
iE5LJsMtd3xZAMBzyK6XqjQyvrN6gPRc6DycwUENetqHg8hHdWEt3HnvMnotREEz
uWOQI/EIx5MLVTJBsQM1lIXtk9eDcHgrXK4KFl95byF+oeaB4ewWPc+VZ/rjNQtP
hk86AnJ+vyN46gtCg38G
=+MCq
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
