From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 5.2 00/56] 5.2.8-stable review
Date: Fri, 9 Aug 2019 16:48:46 +0200
Message-ID: <20190809144846.25144-1-treding@nvidia.com>
References: <20190808190452.867062037@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190808190452.867062037@linuxfoundation.org>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 08 Aug 2019 21:04:26 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.2.8 release.
> There are 56 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>=20
> Responses should be made by Sat 10 Aug 2019 07:03:19 PM UTC.
> Anything received after that time might be too late.
>=20
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.2.8-r=
c1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git=
 linux-5.2.y
> and the diffstat can be found below.
>=20
> thanks,
>=20
> greg k-h

All tests passing for Tegra ...

Test results for stable-v5.2:
    12 builds:	12 pass, 0 fail
    22 boots:	22 pass, 0 fail
    38 tests:	38 pass, 0 fail

Linux version:	5.2.8-rc1-gbd703501e2df
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Thierry
