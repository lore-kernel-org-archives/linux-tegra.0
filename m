From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 27 Apr 2020 15:46:35 +0300
Message-ID: <da5985f4-44b3-336d-207d-4c0388806f95@gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a5198024-7273-74c4-b4f4-3a29d042bc36-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

23.04.2020 13:56, Jon Hunter пишет:
>>> So I think that part of the problem already existed prior to these
>>> patches. Without your patches I see ...
>>>
>>> [   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out
>>> [   59.549036] vdd_sata,avdd_plle: failed to disable
>>> [   59.553778] Failed to disable avdd-plle: -110
>>> [   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: -110
>> Does this I2C timeout happen with my patches? Could you please post full
>> logs of an older and the recent kernel versions?
> I believe that it does, but I need to check.
> 

Jon, could you please confirm that you're seeing those regulator-disable
errors with my patch? I don't see those errors in yours original log [1].

[1]
https://lore.kernel.org/lkml/1e259e22-c300-663a-e537-18d854e0f478-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org/

Again, could you please post the *full* logs?

If regulator's disabling was "failing" before without my patch because
of the I2C interrupt being force-disabled during of NOIRQ phase, and now
regulator's disabling succeeds with my patch because IRQ is manually
handled after the timeout, then this could be bad. It means that
regulator was actually getting disabled, but I2C driver was timing out
because interrupt couldn't be handled in NOIRQ phase, which should
result in a dead PCIe on a resume from suspend since regulator's core
thinks that regulator is enabled (I2C said it failed to disable), while
it is actually disabled.

Do you have anything plugged into the PCIe slot in yours testing farm?
It wouldn't surprise me if the plugged card isn't functional after
resume from suspend on a stable kernels.
