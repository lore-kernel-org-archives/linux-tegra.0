From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v1 10/18] dt-bindings: tegra: Document VI and CSI
 port nodes
Date: Thu, 18 Jun 2020 12:50:07 +0200
Message-ID: <20200618105007.GA3663225@ulmo>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-11-git-send-email-skomatineni@nvidia.com>
 <20200617221411.GB2923473@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200617221411.GB2923473@bogus>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 04:14:11PM -0600, Rob Herring wrote:
> On Tue, Jun 09, 2020 at 11:02:32PM -0700, Sowjanya Komatineni wrote:
> > This patch documents Tegra VI and CSI port and endpoint nodes along
> > with the other required properties.
> >=20
> > Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../display/tegra/nvidia,tegra20-host1x.txt        | 87 ++++++++++++++=
++++++++
> >  1 file changed, 87 insertions(+)
>=20
> This is getting converted to schema by Thierry.

Yeah, once this has settled it probably makes sense for me to pick this
up into the json-schema series on top of the initial conversion.

Thierry

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7rRt0ACgkQ3SOs138+
s6GjeQ//V5z5HHU3AGAEhkRvK5MxJwjbKjLteO/qr7SoHUcB0259EJUCo+M/Sj9r
fhPbTuepd7NldeZBKTTHO+nwYVsl09ztvRAEdHHOZ9Nir6xToHYmr8i9t8bJH0Da
Z1zueXUCBK+XWvodw0qzW6vLAZKAPgXk9ZyWXE2QcdiKTi/nq//ND3Wl2m1f8qdc
IeoReqDLMJZEkig5HdDjkDcX0DnYhWaiN6TlYTN0gFt0P9n/3vrys6A3UnKQHcAt
/vKgw5YKUfk4MHhKVZqWAeOVhRHxpef+2Q5atXqxWCwAQtcbrANXKA2UQMZ/fiux
7xs8MhOOhkfVrH67N8qU/qzS00k8V+5CW1XVBfMQs2qfwRFSXlpBj5ONXPWLzbKs
5/LXp/y+A+L0U7SykbfD8lT6SsCxabI5jF6jF/zlExc4gpqlL0gjVEaNpMcFje1/
40ZwDxxQZHtSamkuOET5flEgDbe/uTc07Susmee5tBP3I91C7zikZZJvvKJ6sZnO
HuQ3Yq67LFLl/q+pjyHPXoxx7+OsY1Z7Zm/3WWjfnprR+Y2IjUJ70nqxvlx/FZ03
HrTf1iReuKRJMB1uDJT9YHxkAELACQql2hxCs1pa+X3GV/G5C0sMxN4rmmZQeQnm
dzqM9ZVaXqmHopcGVfsAXF3/nyLKVPYVTdjngoP1fxcIqv9rEV4=
=gbuv
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
