From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: Availability of psci_smp_available depends
 on CONFIG_SMP
Date: Tue, 6 Oct 2015 10:11:24 +0200
Message-ID: <20151006081122.GA21527@ulmo.nvidia.com>
References: <cover.1442990383.git.jan.kiszka@siemens.com>
 <8b94f7869972d64f442f97208707a5856cbc8b14.1442990383.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8b94f7869972d64f442f97208707a5856cbc8b14.1442990383.git.jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 08:39:43AM +0200, Jan Kiszka wrote:
> Ensure that we can use psci_smp_available without checking for
> CONFIG_SMP first.
>=20
> Signed-off-by: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/include/asm/psci.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/include/asm/psci.h b/arch/arm/include/asm/psci.h
> index 68ee3ce..ff956f4 100644
> --- a/arch/arm/include/asm/psci.h
> +++ b/arch/arm/include/asm/psci.h
> @@ -16,7 +16,7 @@
> =20
>  extern struct smp_operations psci_smp_ops;
> =20
> -#ifdef CONFIG_ARM_PSCI
> +#if defined(CONFIG_ARM_PSCI) && defined(CONFIG_SMP)
>  bool psci_smp_available(void);
>  #else
>  static inline bool psci_smp_available(void) { return false; }

Hi Will,

you had questions about this when this was first submitted back in
May[0], but discussion stalled. Can you take another look, please?

I think irrespective of what the series is trying to do this is a
correct fix. The arch/arm/kernel/psci_smp.c file is only compiled if
both ARM_PSCI and SMP are selected. Builds break if we don't mirror
that conditional in the header because for ARM_PSCI && !SMP no dummy
will be defined, but the implementation for the prototype won't be
available either, leading to a linker error.

Also Cc'ing Sebastian who sent this same patch yesterday.

[0]: http://patchwork.ozlabs.org/patch/469878/

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWE4InAAoJEN0jrNd/PrOh/skP/2bhiT/Oz0majKjHjaJts8qB
Rtve5rjuf6ALYPka6WID1wv8sReorJSvpHyqHhWhXey8Til3IdQKzKIOv4yaT2jm
OGPhcVZq6ZsPubjFJXhLbm6/CVpTylrbukm6n5rAoy/5wjgI+jVITGIsDTfvx23T
gcHDUWgPZ3hixuB94LwHXJ8oe1NjPXFuInKR45JhH5vFR6IxTcVA5RYkHcggbuBK
XYV+vEnusolHDOuaPXYaxgRe/D/KgaLfJ2Ti2ewPQO+ExQhtGhAyP935HQG5Pb1S
xKBG6k83e/aNBoQL7lze2oPtB20HD1GNfjMPOHNug1yVIbeGcGW64HHXZA/5A68q
Wo49Kgn8QalMaN9GioU4EhMAbYodmqaq6oDssM6GHc/PSRLWWlS51OU5xZWPX9Jq
YSdvHFnvtFPjonZtMEVRngvRwmoWpRnx/XBd6VXerzYtCqZw5YQ71KYYcuL24J7y
Nkx78yHYOtx7gxDUIdZmROLSjN0vI/Ud0TPJenzscMllcWjvyBaWuJz8XGNdJsaL
9BZjcVXegidd8hN6FOCLxDUcBXofFPLR5n86tDQblgL0xBYhJOwreZHbwSnXiNGe
rINmH5oadNCEYw1vIUrA+pGNrBt19JwievohjaYYtSKPddaqtagF67Lda5Ayy7Kl
56lPiS26JvxyXf04HGlQ
=I1Cj
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
