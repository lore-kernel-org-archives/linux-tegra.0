From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: tegra: Allow the PMIC RTC to wakeup Jetson
 Xavier
Date: Thu, 7 May 2020 21:28:42 +0200
Message-ID: <20200507192842.GC2905961@ulmo>
References: <20200507101349.14118-1-jonathanh@nvidia.com>
 <20200507101349.14118-2-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200507101349.14118-2-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2020 at 11:13:49AM +0100, Jon Hunter wrote:
> The PMIC RTC is currently unable to wakeup Tegra194 on the Jetson Xavier
> platform because the interrupt from the PMIC is not usin the PMC as the
> interrupt parent but the GIC directly. Update the PMIC interrupt to use
> the PMC as the interrupt parent so that the PMIC RTC alarms can wakeup
> the device.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to for-5.8/arm64/dt, thanks.

Thierry

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl60YWoACgkQ3SOs138+
s6Es6Q/9GhLRZmmpHOOix7FO7Ml59oyn6mmUcJPdwHFvtdwZJVJOVpolMMJXMF5L
wM9ud7s7j3ZkkCTnhJ4As3NQpN4xGbZn/phlPb5vfRcDh909rira2/yK0u0io0ks
EQt8gMTFmWzU8XTZwqdQE8q2udZ6oyQUnfLJXP2i9U4oUBhb3PZCr3zmFkxNKsSD
8mrWrvF3Pk24DubhN8ibYQ/b/S2ryRNcsZc04Ho4ACobDWh+atBko88VArys0AU6
hC5oEI8Bc0H7j0/WzVZxXuTKzRRy74jpBEMdsBd+9MutN35Iqj+GvLN4wQ4XU1K9
3RDm+MyvwgPqp8qHI/p47cgR7pFDtnYAH6Rele7Dac3sjbvYmgoKGszk//3QEWoI
Ol8ezNxMlLPTy7l5pQ4U93Ne3jZG+8VmyrxkwKFhWAQey4Ap/BOa8djA5k7Nb61K
CInSBsr61cwg56Dej/U339nNvOOuQvUShB6RmfK82OiFGB5D3qt/2Io2yW50bspv
YMpEpBixSXZMlpJXFL7KqznA6eg+6J+X4pzRTf+Og9Btxx/kOeWI/1fJ7GK6oKzC
WqnWqc7jQy5w4WDDOwiEgmt88FCkNVseiqRnVsK84yR84qY5M6ITBwpWzZxzJwc+
5mOjCJto8QdmzdMTgbesAw+KnyV/ehS8skr3YDhYHAERCBAH6/Y=
=OnkZ
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
