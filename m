From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 02/10] pwm: Allow chips to support multiple PWMs.
Date: Sat, 3 Mar 2012 20:32:49 +0100
Message-ID: <20120303193249.GA22021@avionic-0098.mockup.avionic-design.de>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
 <201202221634.45159.arnd@arndb.de>
 <20120223081235.GC8621@avionic-0098.mockup.avionic-design.de>
 <201202231407.12981.arnd@arndb.de>
 <20120223160420.GA9899@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120223160420.GA9899-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Thierry Reding wrote:
> * Arnd Bergmann wrote:
> > On Thursday 23 February 2012, Thierry Reding wrote:
> > > > Is this only used for the device tree functions? If so, I would rec=
ommend
> > > > making it less generic and always search for a device node.
> > >=20
> > > It is currently only used to look up a struct pwm_chip for a given st=
ruct
> > > device_node, yes. But I can see other uses for this. For instance thi=
s could
> > > be useful if we ever want to provide an alternative way of requesting=
 a PWM
> > > on a per-chip basis.
> >=20
> > Nah, just keep it simple for now. If we need it later, we can still
> > add something like this back, but for now it's just a source of
> > confusion and possible bugs.
>=20
> Will do.

I turns out that this is not as easy to do as I thought. The problem is that
if I remove the pwmchip_find() from the core and move the lookup
functionality into the OF support code I no longer have access to the list =
of
PWM chips. So I guess it will have to stay in to keep things encapsulated
properly.

Thierry

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9SceEACgkQZ+BJyKLjJp8s7gCfdDyNiTLuh74KROE93wQDMqJ3
alwAn2xEUB3JeTjHO6Zz0wJnhQU+FWZf
=rPxI
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
