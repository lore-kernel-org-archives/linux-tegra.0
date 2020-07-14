From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] memory: tegra: Fix KCONFIG variables for Tegra186 and
 Tegra194
Date: Tue, 14 Jul 2020 17:55:04 +0200
Message-ID: <20200714155504.GD251696@ulmo>
References: <20200712103347.25070-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UoPmpPX/dBe4BELn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200712103347.25070-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2020 at 11:33:47AM +0100, Jon Hunter wrote:
> Commit a127e690b051 ("memory: tegra: Add support for the Tegra194 memory
> controller") and commit 4e04b88633ae ("memory: tegra: Only include
> support for enabled SoCs") incorrectly added the KCONFIG variables
> CONFIG_ARCH_TEGRA186_SOC and CONFIG_ARCH_TEGRA194_SOC to the Tegra EMC
> driver. These KCONFIG variables do not exist and prevent the EMC driver
> from being probed on Tegra186 and Tegra194. These KCONFIG variable
> names are simply missing one underscore and so fix this by adding the
> necessary underscore to the variable names.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/memory/tegra/tegra186-emc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I wonder why we didn't catch that earlier. I assume the EMC frequency
scaling tests just don't run on these SoC generations with existing
kernels, then?

Oddly enough, I also vaguely recall testing EMC frequency scaling on
both SoC generations, so I wonder where things went wrong. Anyway, this
is obviously correct, so I've applied it.

Thanks,
Thierry

--UoPmpPX/dBe4BELn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8N1VgACgkQ3SOs138+
s6GlNA//cJqrRg8Z7Nf0bX2HQ4lHFQVIg2gstpGGVwOX6SaCxKJEwhfYQdcVOwLf
hs1ivuVVebF8328vVisijcbVhIokpCQZMrk3EMO+fZ6k2RltAc5UbgcAid4lg5gR
D/YtTdSM0RPWAo7CCg3QlcGAsh3W3VfjD44e0N3TsFBk53rhdyxhIvw86ju7wJ//
+6YfWmwlrxj/03MwWGqnUvhDo3r2v4kn5VB/gosBKs0o22K/Tp121T27fsAq0vzu
b6a7sFppMStCMKgRwZM4sU00VMVW0Y4AI5+dXoTeDcYCCEHzG6n5Lq+/J3M7kR1u
I40Zd8KoNGGM4TsokS5dOX6zOmR1gDCc9FyJOf+18MmbAMks4MD/rF1sDxbi7oB0
8N0v3WuPJ2ZUqM3QCPW4cp/wnTZ88EIAaAXSPRhpaTB/sbbyBJlA1yKxbKa45NFb
ubRr4mEJiCi9acjeprk81Kvn8lg7xDsI30X9kOWzmRzpgLTzY4HGc2nDM2q5zUmZ
6SxNgWEeMuT7coJeTMwAa7Fm5MjVa84Gl7S3e+a5W3/kRfH2f8nO26UGo6SYOErx
9ZBtVmcz0WUds5kn7uFEBeFR3CKfE3Y7yTzjM2WHV6RBQNuB4GwqFnjzCDN5GFjH
FxWzdcusbdpNBSduost384bmk3i63Zcp/tcZRFgWcG4CCIUf110=
=HX7y
-----END PGP SIGNATURE-----

--UoPmpPX/dBe4BELn--
