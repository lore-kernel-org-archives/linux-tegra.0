From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC 2/7] pwm: Allow chips to support multiple PWMs.
Date: Wed, 21 Dec 2011 15:09:44 +0100
Message-ID: <20111221140944.GA30666@avionic-0098.adnet.avionic-design.de>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-3-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92E67@HQMAIL01.nvidia.com>
 <20111221075141.GB542@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111221075141.GB542-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Thierry Reding wrote:
> * Stephen Warren wrote:
> > In other words, can you do away with NR_PWM, and make it completely
> > dynamic?
>=20
> IRQ can be configured to use a radix tree if CONFIG_SPARSE_IRQ=3Dy. I gue=
ss it
> doesn't hurt to always use a radix tree for PWM, so I'll read up on it and
> will try to address that in the next version.

I guess something like idr/ida can be used to dynamically assign a PWM ID,
which would allow us to get rid of the bitmap. Then again, ida itself is not
much more than a bitmap either. It would complicate things a little in that
the ID assignment could no longer be assumed to be sequential for one given
PWM chip, so the lookup (or rather mapping the ID to a chip-relative number)
will be trickier to do.

I'm not sure that it's worth it. Perhaps I should keep the bitmap for ID
allocation and just set the number of bits to something sufficiently large,
say 1024? Then use a radix tree to store the actual descriptors.

pinctrl doesn't solve this because it uses statically allocated pin numbers.
Interestingly though it uses per-device numbering as well, which would be
fine for PWM as well if we had only device tree based probing. In order to
support other devices, we'll still need a global namespace.

Perhaps we can keep the global namespace using the bitmap as is for the time
being and introduce a per-chip API and move all users to that eventually? As
Mark already noted this will cause a lot of churn. Still, there aren't that
many users of the API yet (from Linus' latest tree):

	$ git grep -c pwm_request
	arch/arm/mach-s3c2440/mach-rx1950.c:1
	arch/arm/mach-vt8500/pwm.c:2
	arch/arm/plat-mxc/pwm.c:2
	arch/arm/plat-pxa/pwm.c:2
	arch/arm/plat-samsung/pwm.c:2
	arch/blackfin/kernel/pwm.c:2
	arch/mips/jz4740/pwm.c:1
	arch/unicore32/kernel/pwm.c:2
	drivers/input/misc/pwm-beeper.c:1
	drivers/leds/leds-pwm.c:1
	drivers/mfd/twl6030-pwm.c:2
	drivers/misc/ab8500-pwm.c:2
	drivers/video/backlight/pwm_bl.c:1
	include/linux/pwm.h:2

However, that would require a way to pass the providing PWM chip to the
driver (in addition to the PWM ID). I'm thinking that we should do this step
by step and use a global namespace for now, with a given maximum number of
PWM devices (with the current API there is only a very limited number of
devices anyway) and modify or extend the API subsequently.

Thierry

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7x6KgACgkQZ+BJyKLjJp8bkwCggHYZPHkUFpdDEQLDmLlw6rn+
IEAAnRoD+L8673XVK8MklWlFtqqY41a6
=Up8S
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
