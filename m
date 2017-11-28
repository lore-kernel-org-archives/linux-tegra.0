From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: ARM: tegra: Select appropriate DMA options for LPAE
Date: Tue, 28 Nov 2017 15:30:56 +0100
Message-ID: <1511879456.769.12.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-S/Od8qx0fuBNsCN94I10"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--=-S/Od8qx0fuBNsCN94I10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would like to request that the patch with subject:
ARM: tegra: Select appropriate DMA options for LPAE
and git commit id 6aa26c5d66595494e810c791602d87a572c78808
be applied to the stable branches for kernel versions v4.12 and v4.13.

This patch selects the right size for dma_addr_t, that is required for
the tegra archiecture and may cause build errors when not set, such as
reported on the linux-tegra mailing list.

Cheers,

--=20
Paul Kocialkowski, developer of free digital technology and hardware
support

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-S/Od8qx0fuBNsCN94I10
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlodcyAACgkQhP3B6o/u
lQySlQ/7BYOUKNV/kqbAt/1dx5iMyyx1qlFcbBICeOWto4cK6wSlAY2xQzRaMoaR
tlhenRlFlxe64o6DHwCpXXiRR4q8wZXsfsepGU8QxAS2WTibHmiRb6DRnWWi3cCZ
OeKDnmJ0X4ihdp2sRz4qDuEHEqmbvm6jFeB2dgl/NelbwcPEjJzKnPG3Q35wp3/K
1zBkPrlHMKVxFmaczJPeSCsKoxD1frbsobeWRMQbndFQuZ7+pvmFyo3+2PoEws6z
2V8dIUuEB3aNC3qzpt0NMF5wBSUklNsEzBmtvBeM3LLfkC6h1Vwccb00IPIuGAmM
O28U2x6pB3qHBjrNrlIcIeWevNBNzXkNl14EcEhA/ldGFA59RpMy1jEfM+hmRCYN
wt1SDOleH2ez/zWIWANicFao1in/UZlI2972DF6XwLxi7aPsMM1skEQ7whdlS1/c
xF9M5fYA9bLVLhtz3LxsS2Ffd/XiPQ0j2hkn100UaAwqH/8BrmwJb7Z8ipCVe/oi
XzfQcT1WoXBxD5lkkg62zL8bbhJIc28EekSf/Q+WdRoj4gDD+CdAa+jU6tqNTMLV
CA1xZWJgi3nQuPjPzI5orC2cfTKqun/0P7SHMcPtvQBiJfQOtdNjg8b9jKCbbshs
ruBThgpIzqvu6W/ALcV7TbT4ZVvVXd1/VpufLrXMzdGeW67aQ8Q=
=gy2I
-----END PGP SIGNATURE-----

--=-S/Od8qx0fuBNsCN94I10--
