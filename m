From: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Tue, 21 Apr 2020 19:19:53 +0530
Message-ID: <f055806b-83ec-612c-9654-0af62feaf9bd@nvidia.com>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
 <2e99c2f0-4bba-2ea6-dada-3190c0303dcf@nvidia.com>
 <1a5e5455-597f-7724-f992-32a2492c1e24@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1a5e5455-597f-7724-f992-32a2492c1e24-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 21-Apr-20 6:38 PM, Jon Hunter wrote:
>
> On 21/04/2020 13:39, Manikanta Maddireddy wrote:
>
> ...
>
>>> I am adding Manikanta to get some feedback on why we moved the PCI
>>> suspend to the NOIRQ phase because it is not clear to me if we need to
>>> do this here.
>>>
>>> Manikanta, can you comment on whether we really need to suspend Tegra
>>> PCI during the noirq phase?
>> PCIe subsystem driver implemented noirq PM callbacks, it will save & restore
>> endpoint config space in these PM callbacks. PCIe controller should be
>> available during this time, so noirq PM callbacks are implemented in Tegra
>> PCIe driver.
>>
>> file: drivers/pci/pci-driver.c
>> static const struct dev_pm_ops pci_dev_pm_ops = {
>> 	...
>>         .suspend_noirq = pci_pm_suspend_noirq,
>>         .resume_noirq = pci_pm_resume_noirq,
>>         ...
>> };
> Thanks, however, it is still not clear why this needs to be done during
> this phase. When you say PCIe subsystem driver, specifically which
> driver are you referring too? Are you referring to the
> pci_pm_suspend_noirq() in the drivers/pci/pci-driver.c driver? If so,
> just out of curiosity why does this need to be handled in the noirq phase?

If PCIe device is not in valid state it might cause interrupt issues and
can lead to system lockup. Please refer to below paper for complete details.
https://www.kernel.org/doc/ols/2009/ols2009-pages-319-330.pdf

>
> Thanks
> Jon
>
