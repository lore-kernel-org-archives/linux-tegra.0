From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tegra-cpuidle: provide stub when !CONFIG_CPU_IDLE
Date: Tue, 27 Aug 2013 09:45:03 +0200
Message-ID: <20130827074502.GD8686@ulmo>
References: <20130826153050.GC8764@redacted.bos.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130826153050.GC8764-nxOev/eQj6CGu0OVIAPS5KfLeoKvNuZc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyle McMartin <kyle-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 11:30:51AM -0400, Kyle McMartin wrote:
> While poking at something using the for-3.12/* trees, I hit the
> following compile error:
> drivers/built-in.o: In function `tegra_pcie_map_irq':
> /builddir/build/BUILD/kernel-3.10.fc20/linux-3.11.0-0.rc6.git4.1.fc20.arm=
v7hl/drivers/pci/host/pci-tegra.c:640:
> undefined reference to `tegra_cpuidle_pcie_irqs_in_use'
> drivers/built-in.o: In function `tegra_msi_map':
> /builddir/build/BUILD/kernel-3.10.fc20/linux-3.11.0-0.rc6.git4.1.fc20.arm=
v7hl/drivers/pci/host/pci-tegra.c:1227:
> undefined reference to `tegra_cpuidle_pcie_irqs_in_use'
> make: *** [vmlinux] Error 1
>=20
> Since our .config had CONFIG_CPU_IDLE off. We should probably provide
> an empty function to handle this to avoid cluttering up pci-tegra.c
> with conditionals.
>=20
> Signed-off-by: Kyle McMartin <kyle-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> --- a/include/linux/tegra-cpuidle.h
> +++ b/include/linux/tegra-cpuidle.h
> @@ -14,6 +14,13 @@
>  #ifndef __LINUX_TEGRA_CPUIDLE_H__
>  #define __LINUX_TEGRA_CPUIDLE_H__
> =20
> +#ifdef CONFIG_CPU_IDLE
>  void tegra_cpuidle_pcie_irqs_in_use(void);
> +#else
> +static inline void tegra_cpuidle_pcie_irqs_in_use(void)
> +{
> +	return;

There's technically no need for this return statement, but either way
the patch looks good, so:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHFj+AAoJEN0jrNd/PrOhD+IP+gKspC+ZUEJEuYTjimpYi4no
hdEAjVDuzYh6J3r6sK5ADl2yMvORpsz0ZJ7zXl5NpLMYkeIqwLqlAK0ItjpRAsI8
bFOAbxOo4KJgoM2p8EewtwxZA75VMorxIdxt9KQ0w8a6q1O2xBw5T0c1G4yeIUym
HhAl3agrARcaRyaT2dBQAAIesd7MCqpXTbNoJECbyWpFbRG3ZW01hcYkNnGeRZcK
HPSfqF7KcLvu9jWfB2hKkVd2/Z5MS//YJ/3s7ZCzvl6uN/f9k4JnNVh0TA09yN0j
/uq2wpryYuZmchHhee8a3dy9PkrzNE15dnD3y60hhPJrxndUT2ZG+zVPK/dJAaFr
WW5A5UK2nilz6qeZEyjZtY2bkS58H/M9PgVR8okIU8PPVKqPYeASbq1MVFJ8kZXL
PGq8deI8tZv3m9BXZkfKfm4GVYGP+d9xFI91dNKo1/Z5Nz2PZQzZ77bzVgDBuYYc
gA+rs8AG4D5wQwUZ+B/M9snQkQe0iA/S9R/9g/z/Lv6lDM4vKoNHHHJXd2ObUd9u
Hq62gnLy7AGCMc3NbeqZfuEWJNWjFJobKvleTbyTq7qDnPiDa09DSegmfXaiCbbP
typOnJWUmOJSQQNw3QdLi/RvbGAyXSeYaiWXB2Nsla1XPZw2pv3N7fhCDdDx74BC
3Hx0agVGh+eHo10NGnuZ
=uLb/
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--
