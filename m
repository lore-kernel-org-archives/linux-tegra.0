From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 02/10] pwm: Allow chips to support multiple PWMs.
Date: Thu, 23 Feb 2012 17:04:20 +0100
Message-ID: <20120223160420.GA9899@avionic-0098.mockup.avionic-design.de>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
 <201202221634.45159.arnd@arndb.de>
 <20120223081235.GC8621@avionic-0098.mockup.avionic-design.de>
 <201202231407.12981.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201202231407.12981.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Arnd Bergmann wrote:
> On Thursday 23 February 2012, Thierry Reding wrote:
> > > Is this only used for the device tree functions? If so, I would recom=
mend
> > > making it less generic and always search for a device node.
> >=20
> > It is currently only used to look up a struct pwm_chip for a given stru=
ct
> > device_node, yes. But I can see other uses for this. For instance this =
could
> > be useful if we ever want to provide an alternative way of requesting a=
 PWM
> > on a per-chip basis.
>=20
> Nah, just keep it simple for now. If we need it later, we can still
> add something like this back, but for now it's just a source of
> confusion and possible bugs.

Will do.

> > I was again basically looking at gpiolib for inspiration (maybe I shoul=
d stop
> > doing that :-). Maybe gpiolib should be reworked to use seq_file's iter=
ator
> > interface as well? Just in case anybody else turns to gpiolib for
> > inspiration.
>=20
> Good idea. Would you be able to send a patch for that, too? I would guess
> converting both at the same time would be easier for you than splitting
> the work between two people.

I'll take a shot at it. It may take some time, though.

Thierry

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9GY4QACgkQZ+BJyKLjJp93wQCeOUNp+dNGo7L9VFwMswNJj3oQ
2ScAoLEDXaSCp5EDexf5XFFfilo4SwrC
=WJrc
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
