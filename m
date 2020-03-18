From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] usb: tegra: Changes for v5.7-rc1
Date: Thu, 19 Mar 2020 00:20:22 +0100
Message-ID: <20200318232022.GB2885069@ulmo>
References: <20200313170730.2924259-1-thierry.reding@gmail.com>
 <20200317185835.GC1480055@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200317185835.GC1480055-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2020 at 07:58:35PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 13, 2020 at 06:07:30PM +0100, Thierry Reding wrote:
> > Hi Greg, Felipe,
> >=20
> > The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea098=
62b9:
> >=20
> >   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/fo=
r-5.7-usb
> >=20
> > for you to fetch changes up to 9dd4fbef2f88ccf46f5294805bf121d6554791e8:
> >=20
> >   usb: gadget: tegra-xudc: Support multiple device modes (2020-03-13 17=
:16:28 +0100)
> >=20
> > It occurred to me that I could just as well send this pull request to
> > you guys, rather than take it via ARM SoC. Kishon already acked all the
> > patches for the PHY tree that this series depends on, so I've included
> > them here as a dependency.
> >=20
> > Let me know if you'd prefer that I take this through ARM SoC.
>=20
> I tried to merge this into my usb-next branch, but get merge issues in
> drivers/usb/gadget/udc/tegra-xudc.c that I really don't know how to
> resolve.
>=20
> Can you give me a clue as to what to do here?

Let me rebase this on top of your usb-next branch and resend this PR
after resolving the conflict.

Thierry

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5yrLYACgkQ3SOs138+
s6H07hAAoRtKHCeERZPuj3qTdFkm/k6KVMKDmmjN2Aj7jLVTbGGNrcjplf5J5bWO
9x905oLXFCmcerVaX/oK6Q68feEWkpEEC6dQrDssixyN6hmEDH534KpM9NxFqUFR
XL4FYYcwlhIyQtMSx/8i3gs8efPdjreKg0BPXbej4fWYWc4/IwD+WMJa7B5bzYfJ
F5spv1T08zEn5QXzOJ6rdmTBHKZ6ximxHZbbrmltm7YvCQweOGykmnuo+FNNmMOm
IvjBaYQZ9iqhfc2cEWzKmyV8Oitwx07McTEtUcr/AfKHEA29jGNSafyQJVxUo2Un
FMoi9WNnUR4fRAAHLSnYqiKH2yoYqFAZOIrLDWs92eRlHUia2x6+5ZdxXaZbQ4Ln
kozSV9D240VBWZUb0BW5g4oSjYkIkC8O/hYxah1T3aTIeHAcS2Jv4kWBfO3VL2K6
BJIJxJOniwGIy6gRlPvYHLHffmqJD05aDDZXthSyawdp81EUmj3qBfjN1slQH3mk
anW8v+/DaaNons4dlnVXt+uc7Y2ZDcD0h/i+FODe5EgFtSd1+HNbgbVNNVIRw0ts
BAF0EG1U1+kpJr8W6y6vcgaeSRjxjmQ5A/ZKgiTEsbU/kwudkCKBXCVddHYpo6rv
fTBjr3t+jDNnavS5/LDVNj05bEDglTKZQy03z95XinXgl47ulOA=
=tYCX
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
