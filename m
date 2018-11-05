From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.14 000/143] 4.14.79-stable review
Date: Mon, 5 Nov 2018 11:21:42 +0000
Message-ID: <978c5bb4-d049-ba9f-bda1-43c618523046@nvidia.com>
References: <20181102182857.064326086@linuxfoundation.org>
 <34e8a999-20e1-5e7d-863b-b0585a24e83b@roeck-us.net>
 <20181103150434.GA24235@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181103150434.GA24235@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 03/11/2018 15:04, Greg Kroah-Hartman wrote:
> On Sat, Nov 03, 2018 at 07:31:42AM -0700, Guenter Roeck wrote:
>> On 11/2/18 11:33 AM, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 4.14.79 release.
>>> There are 143 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>>
>>> Responses should be made by Sun Nov  4 18:27:59 UTC 2018.
>>> Anything received after that time might be too late.
>>>
>>
>> Build results:
>> 	total: 150 pass: 149 fail: 1
>> Failed builds:
>> 	xtensa:allmodconfig
>> Qemu test results:
>> 	total: 318 pass: 318 fail: 0\
>>
>> Build failure:
>>
>> In file included from include/linux/mlx5/port.h:36:0,
>>                  from include/linux/mlx5/driver.h: In function =E2=80=98=
mlx5_get_vector_affinity_hint=E2=80=99:
>> include/linux/mlx5/driver.h:1208:13: error:
>> 	=E2=80=98struct irq_desc=E2=80=99 has no member named =E2=80=98affinity=
_hint=E2=80=99
>>
>> Caused by commit 19b743c448db ("net/mlx5: Fix mlx5_get_vector_affinity f=
unction").
>=20
> Odd, this should be fixed by a later patch in the same queue, as 0 day
> also reported this.
>=20
> Yes, e3ca34880652 ("net/mlx5: Fix build break when CONFIG_SMP=3Dn") in th=
e
> 4.14 tree should resolve this.  Ah, Sasha added it at the "last minute"
> after I did the -rc1 release.  So this should be resolved now, I'll push
> out a -rc2 so that it can be verified...

All tests are passing for Tegra ...

Test results for stable-v4.14:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    14 tests:	14 pass, 0 fail

Linux version:	4.14.79-rc2-gb825fd9
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

--=20
nvpublic
