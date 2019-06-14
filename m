From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] memory: tegra: Fix -Wunused-const-variable
Date: Fri, 14 Jun 2019 18:02:34 +0200
Message-ID: <20190614160234.GB28409@ulmo>
References: <CAKwvOdn930hhHcnCA9arJ5=9SsT-6BfFC_1punmUZX2xWM-Hnw@mail.gmail.com>
 <20190613182610.238801-1-nhuck@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613182610.238801-1-nhuck@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Huckleberry <nhuck@google.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
List-Id: linux-tegra@vger.kernel.org


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 11:26:10AM -0700, Nathan Huckleberry wrote:
> Clang produces the following warning
>=20
> drivers/memory/tegra/tegra124.c:36:28: warning: unused variable
> 'tegra124_mc_emem_regs' [-Wunused-const-variable]
> static const unsigned long tegra124_mc_emem_regs[] =3D {
>                            ^
>=20
> The only usage of this variable is from within an ifdef.
> It seems logical to move the variable into the ifdef as well.
>=20
> Cc: clang-built-linux@googlegroups.com
> Link: https://github.com/ClangBuiltLinux/linux/issues/526
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---
> Changes from v1 -> v2:
> * Moved definition of tegra124_mc_emem_regs into existing ifdef
>  drivers/memory/tegra/tegra124.c | 44 ++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 22 deletions(-)

Applied, thanks.

Thierry

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0DxRoACgkQ3SOs138+
s6Hufw/9Ec9XB2EyJYZEW3fBZ6EdkkTZ89eyLwpbp/7Twoh20GQItlUGEJZFNAvK
enZi2pOoGHMFp5RDmGdpwwk11a4f4e6h4LYGAAko1vg3LOZ6PKSNixTe1AFJKBI3
0H/CLUARvTEeM8450C8VZnFDIb9Il8xByUY/d/hHYDgHsBFWLu8zTvBmsH23qVRZ
DfUbVsuPEWM2Q4kxq7unVx/RME1k6GJZw0wCWRy94q/sj6AjgBOCTPteoH5DSWF6
paGobJgw6AZQo2pjTUi7w159dvqN5SJwn59FMwEbiqtv0yVuEfb1KHSFIgp1AwSL
34U4MchsRD7EnMF9DDlFnva76qfXCME/oB5Kux+GZXqJjrCaIwlcEEmqSI10KWC8
hv9u1Ss2aBdWE9vZwD2ykoanyz3BLPeVquVqFz0RXS+tQ9D1pIr4E6INEsPzASM1
xAsp3E7eC+OdWsdOfkogWh/RlW3OFRIIXkBdqaXlgFzizpztruIvDTVnArDTXUbI
F6ckVy3BzhZnnWQQI6UxMzzSRqDXy9PyAxBg6ErroXTu6QjBQ3psREQ3KTICPMNW
ALMOMHJamxvapi6K1Ghcqty3m8wjoSXcMjB6D382lQ6ojHmxMzxQ2CjVAD2OmD9a
G3mdQpg8wk0jmxY3ZgYL/T/tz228kvs6HIEcFU9bvPt7Ir7QcnE=
=KQH8
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
