From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/6] gpu: host1x: Enable Tegra186 syncpoint protection
Date: Thu, 19 Oct 2017 14:49:51 +0200
Message-ID: <20171019124951.GS9005@ulmo>
References: <20170928125044.32516-1-mperttunen@nvidia.com>
 <20170928125044.32516-2-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NAmHCRPXNp23hR9r"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170928125044.32516-2-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NAmHCRPXNp23hR9r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 03:50:39PM +0300, Mikko Perttunen wrote:
> Since Tegra186 the Host1x hardware allows syncpoints to be assigned to
> specific channels, preventing any other channels from incrementing
> them.
>=20
> Enable this feature where available and assign syncpoints to channels
> when submitting a job. Syncpoints are currently never unassigned from
> channels since that would require extra work and is unnecessary with
> the current channel allocation model.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/dev.h           | 15 +++++++++++++
>  drivers/gpu/host1x/hw/channel_hw.c |  3 +++
>  drivers/gpu/host1x/hw/syncpt_hw.c  | 46 ++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/host1x/syncpt.c        |  8 +++++++
>  4 files changed, 72 insertions(+)

Applied all of these, thanks.

Thierry

--NAmHCRPXNp23hR9r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnon20ACgkQ3SOs138+
s6GM+BAAptwq7Z8YIpkMNL66xJeQrpgwU21xGSKeq1eeyq1TS2Kq4EyJGGl9Xw3a
nvseqLVmHTCxK+981Np4+JmleRIOG4ggEmIkZOylA5qINOTNYEkrs+fGfgGV3XzR
G+b8PJlhlfTQhwLIz5UOBlOP1sZtx1upiRIA0sDOFCgC/XDAtjAs3EfrXvT6jzXL
FOpihsBbT0N7d8lKewT70rmNvaWbFomSagUj+8jn9mNJ/+i964RUvGYewbwIEupL
NX90gjo6cjUMKTpoDcQNYFklTrW1bppIuKmqR4lCQM9cIMr8ROSrLqqyCr0hdXNx
B8nOe+eZm4Mwgi2+OHWhh55PJtPz8CE9Gkp4WjuZoP0KI+tR3KG55ecT1d6R6V/d
9esaHhe0Mw69HHEsW7Jmvhq0kQS7st1B+VxFlUA5qN7VwWq0oBuzx77SZIEpZJ/F
HSyPynsLhF8qx9vWIfp4j8E89z81+I9W+RHmcBAUOZwxHM9werTMTQ5S0DKYa7cX
0c0wDVHC0aH1iNmgFOkX354R6GWuYauSD/iM2QeU9wfNyglO7/Hg7uveQgsQs4n7
2+wbOsNumI3wFL+vEkBYLj374wDg0M1PBPOL0y9DWY4qcZXaEq+37L0jRKloA9IR
KFxLFkmVCFvxge9UDli/ehWKLFKvy+8dlMFeYlq64tPcwOn7VPY=
=Lf8o
-----END PGP SIGNATURE-----

--NAmHCRPXNp23hR9r--
