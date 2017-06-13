From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add bindings for
 nvidia,tegra186-ccplex-cluster
Date: Tue, 13 Jun 2017 14:42:39 +0200
Message-ID: <20170613124239.GC16758@ulmo.fritz.box>
References: <1496304245-24024-2-git-send-email-mperttunen@nvidia.com>
 <1497262984-2346-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497262984-2346-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2017 at 01:23:04PM +0300, Mikko Perttunen wrote:
> The Tegra186 CCPLEX_CLUSTER area contains memory-mapped
> registers that initiate CPU frequency/voltage transitions.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .../arm/tegra/nvidia,tegra186-ccplex-cluster.txt     | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,te=
gra186-ccplex-cluster.txt

The ARM SoC maintainers don't like to pick up device tree bindings, so
I'd prefer this to go through the cpufreq tree that also contains the
driver patches. Presumably this wasn't merged through that tree because
of the missing Acked-by by a device tree maintainer? Given that Rob's
acked it now, maybe you can resend this to Viresh, who I think had
picked up the driver?

Thanks,
Thierry

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk/3b4ACgkQ3SOs138+
s6FzchAAtPe9ZwHD7gAlKtNf4L3qwNB8e2gG9jXfRfIN+o0PQ8e9DqVa0tlFyyI4
d98vxRyCOsmhx1z1Bvi/M1YfGsI1qOgYMRw54V7R0TRQZFldLPkxsPoI3wmDOVIu
rLpk4o1ABudfkdZnB1c8s1MmOXjSWIkCwvy9W27v3BQDZCyfeZPve19R4UpeFvQ6
rzRPUwEa7B//hhCTaxXyM2OleA4YPO23eZIVhRMM4itHO5zrNMQEzLTosMHbfIh+
BtBI4x0eJ2WkGXGG9k2cN3xVW/7rUBPHT3lHAtSYFQBfh7peWK+M/QyYfrgAPp7Y
7HGwPnQp17x9lJih3jZYDIbrfTow8FdP/N7jT8YtzPwYABIt+B7/IDBdJRxexM+C
sFH2YeW7+y3mooYoc7q8qXrhI5r1m47oN3ij6jmMTIq5b5X16BDZI06/YG4PLUD4
lfIgH84slaj/xkS11Tfn4Scm3hU57qVTXsRP3yuN1Vu+GMes3Hu01p+d0qB6QWzw
g3TAv7lAqLMMXxMFUgisYuR0f/NDcjSx4WluO+pg0afIVc3BHQ97u1hZ7ZxsfVVd
scMGlq8RLBTZ141j6+MsIT+v38WzLiWRNTq8qJciLhiSaHY497eOV0Ilww5amk4S
ururDgLlNx+hL1bakbJxVsJNUF4g6WBHUjGnVEKP+iumcfMCHkg=
=gmBs
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--
