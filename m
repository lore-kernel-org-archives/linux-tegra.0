From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc: tegra: pmc: restrict compilation of suspend-related
 support to ARM
Date: Wed, 7 Jan 2015 15:33:57 +0100
Message-ID: <20150107143354.GD1621@ulmo>
References: <alpine.DEB.2.02.1412092224050.31750@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1412092224050.31750-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2014 at 10:36:50PM +0000, Paul Walmsley wrote:
>=20
> Tegra SoCs with 64-bit ARM support don't currently support deep CPU
> low-power states in mainline Linux.  When this support is added in the
> future, it will probably look rather different from the existing
> 32-bit ARM support, since the ARM64 maintainers' strong preference is
> to use PSCI to implement it.
>=20
> So, for the time being, prevent the CPU suspend-related code and data
> in the Tegra PMC driver from compiling on ARM64.
>=20
> Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Applies on next-20141209.
> Intended for v3.20.
> Boot-tested on Tegra124 Jetson TK1 on next-20141209.
> Also boot-tested on Tegra132 Norrin FFD on next-20141209 + some unrelated=
=20
> patches.
>=20
>  drivers/soc/tegra/pmc.c | 7 +++++--
>  include/soc/tegra/pm.h  | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)

On second thought, I decided to apply this as-is.

Thanks,
Thierry

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUrUPSAAoJEN0jrNd/PrOhplYQAKG6ilQmepYnpQtlvejJX9F2
hBc/c+QAf9xGU8QZIYKMPG2IrjrLjYI7BxoE1vbYfsJs14v/xcT52YNIqmvKa236
OXk6a784FLRn/BuSgr0TIrEEHAFCv1UpQPKHYRA3ZmTtTWAgPyE3kA4zN3/v4VQ6
HhrJ3DKyK9H7tYBUqMolRFUSVcTRNRMsF/jR9qY0VP808R9XcSVEeZadZnabmZET
amfsWWrX4njtjjtGiIU3wB/Td/JXc8xHCZgNdovkQdZfXYyeNBnOt7lDCo47GXoY
XbVd44Ei0C450x/yYGnt3B15UjQtPPpeD5lEOsBYKIO87lLXq1qcUI544Dhh7mpI
3kDoDOw0ETbvHmsvzQLZ5nZpz3X60DJ39qtAsxrpkOn6+QeZKvElPssknJV0NQQl
0JUFERpEFTXHtn/he2xKYrUqBVnTHIcAr8/mWjIge3EG+k0oCObxiI0ShQjpWkCQ
1y5hU+kcKNLA5cP4NfqUxNjR7bFcCEqDunsCSo7bkx4a+JdFWU625TWiL4isVJLr
My6nAA7fW+7sEQVc8rqYVERNmGRtXcfFQfAa3aQFN977P/b+ERzQaoo+TII4GznU
UJ3rNur4nYMPzA+QTxZVQFkYgn9NmLhbAusiKKU6aBhhPbzD4eWbH8q/waTdpKjH
JpluUi6xHl95E6bgFEw/
=degI
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--
