From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] soc/tegra: fuse: Add Tegra132 support
Date: Thu, 8 Jan 2015 09:50:20 +0100
Message-ID: <20150108085019.GB1987@ulmo.nvidia.com>
References: <1420701887-1465-1-git-send-email-thierry.reding@gmail.com>
 <1420701887-1465-3-git-send-email-thierry.reding@gmail.com>
 <54AE34D6.5090507@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54AE34D6.5090507-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 08, 2015 at 03:42:14PM +0800, Vince Hsu wrote:
>=20
> On 01/08/2015 03:24 PM, Thierry Reding wrote:
> >From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> >Tegra132 is very similar to Tegra124 from a peripheral point of view and
> >uses the same fuse controller.
> >
> >Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >---
> >  drivers/soc/tegra/fuse/fuse-tegra.c   | 1 +
> >  drivers/soc/tegra/fuse/fuse-tegra30.c | 2 ++
> >  2 files changed, 3 insertions(+)
> >
> >diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fus=
e/fuse-tegra.c
> >index 011a3363c265..c0d660f1aaac 100644
> >--- a/drivers/soc/tegra/fuse/fuse-tegra.c
> >+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> >@@ -81,6 +81,7 @@ static const struct of_device_id car_match[] __initcon=
st =3D {
> >  	{ .compatible =3D "nvidia,tegra30-car", },
> >  	{ .compatible =3D "nvidia,tegra114-car", },
> >  	{ .compatible =3D "nvidia,tegra124-car", },
> >+	{ .compatible =3D "nvidia,tegra132-car", },
> >  	{},
> >  };
> >diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/f=
use/fuse-tegra30.c
> >index d1a4290cda5c..11fe22e0de73 100644
> >--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
> >+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
> >@@ -184,6 +184,8 @@ static void __init legacy_fuse_init(void)
> >  	case TEGRA124:
> >  		fuse_info =3D &tegra124_info;
> >  		break;
> >+	case TEGRA132:
> >+		fuse_info =3D &tegra124_info;
> Fall through intentionally?

Nope, good catch.

Thierry

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUrkTLAAoJEN0jrNd/PrOhH8QP/R6nFEmSHDAkuhEwhXWlEabJ
XZMevIYyNijDFGYb+4bd38eDDeH+7T6GCzRc9VcRsZDFvnQ95q0OlNReu8ghVMot
AJZOgD5YOLNYXspmmAbBL81apaTlijEWu8M3k65NSLFDQOU3B1+TfXnC9IbchqkU
e9bjGS1b94gXcTOVL+jtZSCxx3RC6iqSMgWfjxkHSXN3Nx6JiURwdek3rcy5f6Pr
q15Bz2HbBIqUu2XR/eE/Hwz5OPTWRf7eLk8CLbPsgfA03CctLXTDjs7SIvVD0cOp
7C79ncpP160WpEJaWp3bR2jBuv54uCsL7dCVfE+3scdb7NCt1YcSh1u4VY/CWT/U
Hg9OAbUlzL6exW4983zDqRGecEIyXU8PKTuE9GB44789r0hziIGskxKMuREX+OEs
5pAnPGwING0T8YPf4zRZAnMUritVVvgyyzIUwZmC+8AXBs/x5CXHQ5X5pvCcuLw4
0A9tcZKwjTIOp6tApqbdxFzkWPHRvDFK7WGOKomNqDw4OkXTpwppt+oBIxDP7gyx
oq6dEAs3EQb/HAhme3mU8UG5+tpnfzGojgWY2qVhmxDcoCwFhXKtB4NYCFyWsHhJ
TY7H0EbUcch5wIKCe/SiDIeKFvoTb8e+jy2cuI9B2qQ3u2L0EHnYR/6Q6JvD2NGZ
UXgQ5PFxdGQ7cegf7Z0V
=vU8a
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
