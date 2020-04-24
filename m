From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Fri, 24 Apr 2020 16:19:25 +0100
Message-ID: <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
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
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a5734f19-254e-b6bc-e791-fa1ac63f11a4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 24/04/2020 15:45, Dmitry Osipenko wrote:
> 24.04.2020 10:10, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>> Could you please clarify why pm_runtime_get_sync() can't be used by the
>>> I2C driver's in NOIRQ phase?
>>
>> Yes take a look at commit 1e2ef05bb8cf ("PM: Limit race conditions
>> between runtime PM and system sleep (v2)").
>=20
> I2C driver now uses irq-safe RPM since ede2299f7 ("i2c: tegra: Support
> atomic transfers"), and thus, the RPM's workqueue shouldn't be a
> problem. I guess RPM should work fine in this case, don't you think so?

I was testing, and I did not see it using atomic transfers. I can
confirm if the RPM callbacks are called or not, but I did not think so.
However, let me confirm.

>>> Yes, keeping PCI regulators always-enabled should be a good immediate
>>> solution.
>>
>> I was thinking about that, and I am not sure it is. I don't think that
>> the failure to send the I2C command should break suspend.
>=20
> It shouldn't, but looks like it should be a separate problem.

Maybe but all these other problems appear to have existed for sometime
now. We need to fix all, but for the moment we need to figure out what's
best for v5.7.

>> So I confirmed that DMA is not the issue in this case. I tested this by
>> ensuring that DMA is never used. However, it is a potential problem
>> indeed.
>>
>>> Could you please try to apply this hunk and see if it makes any
>>> difference (I'll probably make it as proper patch):
>>
>> Per my tests, I don't believe that it will as disabling DMA does not
>> resolve the problem.
>>
>>> It also could be that there is more than the suspend ordering problem,
>>> but for now it is hard to tell without having a detailed log which
>>> includes I2C/DMA/RPM traces.
>>
>> I have taken a look and I don't see any issues with ordering. I2C is
>> suspended after PCI. This did not change.
>=20
> Do you see a "completion done after timeout" messages in the KMSG log of
> the v5.6 kernel?
>=20
> Could you please try this hunk? Although, I'll be surprised if it
> changes anything.

Yes I can test.

Cheers
Jon

--=20
nvpublic
