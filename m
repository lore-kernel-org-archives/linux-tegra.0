From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: drm connectors, tegra,
 and the web they weave (was Re: [PATCH 58/59] drm/todo: Add new
 debugfs todo)
Date: Thu, 20 Jun 2019 17:16:24 +0200
Message-ID: <20190620151624.GE15501@ulmo>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
 <20190618151938.GA2567@kroah.com>
 <3271ab62-43dc-a845-45ff-c3dae62ad2d6@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0815146921=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <3271ab62-43dc-a845-45ff-c3dae62ad2d6@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>
List-Id: linux-tegra@vger.kernel.org


--===============0815146921==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9crTWz/Z+Zyzu20v"
Content-Disposition: inline


--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 04:37:16PM +0100, Jon Hunter wrote:
>=20
> On 18/06/2019 16:19, Greg Kroah-Hartman wrote:
> > On Fri, Jun 14, 2019 at 10:36:14PM +0200, Daniel Vetter wrote:
> >> Greg is busy already, but maybe he won't do everything ...
> >>
> >> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >> ---
> >>  Documentation/gpu/todo.rst | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> >> index 9717540ee28f..026e55c517e1 100644
> >> --- a/Documentation/gpu/todo.rst
> >> +++ b/Documentation/gpu/todo.rst
> >> @@ -375,6 +375,9 @@ There's a bunch of issues with it:
> >>    this (together with the drm_minor->drm_device move) would allow us =
to remove
> >>    debugfs_init.
> >> =20
> >> +- Drop the return code and error checking from all debugfs functions.=
 Greg KH is
> >> +  working on this already.
> >=20
> >=20
> > Part of this work was to try to delete drm_debugfs_remove_files().
> >=20
> > There are only 4 files that currently still call this function:
> > 	drivers/gpu/drm/tegra/dc.c
> > 	drivers/gpu/drm/tegra/dsi.c
> > 	drivers/gpu/drm/tegra/hdmi.c
> > 	drivers/gpu/drm/tegra/sor.c
> >=20
> > For dc.c, the driver wants to add debugfs files to the struct drm_crtc
> > debugfs directory.  Which is fine, but it has to do some special memory
> > allocation to get the debugfs callback to point not to the struct
> > drm_minor pointer, but rather the drm_crtc structure.
> >=20
> > So, to remove this call, I need to remove this special memory allocation
> > and to do that, I need to somehow be able to cast from drm_minor back to
> > the drm_crtc structure being used in this driver.  And I can't figure
> > how they are related at all.
> >=20
> > Any pointers here (pun intended) would be appreciated.
> >=20
> > For the other 3 files, the situation is much the same, but I need to get
> > from a 'struct drm_minor' pointer to a 'struct drm_connector' pointer.
> >=20
> > I could just "open code" a bunch of calls to debugfs_create_file() for
> > these drivers, which would solve this issue, but in a more "non-drm"
> > way.  Is it worth to just do that instead of overthinking the whole
> > thing and trying to squish it into the drm "model" of drm debugfs calls?
> >=20
> > Either way, who can test these changes?  I can't even build the tegra
> > driver without digging up an arm64 cross-compiler, and can't test it as
> > I have no hardware at all.
>=20
> We can definitely compile and boot test these no problem. In fact
> anything that lands in -next we will boot test. However, I can do some
> quick sanity if you have something to test.
>=20
> Thierry may have more specific Tegra DRM tests.

We don't have any automated tests for this yet, unfortunately. Let me
work on something. In the meantime I can manually test any of the
patches that Greg sends out. These should be fairly trivial to test.
It's difficult to check for success/failure on something like the
register dump or the CRC, but I think for now we don't really need much
more than just validating that things don't crash when we read one of
these debugfs files.

Thierry

--9crTWz/Z+Zyzu20v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Lo0gACgkQ3SOs138+
s6F7Xg//ecOqoBL8AssSxaDF3YMC4vMabwdQg+3VN31KOZsE1S7DRYjQ9HZT267N
SZ1DkL2IyXYzycZrTTkkeqiumcIAEe/0xiXyLlalJJOp4CR9Q6PE8skqB25J59xo
WGjt5AY7iDgNGNt0R5o3zVHWRkuLbUidpkdNMfHwSF1vg2tBwH8gKAeAJRPQJH0S
nuUWZGVIo8vB16fEO3RNwjTvh5LNS/uzC/3IqAQk3sdikU0ep+B0UzWYPZTIUXq0
S4JvvUey+MbyHK35bkKxyUImGsqIUiOtKNHjjReFeZgRJq4YParaHjNVh5JeF8ZI
yE6J7ToQnPtX8jyYgZ2D+ch75xAGlx3qmHBr7qBaGdOx/S9gWaZdqIA4PPJA/U+s
TsxUj2UOvRB9fpxjRTE4hSfOF+AONJXeVb9M0BiyMCikHV9I1QXgQ89ZmQJGgBFV
CrJjhPA/U5ToEk6k0fh7D8n74Jg9S2s38vNweVsknXK153QlOQoyrTf8QKDEYoVV
vgv89xL2GBy5al5oVnpdhrX45z6VEDX7NrTjl4D7OppChEhTjC1IDw+OVMTsJorN
7MLtkh/a5m1RT0BKGJK8BvgZ2cTy61zpmCaOgot9pmusaweFfVaGPn9GZutTFCgu
TIxUd3PEMK/rcGjhCbTvz22UTLMAxDm6uIfSF4tuRsOSrAaajMY=
=KWX0
-----END PGP SIGNATURE-----

--9crTWz/Z+Zyzu20v--

--===============0815146921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============0815146921==--
