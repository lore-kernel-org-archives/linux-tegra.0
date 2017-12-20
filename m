From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/5] drm/tegra: Trade overlay plane for cursor on
 older Tegra's
Date: Wed, 20 Dec 2017 21:19:43 +0100
Message-ID: <20171220201943.GF31757@ulmo>
References: <cover.1513783738.git.digetx@gmail.com>
 <fd0034ee935cc17915f4189ee65865c974f34d98.1513783739.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fd0034ee935cc17915f4189ee65865c974f34d98.1513783739.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2017 at 06:46:12PM +0300, Dmitry Osipenko wrote:
> Older Tegra's do not support RGBA format for the cursor, but instead
> overlay plane could be used for it. Since there is no much use for the
> overlays on a regular desktop and HW-accelerated cursor is much nicer
> than the jerky SW cursor, let's trade one overlay plane for the cursor.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c | 75 +++++++++++++++++++++++++++++++++++-----=
------
>  drivers/gpu/drm/tegra/dc.h |  2 ++
>  2 files changed, 59 insertions(+), 18 deletions(-)

Given the dependency on the alpha formats patch and due to lack of time
because of the holidays messing up the schedule I'd like to defer this
to v4.17, unless we can settle all of it until Friday.

Thierry

--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo6xd8ACgkQ3SOs138+
s6GcGA//ZE0mMbgAlwwnS/cB+9Dv9jrdzZ9ioht90+wakuCceDluHO3/0ypfmEoL
oyd+WPkxrgCc+mjA+6C+bcnCjiHOlrYn+93axmjf4qrmAhaByO9il+kn9SNSxOl7
/T9LhoYrOWDMAokoZh6pvk2zgrR0BnjOsyGVTbyq/SRqpHljwZExZjNwsYs2FO1s
b+meEVVjdvTPI6ZDbo/VeWj+al5/Vbte4l58jXVWMQorRz7Y9p1NhOalsH7a8QeC
dXNkYL4IXIu2JmNtL3OCk6u3o2ASAXMppcDqaTy0Ibnen5+P5NBjYRkB7OgVziyO
hnn6/gOZavVUC8B6cYa6t7w6aR+8xWk0SeoqZxgYZRGaPYyAkBX2tD81np8UvGkH
P5Hnoi7B+7GQHwNRx8OvU3yYoxOUBp/BPPxSgPGnaH16IoOWuq+nb6SUHlcAV+Ua
Pv+ScdmfS4+XBZ8GlvCQNI1CmwHsAX3PBVMMCwigaB4WYUA3KELiU1p+jTKQhmnJ
HuQ83zR8ZlTPOna4Gp+nw52LNDWj5/wBkcDqjPyOesT4YJrnR7S7PrUjl/xvx3Z0
xYcb6FTp2VPITscOnHQo5HeGVUQDO8Raqe23N6gpZAQIoYAL9rzDmi5y+Ci5EFEc
zAifOFajnVp9WgDy6XMz64u14vlhf9Flh13n+Gu/LYuDUd9dbhA=
=vlh+
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
