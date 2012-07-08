From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Sun, 8 Jul 2012 07:53:06 +0200
Message-ID: <20120708055306.GA5186@avionic-0098.mockup.avionic-design.de>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
 <20120705121506.GA23732@avionic-0098.mockup.avionic-design.de>
 <4FF74391.5040004@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FF74391.5040004-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 06, 2012 at 01:59:13PM -0600, Stephen Warren wrote:
> On 07/05/2012 06:15 AM, Thierry Reding wrote:
> > Here's a new proposal that should address all issues collected
> > during the discussion of the previous one:
> >=20
> > From tegra20.dtsi:
> ...
>=20
> At a quick glance, that all seems pretty reasonable now.
>=20
> > One problem I've come across when trying to get some rudimentary
> > code working with this is that there's no longer a device which the
> > DRM driver can bind to, because the top-level device (host1x) now
> > has a separate driver.
>=20
> Can't you just have the host1x driver trigger the instantiation of the
> DRM driver? In other words, the host1x node is both the plain host1x
> driver and the DRM driver. So, after initializing anything for host1x
> itself, just end host1x's probe() with something a call to
> drm_platform_init(), passing in host1x's own pdev.
>=20
> After all, it seems like the whole point of representing host1x in the
> DT is to expose the graphics HW, so you'd need the DRM device in that
> case.

The reason that I've been hesitating is that host1x isn't related only
to graphics HW but is also required to make f.e. video input work. So I
can imagine a setup where for instance you need only video input and
send captured data via the network. If host1x registered the DRM driver
it would imply that setups that don't require any output would still
have the whole DRM initialized.

I did post a proposal to solve this problem, which doesn't seem Tegra
specific, to dri-devel last week. But if nobody else thinks it's a
problem to use host1x then I'll just use that as the easy way out. If
this happens to cause problems at some point in the future we can always
address it then. If host1x is tightly coupled to DRM then I think we can
also keep the driver with the rest of the DRM code.

Thierry

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP+SBCAAoJEN0jrNd/PrOh0lcP/1vd6v0+4fzbPdTGujK1c6PA
wjTYtOONav1v1diLVXuSaJgG4v6IxLWJ1w8uCNIGltFPKkzK0YZHTkCZn28Y0syo
M9TuoPRzy+okcowJb7JuACvbbxJVt7+tTYu8HWHVFfXlPwvG4P5ysiduWPm/NUdG
3CRUAtlIckYPZdvb4Gh/pRFP4ahFZVC95Ox5idkRIcBaWroor/GCvTiDYxntZKEo
tdrU99g84y/BH6qBEjunSbaTaRciMygD65BHVGb05sq4uFIH1Tc6cBXIRbUzdZcd
Jy5P9Wjdtprms4fSrOqPiUBD0zCTvicSu5WGswPEFDKDLlPMmaLXhrj9IqoWpJNV
fpzDO+1Z8/WDnykXRqS6aoMLDCrncEOvRqybofqAulOSiukbJTYmcw1cEKinrNQv
MJzbFWBuP3tsnLVE+t+9AypGEPWwca9m+eytrPNNmJDbcsfgUAs0yWKScbhKoY2M
MOo08RyLBkCuCGk0AqCs1Z7lVlhgSyEMmtyYGqgEV+ePt6J0XtDRqlyATCAhmULv
UwPYYu2sn7xHJ+yow06mHR2jFTlod9cBW2DgTst0v7MFob2a1sEZtG0eHVFW7yt2
FfyQQ2EAqErC60QGb/Yw1a4gA6ZdmP1Ovn/Y4T2Np0iWRM5wfHqXFi9xkNKyxNRI
XOLWA7LJX89rfFqEfJQV
=dJsp
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
