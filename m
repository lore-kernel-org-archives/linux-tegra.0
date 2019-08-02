From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4.9 000/223] 4.9.187-stable review
Date: Fri, 2 Aug 2019 16:19:04 +0200
Message-ID: <20190802141904.GA11962@ulmo>
References: <20190802092238.692035242@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190802092238.692035242@linuxfoundation.org>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 11:33:45AM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.9.187 release.
> There are 223 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>=20
> Responses should be made by Sun 04 Aug 2019 09:19:34 AM UTC.
> Anything received after that time might be too late.
>=20
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.9.187=
-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git=
 linux-4.9.y
> and the diffstat can be found below.
>=20
> thanks,
>=20
> greg k-h

All tests passing for Tegra...

Test results for stable-v4.9:
    8 builds:   8 pass, 0 fail
    16 boots:   16 pass, 0 fail
    24 tests:   24 pass, 0 fail

Linux version:  4.9.187-rc1-g5380ded2525d
Boards tested:  tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Thierry

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1ERlMACgkQ3SOs138+
s6G5vhAAgZZWGODGGHY5R4k9PVj954QvJEyPIf8BK9D016s0YV9ki06E3d9unoMh
JbOzHZrwCEWP4Af4s1J64DaxA5OVnAx9+6m+WcDjdZHYvNPodb3ILHzLcWGoV+PZ
yJkTP9WTv+Mk91BOvQqYdRp0CDSSrpDFXNUcP2UPVzo495R61A0qfJAtg5XtmiA9
FScV4ceQjWpoDA81sThSgNquUinZsGAeV4At7ovvM2XDIU++SIrIugVY0WxqtEc5
exMwzhNvKNxGoR1rBNYC3k4DfaOtyBpVogK8JsNQoM6bIvrlTHjTucqaSdoCON6n
Df8a5EiR0X81zIPyeQFROWfL2bcQQt+rK+tcCXjgGEk8ODSZWN7nnwjgfr3iw4ag
8qSjJnD6jIsgpFvhC5a//c5qSLWy2ResoN5eD5G7pSbTrZmiNDGaW12kcJat9GVV
sraa9gmIkMcSyHHI1G9r4fMA4ZEQcEaoLr8dHmHexUMI+0KhmCJQ7pXqwKP8txOh
zWfocPBthLS2hes3JYhOsJDUhMFnxlWRYEBcLxf4kSmMN0G9x+0/7Bp2k24UeufN
qKGC5b24qiu9Je9EOWOmvRGbVuzi+HXX0CJ5BB4Gj7qUQboIEtXmXIisw8EbYJFM
9jySs4LwlQHnplX1pV3PymqNPwDxmcl4NqY7/ubrBhzUxDzmZX0=
=fv1b
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
