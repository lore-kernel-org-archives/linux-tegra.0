From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Availability of psci_smp_available depends on
 CONFIG_SMP
Date: Fri, 8 May 2015 13:26:17 +0200
Message-ID: <20150508112615.GE32221@ulmo.nvidia.com>
References: <cover.1431064527.git.jan.kiszka@siemens.com>
 <0f0a77ddee48027efa35f36d6c809d2d3ff91ce1.1431064527.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oPmsXEqKQNHCSXW7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0f0a77ddee48027efa35f36d6c809d2d3ff91ce1.1431064527.git.jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--oPmsXEqKQNHCSXW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2015 at 07:55:26AM +0200, Jan Kiszka wrote:
> Ensure that we can use psci_smp_available without checking for
> CONFIG_SMP first.
>=20
> Signed-off-by: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/include/asm/psci.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/include/asm/psci.h b/arch/arm/include/asm/psci.h
> index c25ef3e..eef6a0a 100644
> --- a/arch/arm/include/asm/psci.h
> +++ b/arch/arm/include/asm/psci.h
> @@ -39,9 +39,13 @@ extern struct smp_operations psci_smp_ops;
> =20
>  #ifdef CONFIG_ARM_PSCI
>  int psci_init(void);
> -bool psci_smp_available(void);
>  #else
>  static inline int psci_init(void) { return 0; }
> +#endif
> +
> +#if defined(CONFIG_ARM_PSCI) && defined(CONFIG_SMP)
> +bool psci_smp_available(void);
> +#else
>  static inline bool psci_smp_available(void) { return false; }
>  #endif
> =20

Looks good to me.

Russell, would you be willing to ack this patch so that I can take it
through the Tegra tree along with patch 2/2 that depends on this?

Thierry

--oPmsXEqKQNHCSXW7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVTJ1UAAoJEN0jrNd/PrOhoggQAJ3/pPKn/Nq3j/hAG7piD1o4
tmdBM2OZDd8ugduGRiqy8PHYTCQAZ6d4cVF0tMRDKlahdlGt1LQB2bZrG2akglF7
8ED5MOKqoT5dmG818F9Q3xOKvcZZp7QmHHSdUFs9vuzYjR5+hRGKPpUUG+wNcvPX
+bwVyfXTzlB8v80z4ZMG8jQgUkitq6RZJ+TRZvCUCMGmX+GyDI6YxtJiRXWMapgW
kmfvBooM/m+hs/dkzLi/ncmdSZoMU3RULWOCU6srkBR8dSYdV+xZQD6zO03ATM8E
FA1a8RGNL4pvm63lq8XES5YoTlSFFX9nst1VWCT1F2yX7NK7VN8ZN8C2DHU6oTY7
3DRzBL+DQ954A1XN6kiDV1mIJ3uHTv+OSBYhtceqFqntmr+EANMNd7hEIq8NKtAi
R6ZT2rSiEEXU50iip4ErjP1lHI5xzjbvZ0uQaFrFytjFRCPHiaa0o68zE23y62eh
deQ1ydWm5sVD8DAVh74S+i7Z94ugru7QMMCvSnhLx9ia/t7G4g4zFrwY3+bDV2x1
CtUV/tJVZYyNk8mh5sogiwPTJMXdPy/AHZAhGKon8fMeDGqPs7IxSlJ0Ccw6mVQ7
dyDOa4a2R8jybJh6saUf1q5EIWe0d1pcS6BkAUnJGa3j7AiQxgxRAIX2PLyMohjw
iR97Qbm9sCj1ISAMlaMu
=f3yr
-----END PGP SIGNATURE-----

--oPmsXEqKQNHCSXW7--
