From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] tegra_wm9712: Fix a memory leaking bug in
 tegra_wm9712_driver_probe()
Date: Fri, 24 May 2019 16:36:54 +0100
Message-ID: <1740686f-a466-430c-9d01-ab83ea6998ac@nvidia.com>
References: <20190524005014.GA2289@zhanggen-UX430UQ>
 <b2d43dfe-17e5-a975-435b-49f2aa2ad550@nvidia.com>
 <20190524143309.GA8631@zhanggen-UX430UQ>
 <e52f4140-a119-a584-40a2-6359d6e1784a@nvidia.com>
 <20190524150053.GA9235@zhanggen-UX430UQ>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524150053.GA9235@zhanggen-UX430UQ>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Gen Zhang <blackgod016574@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 24/05/2019 16:00, Gen Zhang wrote:
> On Fri, May 24, 2019 at 03:47:34PM +0100, Jon Hunter wrote:
>>
>> On 24/05/2019 15:33, Gen Zhang wrote:
>>> On Fri, May 24, 2019 at 09:33:13AM +0100, Jon Hunter wrote:
>>>>
>>>> On 24/05/2019 01:50, Gen Zhang wrote:
>>>>> In tegra_wm9712_driver_probe(), 'machine->codec' is allocated by
>>>>> platform_device_alloc(). When it is NULL, function returns ENOMEM.
>>>>> However, 'machine' is allocated by devm_kzalloc() before this site.
>>>>> Thus we should free 'machine' before function ends to prevent memory
>>>>> leaking.
>>>>
>>>> Memory allocated by devm_xxx() is automatically freed on failure so this
>>>> is not correct.
>>> Thanks for your comments, Jon. But after I examined the code, I am still
>>> confused about the usage of devm_kmalloc(). You can kindly refer to 
>>> hisi_sas_debugfs_init() in drivers/scsi/hisi_sas/hisi_sas_main.c. And
>>> devm_kfree() is used to free a memory allocated by devm_kmalloc(). And
>>> I found other situations similar to this in other files.
>>>
>>> So, I hope you can give me some guidance on this. Thanks!
>>
>> Please refer to the devres documentation [0].
>>
>> Cheers,
>> Jon
>>
>> [0] https://www.kernel.org/doc/Documentation/driver-model/devres.txt
>>
>> -- 
>> nvpublic
> Thanks for your reply. I figured out that devm_kmalloc will free the 
> memory no matter fail or not. But I still want to ask why other codes
> as I above mentioned use devm_kfree() to free memory allocated by 
> devm_kmalloc(). If the memory is automatically freed, is this 
> devm_kfee() redundant codes that should be removed? Am I 
> misunderstanding this again or it is something else?

There could well be cases where you need to explicitly call
devm_kfree(), but having a quick glance at the example above, I don't
see why you would call devm_kfree() here and yes looks like that code
could be simplified significantly. Notice that hisi_sas_debugfs_exit()
does not free any memory as it is not necessary to explicitly do so.

Cheers
Jon

-- 
nvpublic
