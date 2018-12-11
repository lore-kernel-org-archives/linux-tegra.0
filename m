From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: i2c-tegra: replace spin_lock_irqsave with spin_lock
 in ISR
Date: Tue, 11 Dec 2018 20:38:55 +0100
Message-ID: <20181211193855.ftzvyz6ilrzujywv@ninjato>
References: <20180911145446.53621-1-hangdianqj@163.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cywaxr3kdeeyjeyn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180911145446.53621-1-hangdianqj@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jun qian <hangdianqj@163.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--cywaxr3kdeeyjeyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2018 at 07:54:46AM -0700, jun qian wrote:
> As you are already in ISR, it is unnecessary to call spin_lock_irqsave.
>=20
> Signed-off-by: jun qian <hangdianqj@163.com>

Applied to for-next, thanks!


--cywaxr3kdeeyjeyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwQEk8ACgkQFA3kzBSg
KbYqTBAAkZx0GrhtB1+bO2FIxI5bhr05iDZBwcXCFEF0Qv3XEXHaXT1TLHJ865IB
1bjhnnLLHzA+79gddaaHais5xsDL2AB93rz8pL6GZOVaDCB2qxJ0TK8zE489NzxD
cOX2Q3dFEVE6FqKdbawnmt/IAHyoc9m0b8sNHM19Sea1GjaRL12Frg/tGzMFLA5K
fS5NwXL5c0sPgVYZdCRppz1D9pak0mhABF1ORb+hYQf8Udfii0V+7+d3TNwrdTjB
GbNcEGQiAHT+YoDGPjw4f8ISTGDOXZyK+BKPnapHWHtQca2XD01VEX0N/UbENaAV
cru4opSBacYJBKHU4+qVp1cWbn6TK+8s2E7+Vfor4/oheMPWQKaJ995uvEkLF1Ne
z7Zve83DbWuY+HsNgHKkUFbAsR26bA/yNjmZM+rhtt2Gxy4itkQTKE/jc7DYcC7/
3Tk3oHIprp1Q5FYP48GAw/tWyu4hpaSn3NEXkGhWeK2PpatWlgx6sD68EXEFT1Gi
JrQBaRlqBjW6gGq9QFx4d+9xzbuIxdC/PwhDkM4HL2U2PFBztyBdbHi7KrkYfPYB
g6NSLmZksjTiugR0DogD3ScsjMHQsgmopreYOpVvTEDNnPXcKrwSZw03vdPGX8WT
tn8yLS2JnhrH+VN+gILR6uo6r4lbsH1d3NhXdcY1VJgxJRNzrK8=
=8JzN
-----END PGP SIGNATURE-----

--cywaxr3kdeeyjeyn--
