From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm: make psci_smp_available() depend on SMP + PSCI as
 the makefile does
Date: Tue, 6 Oct 2015 10:11:30 +0200
Message-ID: <20151006081130.GE18633@ulmo>
References: <1443820404-16431-1-git-send-email-sebastian@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443820404-16431-1-git-send-email-sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2015 at 11:13:24PM +0200, Sebastian Andrzej Siewior wrote:
> From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>=20
> with CONFIG_ARM_PSCI=3Dy, CONFIG_SMP=3Dn and CONFIG_ARCH_TEGRA_124_SOC=3D=
y I
> end up with:
>=20
> |arch/arm/mach-tegra/built-in.o: In function `tegra114_cpuidle_init':
> |arch/arm/mach-tegra/cpuidle-tegra114.c:93: undefined reference to `psci_=
smp_available'
> |Makefile:927: recipe for target 'vmlinux' failed
>=20
> during build testing.
>=20
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> ---
>  arch/arm/include/asm/psci.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Jan Kiszka sent out an equivalent patch back in May, but it seems like
discussion stalled on that. He resent a few days ago:

	http://patchwork.ozlabs.org/patch/521597/

Let me see if I can get the original discussion resumed. I'll add you in
the loop.

Thierry

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWE4IxAAoJEN0jrNd/PrOhWF4QAL1dQOm3qL6srinGmouzkBMJ
4m1UJWS7FGYJPiaXZ99O7UqcPIEC7Pu3/QbmJUKSGwSUm+Vok0ticGDlFkiL9vfn
3QHd6OqiTqDqdrdciS/N9WNAP+9quykcfvwASmRcGvmYXDLKYfhv5nlc+H9s5kZv
EXbo8JJZOQopsel7mMFc09hKVky6ShMJqNQ9qNjSngN5yDxYCsqB6bkZ/6nTik56
ODvK4VvxhPOgm7YVEmCSgSHuHCKoJTp9INtky6tN4T/XR6JNQd3hYs21mZoMKJHA
nafGh76dM/8cztUPdwgWhQ7gZRMNt8TRLUJxZruVdtJnxG9eSCbJBrWMA65uCqt3
JGEKGlTrzVq2PmnLA6t+GJa+8aU1EfutabuUy59xgLIsgTNNfPuwQuxqDRCPPvZn
T3axIgWtTHYFLCIfniiwdmZcjolyyPDhjEPY/xRTXCZD1tBOXzi0LgRsrmMV/FQI
IBVfPIJXHUDLFqyecqkcSeavHQNzJfs/Fq6hEEGblZKiZ3LA+5DY82bwEPOca27s
FDcq8vVtvYCx9J3XxF/IBS7O0UE1UsYJBgavGuRxs+mgjJ8Jb6POdkosiKWaZ+LV
wb8ZIdC8UrND+kmmBotrQXEy9SUCGpWVeUBCl92lSE5AnBTrCxiONaOGCSQW83yI
7U5E+lJlGRb2KzQRbcJG
=y2la
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--
