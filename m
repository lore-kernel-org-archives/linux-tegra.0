From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Enable CPUFREQ userspace governor
Date: Mon, 13 Jul 2020 09:27:28 +0100
Message-ID: <5f777eab-5584-5e4b-ff81-2a9c6522ddad@nvidia.com>
References: <20200712103114.24825-1-jonathanh@nvidia.com>
 <857e47b0-e226-72b7-3855-f668c49c0739@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <857e47b0-e226-72b7-3855-f668c49c0739-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 12/07/2020 11:48, Dmitry Osipenko wrote:
> 12.07.2020 13:31, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Enable the CPUFREQ userspace governor in the tegra_defconfig so that
>> we can test CPUFREQ with the userspace governor with this configuration
>> on 32-bit Tegra devices.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  The_Yellow_Theme_24-192.wav      | 0
>>  arch/arm/configs/tegra_defconfig | 1 +
>>  2 files changed, 1 insertion(+)
>=20
>>  create mode 100644 The_Yellow_Theme_24-192.wav
>>
>> diff --git a/The_Yellow_Theme_24-192.wav b/The_Yellow_Theme_24-192.wav
>> new file mode 100644
>=20
> Hello, Jon! This looks like something unrelated to this patch :)


Ugh indeed. Thanks. I will fix this. Jon

--=20
nvpublic
