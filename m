From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] regulator: core: Add early supply resolution for a
 bypassed regulator
Date: Fri, 22 Apr 2016 11:48:37 +0100
Message-ID: <20160422104837.GC3217@sirena.org.uk>
References: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
 <1461255121-5245-5-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="StZ26hC3DS27TACW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461255121-5245-5-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--StZ26hC3DS27TACW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2016 at 05:12:00PM +0100, Jon Hunter wrote:

> A regulator that is in bypass will fail to be registered because we will
> attempt to get the voltage of the regulator (ie. it's bypass voltage)
> before the supply for the regulator has been resolved. Therefore, when
> getting the voltage for a bypassed regulator, if the supply has not been
> resolved, then attempt to resolve it. Additionally, move the setup of
> the regulator's supply name to before the call to
> set_machine_constraints() so that it can be resolved.

The basic pattern here makes sense but rather than doing this
specifically in the case where we have a bypassed supply we didn't=20
resolve yet I think we should instead always try to resolve the supply
but ignore the error unless we actively need the supply.  I'd be
surprised if we didn't run into other cases where we need to do this so
it seems better to try the resolution in one place.

--StZ26hC3DS27TACW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXGgGDAAoJECTWi3JdVIfQwI8H/iJMAC2fqr4iE8b8NAsFpFfd
Q3g+wmblHmyEPY4LqrEZtJzKAcvwx5I3gWfaj0Ojp/0PJH0iGptJ0K4ZK9cRX8En
QV1G6jrlmSzLz1nMzhnYp1huga5PW/sxfLPtnc/cWFV0ItH1eqW+XvMkBYli408v
FCy+IFKtFTaFYaB4kK5e5qY5rTLNep33JtdHoc8mScYwAmrd71QfF1v3wiB/Qnf9
8YRvtE3B5EBg4Xo+ZL7nyF5DAWCyxD1jdOFtYhYof0bY9txMa8ewMJ0QArZ39gZy
h4OOoG+E5IKJEVZ/TMtj4uGnNls9W0O79WVqjkAj2AJnUT0L96dInhE1Z0NHG7o=
=p/OG
-----END PGP SIGNATURE-----

--StZ26hC3DS27TACW--
