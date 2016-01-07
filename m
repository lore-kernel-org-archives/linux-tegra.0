From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: next boot: 564 boots: 59 failed, 448 passed with 57 offline
 (next-20160107)
Date: Thu, 7 Jan 2016 15:59:58 +0000
Message-ID: <20160107155958.GG6588@sirena.org.uk>
References: <568e8740.01941c0a.31072.ffffb67b@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gJgGjUUWrnN4mpen"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <568e8740.01941c0a.31072.ffffb67b-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--gJgGjUUWrnN4mpen
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2016 at 07:41:52AM -0800, kernelci.org bot wrote:

> Tree: next
> Branch: local/master
> Git Describe: next-20160107
> Git Commit: 0f023a298a7d2a8e99c54913f7277b3c08c1f5c9
> Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> Tested: 95 unique boards, 25 SoC families, 28 builds out of 135
>=20
> Boot Failures Detected: https://kernelci.org/boot/?next-20160107&fail

For the past couple of days -next has been failing to boot on various
Tegra platforms, there are failures involving either no kernel output or
(with tegra_defconfig) backtraces during CMA allocation from USB, for
example:

   http://storage.kernelci.org/next/next-20160107/arm-tegra_defconfig/lab-k=
hilman/boot-tegra30-beaver.html

>     multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy:
>         tegra124-jetson-tk1: 2 failed labs
>         tegra30-beaver: 1 failed lab
>=20
>     tegra_defconfig:
>         tegra124-jetson-tk1: 2 failed labs
>         tegra124-jetson-tk1_rootfs:nfs: 1 failed lab
>         tegra124-nyan-big: 1 failed lab
>         tegra30-beaver: 1 failed lab
>=20
>     multi_v7_defconfig+CONFIG_ARM_LPAE=3Dy:
>         tegra124-jetson-tk1: 1 failed lab
>         tegra124-nyan-big: 1 failed lab
>=20
>     multi_v7_defconfig:
>         tegra124-jetson-tk1: 2 failed labs
>         tegra30-beaver: 1 failed lab
>=20
>     multi_v7_defconfig+CONFIG_LKDTM=3Dy:
>         tegra124-jetson-tk1: 2 failed labs
>         tegra30-beaver: 1 failed lab
>=20
>     multi_v7_defconfig+CONFIG_PROVE_LOCKING=3Dy:
>         tegra124-jetson-tk1: 2 failed labs
>         tegra30-beaver: 1 failed lab

I did bisects yesterday but they were a bit inconclusive, showing a
series of skipped commits in the TTY tree as being the culprits:

afd7f88f157796e586fc99d62da13a54024e0731 serial: 8250: move of_serial code =
to 8250 directory
4e33870b3bb691996354a8f9e8f69458b4fc34d9 serial: of: CONFIG_SERIAL_8250 is =
always set
d1b5c87fa8058a3f477ae05555916dd1cea934ad serial: remove NWP serial support

which seems more than a little surprising and like they might be false
positives, especially in the cases that do produce output.  The errors
today look the same.  I've not investigated further than the bisects.

Full bisect logs:

 https://ci.linaro.org/view/people/job/tbaker-boot-bisect-bot/140/console
 https://ci.linaro.org/view/people/job/tbaker-boot-bisect-bot/141/console

--gJgGjUUWrnN4mpen
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWjot9AAoJECTWi3JdVIfQyOEH/3USwh31OlnFOs2zke+2vTDd
DNjDpqZ/yoIQk3LL4u4BC+vVqkSzU+FI/SV4AVm6APoWj89fW7rCP7uJkxBsFdYY
UKxVGJLLlvErnSXUQ1KSjYUV3nEnEgkM9NuWk8Nv1q3WgxHMGY48Dr2kA4+BglL5
7m0bLzYTKpZ0PjeHdTnkW8Opw9aF91zMD5s+jFBA7IfqfBQ+lmbYQ7OPN/TVsVN8
vL+6nOlyqb6jGQKmXXd+vWwA1ROcfJgd+YSbC5rdmK6jPQ5A5COjO1eKipITFRYS
GrL+Gr+mtgrIEgRV1Ub2xRxPegCicaTPR8iW/cAXYIwP+6mObTWAvELYmudtWjM=
=r8D4
-----END PGP SIGNATURE-----

--gJgGjUUWrnN4mpen--
