From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 3/8] gpu: host1x: Add channel support
Date: Fri, 8 Mar 2013 21:43:01 +0100
Message-ID: <20130308204301.GA30742@avionic-0098.mockup.avionic-design.de>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com>
 <1358250244-9678-4-git-send-email-tbergstrom@nvidia.com>
 <20130225152457.GA29545@avionic-0098.mockup.avionic-design.de>
 <512C84E2.5090201@nvidia.com>
 <513A0ED0.4070701@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <513A0ED0.4070701-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2013 at 06:16:16PM +0200, Terje Bergstr=C3=B6m wrote:
> On 26.02.2013 11:48, Terje Bergstr=C3=B6m wrote:
> > On 25.02.2013 17:24, Thierry Reding wrote:
[...]
> >>> +struct mem_handle;
> >>> +struct platform_device;
> >>> +
> >>> +struct host1x_job_unpin_data {
> >>> +     struct mem_handle *h;
> >>> +     struct sg_table *mem;
> >>> +};
> >>> +
> >>> +enum mem_mgr_flag {
> >>> +     mem_mgr_flag_uncacheable =3D 0,
> >>> +     mem_mgr_flag_write_combine =3D 1,
> >>> +};
> >>
> >> I'd like to see this use a more object-oriented approach and more comm=
on
> >> terminology. All of these handles are essentially buffer objects, so
> >> maybe something like host1x_bo would be a nice and short name.
>=20
> We did this a bit differently, but following pretty much the same
> principles. We have host1x_mem_handle, which contains an ops pointer.
> The handle gets encapsulated inside drm_gem_cma_object.
>=20
> _bo structs seem to usually contains a drm_gem_object, so we thought
> it's better not to reuse that term.
>=20
> Please check the code and let us know what you think. This pretty much
> follows what Lucas proposed a while ago, and keeps neatly the DRM
> specific parts inside the drm directory.

A bo is just a buffer object, so I don't see why the name shouldn't be
used. The name is in no way specific to DRM or GEM. But the point that I
was trying to make was that there is nothing to suggest that we couldn't
use drm_gem_object as the underlying scaffold to base all host1x buffer
objects on.

Furthermore I don't understand why you've chosen this approach. It is
completely different from what other drivers do and therefore makes it
more difficult to comprehend. That alone I could live with if there were
any advantages to that approach, but as far as I can tell there are
none.

Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJROk1VAAoJEN0jrNd/PrOhWPEQAIvh04xaUpjzn4lkU6OoTv99
wFp9r8LoyCb4gwKEP4O7/QzLVLFvte90rIOSJVKaxZ6Eo8qI02mJ085OjviHYiQZ
Lh8Pm860V4chC7xchiW8M9FExGx+Hn8cNtict8jKtxa0jD03kuNSwFH0pablj2e+
MY1it3rgXX60+OBP7a67VzM9bi3iuslHpUc3i1hLRnyzqct7FKeqKSVEwam1s1Ys
APZXmSrXUK5jF4vt8iuf/bniBwCjH9IiMkIaXHecV5W+8I7tkzHxQPgRZKCMV9cu
6VnFo+mHuemdqQmYC2hRTnPLZBOEN06NQc2KnPEhQ7Wcw5XpoR+bgeFVCngpshRY
xyTXmMkAeRc+n2fMLe1DSU+zqoRevKyZAjHn95Cdeu0mrxQqMdnQCMhdhcCdyKn9
fRWMK1N93j1ISed8OuKnseXw98trgDum5HbN96g37/imIBd8ZYLskBDL5P0JT8LA
I60iRilqZ3z7IIZMfJyj/wCY6Q9MbbwFGjHeRCrOVfrLRa9awD8l/N97ClNEp7tm
2Hc9XV3pyys6yp8xE3PXZYaG5ZiHgrWox4kEzNpbEHePWFAOfIMYQLPLgQ/XmfIA
emrOPXaOpiWvmnvk1F03UAsRiLUn2wgp2rUodq5xsoB9wQ+2b7qgTXQfVzcv3+NL
+v4OYZUOhs9koLAXfQdt
=yMta
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
