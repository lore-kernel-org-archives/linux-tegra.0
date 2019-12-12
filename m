From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.19 000/243] 4.19.89-stable review
Date: Thu, 12 Dec 2019 11:19:46 +0000
Message-ID: <892c8078-6db4-d821-43fd-cacf09ca26b9@nvidia.com>
References: <20191211150339.185439726@linuxfoundation.org>
 <7b43a504-160f-e793-99b2-bcb79d331b6a@nvidia.com>
 <8de7c018-32c7-f46e-4c43-ea3a70378a14@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8de7c018-32c7-f46e-4c43-ea3a70378a14@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 12/12/2019 01:40, Guenter Roeck wrote:
> On 12/11/19 1:36 PM, Jon Hunter wrote:
>>
>> On 11/12/2019 15:02, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 4.19.89 release.
>>> There are 243 patches in this series, all will be posted as a response
>>> to this one.=C2=A0 If anyone has any issues with these being applied, p=
lease
>>> let me know.
>>>
>>> Responses should be made by Fri, 13 Dec 2019 14:56:06 +0000.
>>> Anything received after that time might be too late.
>>>
>>> The whole patch series can be found in one patch at:
>>> =C2=A0=C2=A0=C2=A0=C2=A0https://www.kernel.org/pub/linux/kernel/v4.x/st=
able-review/patch-4.19.89-rc1.gz
>>>
>>> or in the git tree and branch at:
>>> =C2=A0=C2=A0=C2=A0=C2=A0git://git.kernel.org/pub/scm/linux/kernel/git/s=
table/linux-stable-rc.git
>>> linux-4.19.y
>>> and the diffstat can be found below.
>>>
>>> thanks,
>>>
>>> greg k-h
>>>
>>> -------------
>>> Pseudo-Shortlog of commits:
>>
>> ...
>>
>>> Linus Walleij <linus.walleij@linaro.org>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 gpio: OF: Parse MMC-specific CD and WP propert=
ies
>>
>> The above change is causing intermittent failures on Tegra30 eMMC.
>> Reverting this change on top of the 4.19.89-rc1 fixes the problem.
>>
>=20
> Thanks for tracking that down. I see boot failures for arm:vexpress-a9
> when trying to boot from mmc.
>=20
> I dimly recall that this was a problem before. Ah yes ... commit
> 89a5e15bcba8
> ("gpio/mmc/of: Respect polarity in the device tree") fixes the above
> commit.
> Can you give it a try ?

Thanks. I did try this and I can confirm that it does indeed work,
although does not apply cleanly.

Cheers
Jon

--=20
nvpublic
