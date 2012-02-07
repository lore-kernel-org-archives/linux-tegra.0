From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 02/10] pwm: Allow chips to support multiple PWMs.
Date: Tue, 7 Feb 2012 11:38:55 +0000
Message-ID: <20120207113854.GI3332@opensource.wolfsonmicro.com>
References: <1328541585-24642-1-git-send-email-thierry.reding@avionic-design.de>
 <1328541585-24642-3-git-send-email-thierry.reding@avionic-design.de>
 <4F3044A9.8000202@metafoo.de>
 <20120207070400.GA29238@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WHz+neNWvhIGAO8A"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120207070400.GA29238-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--WHz+neNWvhIGAO8A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 07, 2012 at 08:04:00AM +0100, Thierry Reding wrote:
> * Lars-Peter Clausen wrote:

> > If we've learned one thing from gpiolib, I think it is that using a global
> > index to identify a resource was a bad idea.

> Yes, that concern has been raised several times already. The reason for it
> being this way is that the current API requires it. So either we keep it as

Might be worth calling this out in the changelog to preempt further
discussion - it's a totally sensible approach to take but it's not
going to be immediately obvious to reviewers.

--WHz+neNWvhIGAO8A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPMQ1CAAoJEBus8iNuMP3dZhEP/1I/rBEFpQagT0SUyx7G/lPR
bkyNYLgv9exVkCmuZj6NF2v86WPg76PrMyQkxhQAf3pDE5qFXM7CCd2KYiUZbEEE
AvyN+p45J2MbzDh3n7sNTqA+kKXInl4ib0m9iJNxqUGBi9HQQU9YF3xIfNxd2CWu
fsQS3E5poBi4UmjxVI1sDwL1hhZ2R2sIGRfepBohgVkFG5nKyDvKlbOS6zr7x3TJ
Pg+o7v6Ncpn4MiVKH19u31NQvoHCxEQj92tHZmCqMSp6wQ4/5VgG1s/m85I3GqgY
qw+L8xeh2KZuz7e910sxHfLAzXsSbYnbIsW6q/c7AELv1YBmCvLHz51zqGQECKvh
1pOHZSFStTWf/Hxe0xwcZhWM/gwQWIg/gTDzaAlIBCzsOQLt3eMk+h/oyWU4nMIh
gaGFIcj/OWlt5hYIyK163u2eY+No+L575D3RAgh2U/HcBxIEjnYiOVFs9LqaoTYV
qIgsYOWLtL5+QLPs+oREgnS79ljnQIW5LDDowcQ5a0Ee2WsC5nvIiowgQ1Nz+lwo
Y03NrxBfi4D/DvyQSTPsAs08HIe74r2oyNv/MRNrtH2XEtWQYHinVxfqgWXmvSp8
yF+6/ZA0obXvEYPpTTaCeS0dUShMKYb0X8cCWh12/iKCFAebOAS2SdANTaIigaIu
EFpAQ6Xk/lZ7vmEBeKME
=56QR
-----END PGP SIGNATURE-----

--WHz+neNWvhIGAO8A--
