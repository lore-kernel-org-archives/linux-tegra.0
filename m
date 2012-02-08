From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 02/10] pwm: Allow chips to support multiple PWMs.
Date: Wed, 8 Feb 2012 12:12:32 +0100
Message-ID: <20120208111232.GB17615@avionic-0098.mockup.avionic-design.de>
References: <1328541585-24642-1-git-send-email-thierry.reding@avionic-design.de>
 <1328541585-24642-3-git-send-email-thierry.reding@avionic-design.de>
 <4F3044A9.8000202@metafoo.de>
 <20120207070400.GA29238@avionic-0098.mockup.avionic-design.de>
 <20120208091327.GH889@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120208091327.GH889-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Russell King - ARM Linux wrote:
> On Tue, Feb 07, 2012 at 08:04:00AM +0100, Thierry Reding wrote:
> > One of the major problems when converting to a non-global namespace is =
how to
> > represent the relationship in code. For device tree this should be easy=
 to do
> > because it has all the infrastructure in place. For non-device-tree dev=
ices I
> > have no idea yet how this could be done. Perhaps by using something lik=
e the
> > clock API and using names for lookup?
>=20
> Well, the first step is to make sure that the pwm 'chip' drivers don't
> know anything about the global numberspace.
>=20
> That limits the extent of the global numberspace to the pwm core and
> pwm users.  You then don't have to worry about the pwm chip drivers
> while you work out how to solve the other half of the problem.

I see. That would mean that pwm_request() gets a global PWM index, looks up
the corresponding PWM chip and device then pass the chip-relative index to
the driver's ops.

I think that can be simplified even further. For instance if the pwm_device
structure contains a pointer to its parent struct pwm_chip, then that can be
used directly to call into the driver's ops. And the ops could be modified =
to
take a pwm_device instead of the global PWM index. That would be similar to
how struct irq_data is used.

Thierry

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk8yWKAACgkQZ+BJyKLjJp939gCffQthLS1qNbtFtcS1zsOpp3Gt
t70AoICLDNsi61iW5Hd+uCdKctBiqWUk
=gXd9
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
