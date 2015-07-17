From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: tegra: enable Nouveau for Jetson TK1 and Venice
 2
Date: Fri, 17 Jul 2015 10:03:14 +0200
Message-ID: <20150717080313.GA3057@ulmo>
References: <1435742028-8237-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1435742028-8237-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2015 at 06:13:44PM +0900, Alexandre Courbot wrote:
> With all essential kernel driver and user-space patches merged, GK20A can=
 now
> be enabled safely on Tegra124 devices. This series makes small device tree
> and configuration adjustments to allow this.
>=20
> It leaves the GK20A nodes ready to be used, but still disabled. Enabling =
the
> nodes is the work of the bootloader, after it has configured VPR properly.
>=20
> U-boot patches that do this are in the work. In the meantime, it is safe =
to
> merge this kernel support.
>=20
> Alexandre Courbot (3):
>   ARM: tegra: Add IOMMU node to GK20A
>   ARM: tegra: jetson-tk1: Add GK20A GPU DT node
>   ARM: tegra: Enable Nouveau in defconfig
>=20
> Thierry Reding (1):
>   ARM: tegra: venice2: Add GK20A GPU DT node
>=20
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 10 +++++++++-
>  arch/arm/boot/dts/tegra124-venice2.dts    | 10 +++++++++-
>  arch/arm/boot/dts/tegra124.dtsi           |  3 +++
>  arch/arm/configs/tegra_defconfig          |  3 +++
>  4 files changed, 24 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVqLa4AAoJEN0jrNd/PrOh1VgP/30rM6IHhwt7K9iD/hsfsKKm
kE63l3ha6D6QLXdjP4S2edWDbTSXz8/byl0Z/dglOoOaCAoQkZZ+76jcCGkaYzqO
g8lJuC2NM4y/BEPArmMDrG6RHEoVFnI0qWCoKtxC3DIn5JNh0Vs5339Cvw9SEyuN
Hgzr8M0pV6bsIQOKs7Zf3j/bHSM0QcAfirnNT2txJO7a2k1Bk1jNYK/8JeMvTchP
Ni8tesVnqKTlUZLaL+Xzr0eUkrNP3FGXLN/GzD4Vjfysoc9Wt3scgx5VAJgJl2Io
SITCxtaHvWo61grSEsKDTo4RNVfhhT/uqaR8LmRW5G00rgXseVfQHnplKPbCvpm7
RiUG1ofvLlvrn7H/RqtxulpjnrTpyDhog1s8YIHqPGacDPazjpH7zIcxbhLpKXl5
d7i4RVK5aSXRfsJugX3v3YW/hspFBScebxFggcC0TCrvxRaNf0rw9COnCByzy5t8
UajfVRwJj7SVx3AloXOOvu3+iWmy2G7SBxL0PffBHRaCI//qo/tqkajEQIAiFQt6
u9L3UtUA/bXX/91JHxxyOpah19KiVwvTLy0XUsW6pqxnegGoPOpLSufRBxMAiZ7r
S9+fJz763nAmMFyuKL2EXuqzr826Mrcc0YEEWQSLFA+QFtpWgSkRwaYButYqyKNC
fislBGaRZE3BGYWwux1i
=sPLa
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
