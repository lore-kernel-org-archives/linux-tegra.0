From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4.14 00/25] 4.14.136-stable review
Date: Fri, 2 Aug 2019 15:59:13 +0200
Message-ID: <20190802135913.GA10544@ulmo>
References: <20190802092058.428079740@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190802092058.428079740@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 11:39:32AM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.14.136 release.
> There are 25 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>=20
> Responses should be made by Sun 04 Aug 2019 09:19:34 AM UTC.
> Anything received after that time might be too late.
>=20
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.13=
6-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git=
 linux-4.14.y
> and the diffstat can be found below.
>=20
> thanks,
>=20
> greg k-h

All tests passing for Tegra...

Test results for stable-v4.14:
    8 builds:   8 pass, 0 fail
    16 boots:   16 pass, 0 fail
    24 tests:   24 pass, 0 fail

Linux version:  4.14.136-rc1-g0931704b8bef
Boards tested:  tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Thierry

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1EQa4ACgkQ3SOs138+
s6FqaQ//QwDVemUgZZZSPpH1Mx6S6gLbCNUpIcskAuNt1bzH+Dj4qc5fRtt1F1nC
Oc7BRPDXLcTp+zpjAi0OU4igDk3dZ4d/H2m63d7DAxPfLA22gFiGGK3u4SeL44dj
MVlaJz0SygZHrVP/N6+6BB6GXVz30O3GoO/dKlRaXJZZLSPowjyvlzHpf6oJFb85
mWzz8LdeQRstd64Zhw0D7RsqQ3V7AaKVeqHCY9MdFqtrgF/yE/FbwXHzGTZzuowo
tpjJJuddOHyVlU4H7fHKZFrOgmt8S8rsrwDiTi6n4q6LwG0ucz1JTR4NIFdN9jHQ
l6cEifZthZPMM0YZukW+RKTk5jxRtBQJApePyMNmCxXyKCoPLjAei/ROjt6Z95nH
E3Ds5BJqZFPshVm9A2Z2L9Y3BiH+c1rm4qVwB5OQmv6UsXT3ZPSIyBbqByWje5uL
LIsduGQ/9BH3EZixQmBkv/khYdJZEqdP4P8Zhn9AGFNfcWozp0I8Mq3pzRJ4fUMN
Bh1wkhi1G56/Oip8fIhGbXO0PqzMC8cD1bty2lyz2tfUt02ZzZp693TgUg4C53lm
9iiqABQHmuSWY0Can0/w6bsyMI0OnUc9Zqi8MnOx2wzONJtIINTQWKkEO19p6QLm
qXvEaL30VMeeYQ/ohkvdIVlj25zbIDycIpuGGwhgbLOGxq/xr6M=
=Hxi+
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
