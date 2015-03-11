From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: l2c: Maintain CPU endianness for early resume
 function
Date: Wed, 11 Mar 2015 11:18:46 +0100
Message-ID: <20150311101845.GL19577@ulmo.nvidia.com>
References: <1421757420-20983-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aYrjF+tKt+ApYAdb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421757420-20983-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--aYrjF+tKt+ApYAdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2015 at 03:36:55PM +0300, Dmitry Osipenko wrote:
> In big endian CPU mode l2x0_saved_regs structure stores registers values =
in BE
> format. In order to maintain BE CPU mode, these values and immediate cons=
tants
> must be converted back to LE format before writing them to cache controll=
er.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mm/l2c-l2x0-resume.S | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Hi Russell,

Did you get a chance yet to review this patch? It's a dependency for
enabling big-endian support on Tegra. As such, I wonder if you would be
willing to ack it, so that I can take it through the Tegra tree along
with the rest of the patches.

If you prefer to take it through the ARM tree, that's fine, too. In that
case would you be able to provide a stable branch that I can merge into
the Tegra tree to resolve the dependency?

Thanks,
Thierry

> diff --git a/arch/arm/mm/l2c-l2x0-resume.S b/arch/arm/mm/l2c-l2x0-resume.S
> index fda415e..9f99c7e 100644
> --- a/arch/arm/mm/l2c-l2x0-resume.S
> +++ b/arch/arm/mm/l2c-l2x0-resume.S
> @@ -30,6 +30,15 @@ ENTRY(l2c310_early_resume)
>  	teq	r1, #0
>  	reteq	lr
> =20
> +	@ Reverse for big endian kernel
> +ARM_BE8(rev	r2, r2)
> +ARM_BE8(rev	r3, r3)
> +ARM_BE8(rev	r4, r4)
> +ARM_BE8(rev	r5, r5)
> +ARM_BE8(rev	r6, r6)
> +ARM_BE8(rev	r7, r7)
> +ARM_BE8(rev	r8, r8)
> +
>  	@ The prefetch and power control registers are revision dependent
>  	@ and can be written whether or not the L2 cache is enabled
>  	ldr	r0, [r1, #L2X0_CACHE_ID]
> @@ -51,6 +60,7 @@ ENTRY(l2c310_early_resume)
> =20
>  	str	r2, [r1, #L2X0_AUX_CTRL]
>  	mov	r9, #L2X0_CTRL_EN
> +ARM_BE8(rev	r9, r9)
>  	str	r9, [r1, #L2X0_CTRL]
>  	ret	lr
>  ENDPROC(l2c310_early_resume)
> --=20
> 2.2.1
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--aYrjF+tKt+ApYAdb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVABaCAAoJEN0jrNd/PrOhhy0P/Av+S92K9/XWzxwFqQr+o0Fa
ZLKbK00GNhXQneXX17oQIg6DAxgIN4YAT0SalCOKsZc/U3bfEa3vBJdNlk6IGS+K
jwuQpmd2dlXMMYMn/vqN+bpcGRgHzrvxKGIE8g7A2W3AgeamqoNvozcbCa81IutE
yW52TTAh9wQwE+bcnxkofjMojcQi4lZD/mdglijPvNTFcDjubUy2bpDUzctc/zDr
gpR3ThrwPajNV2qU0Hhi52xMDBV9JknGobH6XawRb9ZLiT8oC7GV1AyC8S3xANbN
LQSD2nPMGjlxFqmEgGE9awXH12I3bnzTl6TRXXGJ5HvqhhlgY83FmoQ9PbS+OMBI
lUraqU2CcO9nC8q1Hv/ysofAGK93qt/rPbiFiEVUrcxxx3fvZFOapST79GRQqeGz
EztQNNDZ5zcw3/jTkCaHe4VI3YNEPy/dnyz+x763JNZH5OkUPEFjit0fyGGZPpAG
KCoecb9hHZFxPMCFUmNNcWGLvd+fMHP6DRMnFUbyjUqCPQwkZfEynqjsb1Lusk91
7Ky3TvcAX5KF8Cc0NsuEYP9+18m/R+cGXjxD8tFPIyw0b7fJSTTfBjR+tO2nszmU
7Yn9nasInINp7DYjhntuiWbAJ9wrdHgmJUXcxPNKv7K0EeRo7LjVXRdw6xWm1ebz
UcTFF8IQD/p25bBe3iYz
=aho6
-----END PGP SIGNATURE-----

--aYrjF+tKt+ApYAdb--
