From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: drm connectors, tegra,  and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
Date: Thu, 20 Jun 2019 16:57:23 +0200
Message-ID: <20190620145723.GC15501@ulmo>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
 <20190618151938.GA2567@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1823801058=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190618151938.GA2567@kroah.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>
List-Id: linux-tegra@vger.kernel.org


--===============1823801058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline


--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:19:38PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jun 14, 2019 at 10:36:14PM +0200, Daniel Vetter wrote:
> > Greg is busy already, but maybe he won't do everything ...
> >=20
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  Documentation/gpu/todo.rst | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 9717540ee28f..026e55c517e1 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -375,6 +375,9 @@ There's a bunch of issues with it:
> >    this (together with the drm_minor->drm_device move) would allow us t=
o remove
> >    debugfs_init.
> > =20
> > +- Drop the return code and error checking from all debugfs functions. =
Greg KH is
> > +  working on this already.
>=20
>=20
> Part of this work was to try to delete drm_debugfs_remove_files().
>=20
> There are only 4 files that currently still call this function:
> 	drivers/gpu/drm/tegra/dc.c
> 	drivers/gpu/drm/tegra/dsi.c
> 	drivers/gpu/drm/tegra/hdmi.c
> 	drivers/gpu/drm/tegra/sor.c
>=20
> For dc.c, the driver wants to add debugfs files to the struct drm_crtc
> debugfs directory.  Which is fine, but it has to do some special memory
> allocation to get the debugfs callback to point not to the struct
> drm_minor pointer, but rather the drm_crtc structure.

Actually the reason why the memory allocation is done is because there
can be multiple instances of the display controller. In fact, there's
always at least two (and up to four in later Tegra generations). The DRM
debugfs infrastructure, however, doesn't automatically duplicate the
data for each drm_debugfs_create_files() call and at the same time it
does not allow you to specify driver-private data other than by
embedding it in the drm_info_list structure. So rather than manually
create the drm_info_list for each display controller instance, the code
creates a template that is then duplicated and for which the driver-
private is then set. That way multiple invocations end up with different
data.

This is because of the extra indirection that the DRM debugfs
infrastructure introduces. It's in fact much easier to do this with just
plain debugfs function calls. The only downside is the boilerplate
required to make that happen.

Thierry

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LntIACgkQ3SOs138+
s6Ec6g//cyahw97qX6MVrsqeWZdi0lCt9yzfOA36w8oeensdVxwAld5K7dDQOGy5
g9qbcdy+u5QWNnV9UWOl51RRJN34hiH01OV38QRq0T+cMzFZIvFcuU7RBCSWk/LN
edpFR83XlgnQ3NzNfXHPSNTSkHzUmuJ/9j129Vguawx4HBpfB9sJ4jObJGBS+HT9
+noFFGkqxyvjThPS/g7X3GuotSASX1I11fhK6ApqFS7yp5arzPAUw5yPMz/1Ti9a
DQg/VYuX52SOlTVY6JIo9ZCs6ifPQbUkQN1YMEmavePm36KBpBpQC8sb+vTBU+d1
xlOo1eTnL448MCtc6/TzBCYbYT+Bc/At1/stUdH5MFx+3GfqIPx/jBY7Qg1zCY6K
fmayiJZJukL0IDlA/kCJa8eWA+X0zYIyND9LI07yZoP/i6SiOvi92GraGv7aK4aN
1pba/s7nA3XlVzDWzM0Mmtqx/ziNTrKcWXdccS/V7RKd4KHS7JNR7bBNvzsK2BxJ
B+OXJ7GjVk5/4hX+JOn4hcOhkPmGt4ftWACPaaiVG0sFSt8gGKPVkiH7JKfWofkp
GVI/WGL8hzmpqA8Orfs8am5/x14K2Y1mUseW2XC5DS/T7PzeQMBDwyB1hmB8KYwq
CxRXBTsK+YlJxN3Z496TaPtCzEsu2XzmSzDYDkOC2cXrK0Dk5yU=
=KmPe
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--

--===============1823801058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1823801058==--
