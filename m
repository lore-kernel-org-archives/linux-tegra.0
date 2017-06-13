From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/22] drm/tegra: Remove module ownership from the
 tegra_fb_ops
Date: Tue, 13 Jun 2017 17:07:20 +0200
Message-ID: <20170613150720.GD20577@ulmo.fritz.box>
References: <cover.1495498184.git.digetx@gmail.com>
 <b90497ec1e9ee182cdd4a19466c516e3b0553939.1495498184.git.digetx@gmail.com>
 <20170613134340.GG16758@ulmo.fritz.box>
 <827dcffe-b25c-75b1-d988-5977de1dd83f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RhUH2Ysw6aD5utA4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <827dcffe-b25c-75b1-d988-5977de1dd83f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--RhUH2Ysw6aD5utA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2017 at 05:00:28PM +0300, Dmitry Osipenko wrote:
> On 13.06.2017 16:43, Thierry Reding wrote:
> > On Tue, May 23, 2017 at 03:14:22AM +0300, Dmitry Osipenko wrote:
> >> The framebuffers console fbcon_startup() increments the tegra_drm modu=
le
> >> 'use' refcount via try_module_get(), causing an interlock of the DRM s=
ubsys
> >> and the tegra_drm modules. In result, the tegra_drm module can't be un=
loaded
> >> using rmmod.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  drivers/gpu/drm/tegra/fb.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >=20
> > That's done on purpose because otherwise you could just rip out the
> > driver from under the framebuffer emulation and things would crash.
> >=20
> > My understanding is that the right way to unload a module is to unbind
> > the driver first (which will cause the framebuffer to be removed and
> > hence the reference to be dropped) before the rmmod.
> >=20
> > Thierry
> >=20
>=20
> Aha, interesting. I'll try the unbinding and will drop this patch from the
> series, thank you for the clarification. I haven't observed any crashes o=
n a
> module reloading (framebuffer detached/attached just fine), maybe I was l=
ucky then.

It's possible that it works by accident. The driver removes the
framebuffer as part of the driver removal process, so technically
nothing should crash. However, if, for any reason, anyone was holding
on to a reference to the framebuffer (not sure if that is even possible)
the module needs to stay around long enough as well, otherwise the
function pointers would become dangling. The module reference makes sure
that this doesn't happen (as long as a framebuffer exists, the ops will
stick around).

So even if there isn't a way to make it crash today, the code is still
correct in taking the reference.

Thierry

--RhUH2Ysw6aD5utA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk//6UACgkQ3SOs138+
s6GWshAAiQFOq5xnJ3z8KXewm4SzeY+gpGsMgyNVLWpWN7iq6YzNGoxyT0NB3lnj
XytEmSVGKR7G0LLyvMtGCwC4rPtsUYi6QGe7k6QFAGdXmeGbzpdVOUptkpjB033k
ftBoDWEiZXaETDLi4xMsBOTKwf+7snnCSjjVrUzDooAQinjSlSy0jfWuSq4EUR0c
qLm+l0BY5wSmb5USH3REY+BOvFYBCiMw8QXVn80Dw1dyVYt2pmr5vq5pVEZVlGc5
pwtjj+r8uumXO8c5tQa3hO3OG4LURuqan3uG8FsURBKGSmdYF/JP48E5GKtheRhs
Px5mDnsSkyu+A2F3GUbr188RIAXJpUsqUM0wai9dNnXXOvXoLdJUA7zQmM8HkOU4
vNOVba8IN0kqFB+V0jtWu/2N7DbyYbxDTFtOnEdmaMXy80vLyGV1dedqAe4pqNdg
G+nHZmDNaT0wFIYHleeUNHp0no2zaMUzFGGXcRdz/dJbmZzxYbQtiT3Crg49/xkE
s4pKAkKN5Payc29ylXBElzXrWdZwwQeCZF1Z1ayZkKsb+9a23twaNqqNAyAcJGn7
6TwiFJjSVy5To1S2LAgnK8q6mTrFIIjja6ruG1rOm4CH1V1LMnDHjlEKXd6nzt7U
NVDpdtd55/GdUZgTC5427lV63gzF7/ZQZdJXLyZ4rKRGZx9g0tE=
=/WLi
-----END PGP SIGNATURE-----

--RhUH2Ysw6aD5utA4--
