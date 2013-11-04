From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 13/27] drm/tegra: Move subdevice infrastructure to
 host1x
Date: Mon, 4 Nov 2013 12:06:57 +0100
Message-ID: <20131104110655.GN27445@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-14-git-send-email-treding@nvidia.com>
 <20131104102054.GD4167@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Y142/9l9nQlBiaj"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131104102054.GD4167-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--4Y142/9l9nQlBiaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2013 at 11:20:55AM +0100, Daniel Vetter wrote:
> On Mon, Oct 07, 2013 at 10:34:30AM +0200, Thierry Reding wrote:
> > +static struct drm_bus drm_host1x_bus =3D {
> > +	.bus_type =3D DRIVER_BUS_HOST1X,
> > +	.set_busid =3D drm_host1x_set_busid,
> > +};
>=20
> Imo this needs to die asap, i.e. before it lands in drm-next. I've just
> spent a bit of time trying to rid ourselves of this midlayer
> brain-damange, and now new stuff crops up. See
>=20
> http://cgit.freedesktop.org/~danvet/drm/log/?h=3Ddrm-init-cleanup
>=20
> drm_bus is a terribly midlayer madness disaster and needs to just burn
> down. So what exactly is the reason here to not go with the drm_platform.c
> stuff until I've gotten around to completely rip it all out?

Dave asked me whether it was possible to move the Tegra DRM driver back
into drivers/gpu/drm (from drivers/gpu/host1x/drm) and introducing this
new bus was the only solution I saw (besides perhaps using cross-
subsystem global variables) to do that.

Now, I'm not a big fan at all of the whole drm_bus shebang myself, so
whatever help you need in getting rid of it, please let me know. The
drm_bus implementation that this adds is about 34 lines, so it shouldn't
be difficult to get rid of. If you throw out drm_driver.bus completely,
then it should be a matter of just deleting that code and the rest
should be able to continue working as is. The only reason I added it is
because the kernel crashes if its not there, depending on what userspace
is run.

So I find myself in the middle of controversy again... I seem to have a
knack for it.

Thierry

--4Y142/9l9nQlBiaj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSd3/PAAoJEN0jrNd/PrOhuj4P/3YOnReEIPVS33IO+H2k5MrS
XxL/FwV/XQH4r62WS+nLYVtthstNfKT2PnIhM3SXZYkTpgv05ReaC/2Um1T8Alp5
zt3kgDe5k/hYVauXjLhcm/Z55HgkmHA67fX9dHub3320y1K3j67PI0iV9iDMGVqt
HZ/N2diFeM7/XJMDAGI6bu1luKADzetHFcrmSCvFE/3m6ttJPrEvE7XGy2AdIVM0
MNys1x5/qpzVYnbGOfAbTtA74P4g+FTGajv35oGfwaqLyFvx1HduEItHi9hgUtv1
LKqy5ByjV3PcNjMI2JXSlFyBJDqil9czflT0T4e8lEPLtkmpyprjXCTTRze7ztEL
hoMug+VZ/9JZQS2FJUavgtIQ299UBO1iN6bm4uFbdmo+y2swyfjXXdpLTaaR7AaP
7i7xW+iXg6/Kt6j4tJUnsY+3CEGoiAz70OB7wAI7fzl1iZ7r5946Apw8iionNcEO
drhVvnZ+EPS2Nw1KLKKTSzu59IQDs4LgMAG8MF72ix/Uf4K5GVFoXOl7BP37DcE7
SKJcZrVtEBOsUB01P01GakT4CnOWskpwh2QVIu70A4aneRdr1/3JRhwPH7YCtrep
yxMbfFlFJZ9vu6i05OJ8aviNGROGLB1vbnQtGDYTaNxOLvg1F6Tw1PkRN6/z1Sql
OunDPCHkXd6wBxBO+M6M
=mc0c
-----END PGP SIGNATURE-----

--4Y142/9l9nQlBiaj--
