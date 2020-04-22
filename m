From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Wed, 22 Apr 2020 14:59:05 +0100
Message-ID: <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
 <db1132ce-53a8-371c-98e0-cb7cd91d5c7d@gmail.com>
 <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
 <bba0a93a-8ec4-eda6-97f3-fb2ab0b9b503@gmail.com>
 <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
 <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <77a31b2f-f525-ba9e-f1ae-2b474465bde4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 22/04/2020 14:40, Dmitry Osipenko wrote:
> 21.04.2020 22:42, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 21/04/2020 16:08, Dmitry Osipenko wrote:
>>> 21.04.2020 17:40, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>
>>>> On 21/04/2020 14:25, Dmitry Osipenko wrote:
>>>>> 21.04.2020 12:49, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> ...
>>>>>> I can try the above, but I agree it would be best to avoid messing w=
ith
>>>>>> the suspend levels if possible.
>>>>>
>>>>> Will be awesome if you could try it and report back the result.
>>>>>
>>>>
>>>> I gave it a try but suspend still fails.
>>>
>>> Perhaps the RPM's -EACCES is returned from here:
>>>
>>> https://elixir.free-electrons.com/linux/v5.7-rc2/source/drivers/base/po=
wer/runtime.c#L723
>>>
>>> Which suggests that I2C is accessed after being suspended. I guess the
>>> PCIe driver suspends after the I2C and somehow my change affected the
>>> suspension order, although not sure how.
>>>
>>> Jon, could you please try to enable PM logging and post the log? Please
>>> also post log of the working kernel version, so that we could compare
>>> the PM sequence.
>>>
>>> Something like this should enable the logging: "echo 1 >
>>> /sys/power/pm_trace" + there is RPM tracing.
>>
>> Unfortunately, after enabling that I don't any output and so no help the=
re.
>=20
> 1. I now tried to check the pm_trace myself and found that it's
> available only on X86, my bad.
>=20
> 2. Jon, could you please clarify what exactly you were trying to test?
>=20
> 3. Is it only the Cardhu board that is affected by this problem?
>=20
> 4. Could you please try to add this to the kernel's cmdline and post the
> logs:
>=20
> tp_printk
> trace_event=3Drpm_suspend,rpm_resume,rpm_usage,rpm_idle,rpm_return_int


So I think that part of the problem already existed prior to these
patches. Without your patches I see ...

[   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out

[   59.549036] vdd_sata,avdd_plle: failed to disable

[   59.553778] Failed to disable avdd-plle: -110

[   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: -110


However, now with your patches the i2c is failing to resume and this
breaks system suspend completely for Tegra30. So far this is the only
board that appears to break.

So the above issue needs to be fixed and I will chat to Thierry about this.

Jon

--=20
nvpublic
