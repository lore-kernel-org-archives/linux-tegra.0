From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 02/10] pwm: Allow chips to support multiple PWMs.
Date: Tue, 7 Feb 2012 08:04:00 +0100
Message-ID: <20120207070400.GA29238@avionic-0098.mockup.avionic-design.de>
References: <1328541585-24642-1-git-send-email-thierry.reding@avionic-design.de>
 <1328541585-24642-3-git-send-email-thierry.reding@avionic-design.de>
 <4F3044A9.8000202@metafoo.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F3044A9.8000202-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Lars-Peter Clausen wrote:
> On 02/06/2012 04:19 PM, Thierry Reding wrote:
> > This commit modifies the PWM core to support multiple PWMs per struct
> > pwm_chip.
>=20
> I think you should mention what motivates this change.

Okay, I can add that.

> > It achieves this in a similar way to how gpiolib works, by
> > allowing PWM ranges to be requested dynamically (pwm_chip.base =3D=3D -=
1) or
> > starting at a given offset (pwm_chip.base >=3D 0).
>=20
> If we've learned one thing from gpiolib, I think it is that using a global
> index to identify a resource was a bad idea.

Yes, that concern has been raised several times already. The reason for it
being this way is that the current API requires it. So either we keep it as
is for now and change it over to indexing on a per-chip basis later (which
has the advantage of not breaking anything currently in-tree) or we make th=
at
change now, in which case this patch series will probably double in size. I=
'm
also not sure if I can reasonably keep the series bisectible that way.

One of the major problems when converting to a non-global namespace is how =
to
represent the relationship in code. For device tree this should be easy to =
do
because it has all the infrastructure in place. For non-device-tree devices=
 I
have no idea yet how this could be done. Perhaps by using something like the
clock API and using names for lookup?

> > A chip specifies how
> > many PWMs it controls using the npwm member. Each of the functions in
> > the pwm_ops structure gets an additional argument that specified the PWM
> > number (it can be converted to a per-chip index by subtracting the
> > chip's base).
> >=20
> > The total maximum number of PWM devices is currently fixed to 64, but
> > can easily be made configurable via Kconfig.
>=20
> The code says 1024.

Right, I missed that. Thanks.

> > The patch is incomplete in that it doesn't convert any existing drivers
> > that are now broken.

I just noticed that this isn't completely valid anymore either since I've
ported two of the drivers. However, The remaining drivers won't work proper=
ly
when built against a kernel with PWM framework support because of the
duplicate symbols.

Thierry

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk8wzOAACgkQZ+BJyKLjJp+DNQCeOO04eyKJlSax6hW+vw97dEm9
/IkAn207EQKXryYMtPAX1QmIjdq03kz5
=Eqrr
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
