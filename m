From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] cpuidle: tegra: Correctly handle result of
 arm_cpuidle_simple_enter()
Date: Thu, 9 Jul 2020 10:06:30 +0100
Message-ID: <be99caca-b50a-0e12-29dc-2da0d924af43@nvidia.com>
References: <20200702001354.27056-1-digetx@gmail.com>
 <4ffff3d8-2d41-3fb2-ed16-c9662d18d261@nvidia.com>
 <3bc2064e-e94d-984c-edab-50b4dc2fd2dd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3bc2064e-e94d-984c-edab-50b4dc2fd2dd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 08/07/2020 15:32, Dmitry Osipenko wrote:
> 08.07.2020 15:34, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 02/07/2020 01:13, Dmitry Osipenko wrote:
>>> The enter() callback of CPUIDLE drivers returns index of the entered id=
le
>>> state on success or a negative value on failure. The negative value cou=
ld
>>> any negative value, i.e. it doesn't necessarily needs to be a error cod=
e.
>>> That's because CPUIDLE core only cares about the fact of failure and no=
t
>>> about the reason of the enter() failure.
>>>
>>> Like every other enter() callback, the arm_cpuidle_simple_enter() retur=
ns
>>> the entered idle-index on success. Unlike some of other drivers, it nev=
er
>>> fails. It happened that TEGRA_C1=3Dindex=3Derr=3D0 in the code of cpuid=
le-tegra
>>> driver, and thus, there is no problem for the cpuidle-tegra driver crea=
ted
>>> by the typo in the code which assumes that the arm_cpuidle_simple_enter=
()
>>> returns a error code.
>>>
>>> The arm_cpuidle_simple_enter() also may return a -ENODEV error if CPU_I=
DLE
>>> is disabled in a kernel's config, but all CPUIDLE drivers are disabled =
if
>>> CPU_IDLE is disabled, including the cpuidle-tegra driver. So we can't e=
ver
>>> see the error code from arm_cpuidle_simple_enter() today.
>>>
>>> Of course the code may get some changes in the future and then the typo
>>> may transform into a real bug, so let's correct the typo in the code by
>>> making tegra_cpuidle_enter() to directly return the index returned by t=
he
>>> arm_cpuidle_simple_enter().
>>
>> Are you suggesting that arm_cpuidle_simple_enter() could be updated to
>> actually return an error? Sorry it is not clear to me what you are imply=
ing.
>=20
> Hello, Jon!
>=20
> Yes, I'm saying that *potentially* arm_cpuidle_simple_enter() could be
> updated to actually return error.


OK, then I am confused, because after your change, we would now ignore
any error that could be returned in the future. Yes the current code
does not set the variable 'index' correctly, but before we set the value
of 'index' shouldn't we check that the value being returned is not a
negative error code first?

Jon

--=20
nvpublic
