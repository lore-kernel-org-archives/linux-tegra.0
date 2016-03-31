From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: core: Use parent voltage from the supply when
 bypassed
Date: Thu, 31 Mar 2016 10:55:27 -0700
Message-ID: <20160331175527.GP2350@sirena.org.uk>
References: <1459359124-22436-1-git-send-email-broonie@kernel.org>
 <56FD33EE.6030109@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H5oeNUPfJ0vte6JU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56FD33EE.6030109-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--H5oeNUPfJ0vte6JU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 31, 2016 at 03:27:58PM +0100, Jon Hunter wrote:
> On 30/03/16 18:32, Mark Brown wrote:

> > +		if (bypassed) {
> > +			if (rdev->supply) {
> > +				ret = _regulator_get_voltage(rdev->supply->rdev);

> Should this be a return here?

Gnargh, yes.

> I gave this a quick test on tegra124 having populated the
> get/set_bypass() operators for the as3722. In this case, there is still
> a problem because _regulator_get_voltage() is called during regulator
> registration when set_machine_constraints() is called, which is before
> we have called regulator_register_resolve_supply(). Therefore, it seems
> to me that we still need to resolve the supply before we call
> set_machine_constraints().

OK, we need to change the code there to defer probe in the case where
the device is in bypass mode as well.

--H5oeNUPfJ0vte6JU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/WSOAAoJECTWi3JdVIfQaS4H/jVCVx5njN5peNNtClpVKLaH
f7NzszhVjPHN34snXacZUU8fzaxCMHRjeZvU0/r45js7fndZS6hWQ6Xk92XMcJ3S
kNrT38EwrCkql4KMiUFU6yvjlcePa7eZNw7t3CZtviJU7qzPF5KQZ/Iw6cwh84Pw
ylTfyCNoJr+nhYkYhtjmMdqvR72Bm9NpR8kUmei1YmMtHO2OBvSQ6G2R8DrP5uue
W1FE1al5U3CpDONHoRia7hLRFLg3YwHTeCvs28F3coi1T6WCIJaEDvEaO1l0JXOE
IPjndUTE3hHKfXIkFRNJjoUI32EiNyDSeV173gl51GZVHjDQPOCELk1VLc2fBNE=
=F9b/
-----END PGP SIGNATURE-----

--H5oeNUPfJ0vte6JU--
