From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Thu, 23 Apr 2020 11:56:13 +0100
Message-ID: <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 22/04/2020 15:07, Dmitry Osipenko wrote:

...

>> So I think that part of the problem already existed prior to these
>> patches. Without your patches I see ...
>>
>> [   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out
> 
> Does this I2C timeout happen with my patches? Could you please post full
> logs of an older and the recent kernel versions?

I believe that it does, but I need to check.

>> [   59.549036] vdd_sata,avdd_plle: failed to disable
>>
>> [   59.553778] Failed to disable avdd-plle: -110
>>
>> [   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: -110
>>
>>
>> However, now with your patches the i2c is failing to resume and this
>> breaks system suspend completely for Tegra30. So far this is the only
>> board that appears to break.
>>
>> So the above issue needs to be fixed and I will chat to Thierry about this.
> 
> Okay

So I have been looking at this some more and this starting to all look a
bit of a mess :-(

Firstly, the Tegra PCI driver suspends late (noirq) as we know. The PCI
driver will warn if it cannot disable the regulators when suspending but
does not actually fail suspend. So this warning is just indicating that
we were unable to disable the regulators.

Now I don't see that we can ever disable the PCI regulators currently
when entering suspend because ...

1. We are in the noirq phase and so we will not get the completion
   interrupt for the I2C transfer. I know that you recently added the
   atomic I2C transfer support, but we can get the regulator framework
   to use this (I have not looked in much detail so far).

2. Even if the regulator framework supported atomic I2C transfers, we
   also have the problem that the I2C controller could be runtime-
   suspended and pm_runtime_get_sync() will not work during during this
   phase to resume it correctly. This is a problem that needs to be
   fixed indeed!

3. Then we also have the possible dependency on the DMA driver that is
   suspended during the noirq phase.

It could be argued that if the PCI regulators are never turned off
(currently) then we should not even bother and this will likely resolve
this for now. However, really we should try to fix that correctly.

What I still don't understand is why your patch breaks resume. Even if
the I2C transfer fails, and is deemed harmless by the client driver, we
should still be able to suspend and resume correctly.

Cheers
Jon

-- 
nvpublic
