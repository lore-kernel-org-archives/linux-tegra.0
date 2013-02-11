From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 8/8] drm: tegra: Add gr2d device
Date: Mon, 11 Feb 2013 07:44:52 +0100
Message-ID: <20130211064452.GA16676@avionic-0098.mockup.avionic-design.de>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com>
 <1358250244-9678-9-git-send-email-tbergstrom@nvidia.com>
 <20130204125618.GD595@avionic-0098.mockup.avionic-design.de>
 <511095F9.6040607@nvidia.com>
 <20130205095403.GF20437@avionic-0098.mockup.avionic-design.de>
 <5112C9C5.8080205@nvidia.com>
 <20130208070734.GB15429@avionic-0098.mockup.avionic-design.de>
 <51183E8D.1090607@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51183E8D.1090607-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 10, 2013 at 04:42:53PM -0800, Terje Bergstr=C3=B6m wrote:
> On 07.02.2013 23:07, Thierry Reding wrote:
> > On Wed, Feb 06, 2013 at 01:23:17PM -0800, Terje Bergstr=C3=B6m wrote:
> >>>> That's the security firewall. It walks through each submit, and ensu=
res
> >>>> that each register write that writes an address, goes through the ho=
st1x
> >>>> reloc mechanism. This way user space cannot ask 2D to write to arbit=
rary
> >>>> memory locations.
> >>> I see. Can this be made more generic? Perhaps adding a table of valid
> >>> registers to the device and use a generic function to iterate over th=
at
> >>> instead of having to provide the same function for each client.
> >> For which one does gcc generate more efficient code? I've thought a
> >> switch-case statement might get compiled into something more efficient
> >> than a table lookup.
> >> But the rest of the code is generic - just the one function which
> >> compares against known address registers is specific to 2D.
> > Table lookup should be pretty fast. I wouldn't worry too much about
> > performance at this stage, though. Readability is more important in my
> > opinion. A lookup table is a lot more readable and reusable I think. If
> > it turns out that using a function is actually faster we can always
> > optimize later.
>=20
> You're right about performance. We already saw quite a bad performance
> hit with the current firewall, so we'll need to worry about performance
> later.

I guess the additional overhead of looking up in a table vs. an actual
function being run will be rather small compared to the total overhead
incurred by having the firewall in the first place.

> I'll take a look at converting the register list to a table. Instead of
> always doing a linear search of a table, a bitfield might be more
> appropriate.

I don't know. Just a plain table with register offsets seems a lot more
straightforward than a bitfield. In my opinion an array of offsets is a
lot more readable than a field of bits. Especially since you can't just
setup a bitfield easily with initialized values.

Thierry

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRGJNkAAoJEN0jrNd/PrOhaN4P+wQ2oLQaiDWjCPh7T/fVRYc2
E+dRsXBYb6KVTUdJ7wI5IekGsM8IOyzTHRQ+X8zgWdUPCou8mcDCTXcwzvWbR3vc
8BI0JjJ9A4CX0iZh1R8cqI9yNQVT1ntHQ7d+e4D9t0deZfyHqmW3W6ew+zdokJMO
BFoYqekBZXsAmAHmWdJBxtAMEREapc3o9crGkJrk2bZp4rHP8MEm+s+U4mtyPyf1
UPg7pP5LKacFOwYDGLtmpM22T5ZRCGSjD/q/uTofYjzqRv/0+eC3Md0+2Vtx/tps
cpPt0MSFzuUA+eONk62LlCLASm5exRfpWatLrO5IQRy+GL/eq7770ygpfJjBDco2
vvzVAAQOcY9f3NGld5ApaSYF48WyNZgdO3SW5/SULWxGXympNE1Sx1NMI//J4EPS
wau2lqw6sNOpuwfVmdz4XHe8gn0EZJDRRjt3bmLBhrqdFUuVtVr53XOIyxBC7eB4
L32RV+LwGf0NePkBjSruwtW1nySGmAhelJnuwvZ53u9vwsgdWrNVo5XA8kE0jmNd
lVi4aC0m0iACcvo8OlbP9H0U6yGWWT2KpitxLgPI7FFTeyAgnLr9nV8qN43qV0Yw
/rycpZ6QeIpJKiIS+hvJAnCIBbK7Gs91Irlu1avSabeG04m4nF3V4+yWXSBu4L+y
7vQM61sG8aep7sGhMIyf
=WOrU
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
