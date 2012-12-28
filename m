From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC,libdrm 1/3] tegra: Add stream library
Date: Fri, 28 Dec 2012 21:48:47 +0100
Message-ID: <20121228204847.GA4309@avionic-0098.adnet.avionic-design.de>
References: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com>
 <1355407268-32381-2-git-send-email-amerilainen@nvidia.com>
 <50DD407B.3030306@gmail.com>
 <50DD4E2C.2070104@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50DD4E2C.2070104-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Francis Hart <fhart-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 28, 2012 at 09:45:48AM +0200, Arto Merilainen wrote:
> On 12/28/2012 08:47 AM, Mark Zhang wrote:
> >>+int tegra_fence_is_valid(const struct tegra_fence *fence)
> >>+{
> >>+    int valid =3D fence ? 1 : 0;
> >>+    valid =3D valid && fence->id !=3D (uint32_t) -1;
> >>+    valid =3D valid && fence->id < 32;
> >
> >Hardcode here. Assume always has 32 syncpts.
> >Change to a micro wrapped with tegra version ifdef will be better.
> >
>=20
> You are correct. I will fix this.

I disagree. We shouldn't be hiding this kind of detail behind an #ifdef.
Instead it should be detected at runtime. Otherwise you'll need to build
different versions of libdrm for every generation of Tegra. That may be
fine for NVIDIA provided BSPs, but distributions would have a very hard
time dealing with that. What we want is software that works unmodified
on as many generations of Tegra as possible.

Thierry

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ3gWvAAoJEN0jrNd/PrOhQNEP/iRMXLlGxjX3BSmuPxsMoswD
6vDKtwGutOchfiWEXcMC5sCmRtDvWoG2aKRy+J/C2XAqxEF8E9FQts0iV+YdGz1P
0bQmt+A0Q94Os1UsROx7rF0qcurSM/WGBBeqdk98wGW/Lie73YR2zudmKXCnMQNS
hkcFW8h0pL/1RJ0qK+5EcoxzqGeRi1HS3t0vI/I6mBTj22MAx4AJzRJFefqeRivw
0Cbu8aSh3qvTC9ipf1pRwFlHrCw4yK79DcYBNa73nJxZIRoHBHu5LOtIM2SNjp9z
98nK5DgyFHpBOiO2+X+R1rtyiWWPxhiuubsm2I9hrKW7sgX0h0hOZUQW6cEs/g4L
EPCkyHNgl/qgoWAFrheSVtuTE8df1UzrtShrvd0F4gYq2XF/4gdPhTDCLC5Y9bw9
45XPXRkxGuAfQ0HIoSgBGdDPkJtMnmuC9Bl+yaG8P8tt4J0iO+f3oJuwTjq32SFt
8SNsP20jCOB851E0eTfM/GQ5Y342mEvJ61fLNeHfYRm7I76yvWlCgxcAFQsHa329
NLabgW22RSpYkl4XnMq71S66oUIZDjQzvR47ptohAmviJqGkLP1PRNkgY7tWpMbz
t1MXg7Ph8f8//ldWYjxvpMUIB6NgDZpIQuj6TceYfKIg5kASED0Qpf0P4HSXMML4
pOqZIMUKmd9IAJrTal+R
=dfKX
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
