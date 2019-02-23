From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V5 2/2] i2c: tegra: remove multi-master support
Date: Sat, 23 Feb 2019 10:29:10 +0100
Message-ID: <20190223092910.GB1018@kunai>
References: <1550597332-21018-1-git-send-email-skomatineni@nvidia.com>
 <1550597332-21018-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550597332-21018-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 19, 2019 at 09:28:52AM -0800, Sowjanya Komatineni wrote:
> Multi-master support is defeatured on Tegra210 and Tegra186 due to
> known bugs.
>=20
> This patch removes multi-master support for Tegra210 and Tegra186
> I2C HW feature.
>=20
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied to for-next, thanks!


--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxxEmYACgkQFA3kzBSg
KbaIOhAAmsLQKzbadkaYmPRFyB+FZOq0KXzWJX2alnw3oiHivJ1MYMyJZo7Fhk0z
EVZ4Oyg34vimF2xYiawyA+iReCU9+7FaBHP9sJwXhgW9Om8cTqOLNfkNCcYs1+Zg
R2zXphMkIEFZHTCJWvm+F60xzICoXbrh9zNrOGMWnTkceso2/PhIJbn6SWnpLtxG
mwYpGIAkQBAPLG76XJWw1ilcRQb9a6FzqZg8+39TGuHoV/g0aXokOrdaQrOT985/
ln/w+Ms/db0Vyibxm2Kzkbw7d1JDcU+L+Oa3K+XJzRjKc58GMTMQm0PIcxJce0f6
/CP38qWx9pYWo3UPCiosjiP93F+wZS+niTeEOT5TZfVVBrFPa6zUqJLhjZTOtIr3
kpXiB+TVuiPWcNkirQB6+IszyU8PEji9PcdUwdodPTo52jeFI2hIxhOcivK/2WP/
8tdwZB6w+OcfTTpKt+evbQvbPXYZW8RG72xRO/WFYJ0ZgM6+3uVlWEfiy1olOLgL
9g0mukmFxm3uwE22gOCUH4qEO0c5FwLh4B8WnSJMYAcYovFGnHLzZYPvaut8asFx
ZJyqsPJdt2JT95bf86BtRkimvwtNT8Ra78wQT6vywAlK6LX9yxclJYszT4mVu96P
MzTLiKt4uMJ9LCBVdLuohhiezgBH2mgMEujc4dANbC0RIjw4Gpw=
=JSWo
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
