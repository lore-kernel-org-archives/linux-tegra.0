From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 03/10] pwm: Add device tree support
Date: Tue, 20 Mar 2012 06:51:22 +0100
Message-ID: <20120320055122.GA25778@avionic-0098.mockup.avionic-design.de>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <1331740593-10807-4-git-send-email-thierry.reding@avionic-design.de>
 <4F67E7A3.3090603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F67E7A3.3090603-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> On 03/14/2012 09:56 AM, Thierry Reding wrote:
> > This patch adds helpers to support device tree bindings for the generic
> > PWM API. Device tree binding documentation for PWM controllers is also
> > provided.
> ...
> > +static struct pwm_device *of_pwm_simple_xlate(struct pwm_chip *pc,
> > +					      const struct of_phandle_args *args)
> ...
> > +	if (args->args_count < pc->of_pwm_n_cells)
> > +		return ERR_PTR(-EINVAL);
>=20
> I think you can drop that error-check given the code quoted below?
>=20
> (and if not, shouldn't it be !=3D not >=3D ?)
>=20
> > +struct pwm_device *of_pwm_request(struct device_node *np,
> > +				  const char *propname, int index)
> ...
> > +	if (args.args_count !=3D pc->of_pwm_n_cells) {
> > +		pr_debug("%s: wrong #pwm-cells for %s\n", np->full_name,
> > +			 args.np->full_name);
> > +		pwm =3D ERR_PTR(-EINVAL);
> > +		goto put;
> > +	}
> > +
> > +	pwm =3D pc->of_xlate(pc, &args);

Yes, you're right. It is completely redundant.

Thierry

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9oGtoACgkQZ+BJyKLjJp+lwQCfQW83liFWXoyQ/NEyvGytQx07
PF0AoIl4D70g3CDeraUuyDvoHswqJjQ1
=EIXf
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
