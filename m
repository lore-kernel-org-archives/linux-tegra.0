From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH] PCI: tegra: fix runtime pm imbalance on error
Date: Fri, 29 May 2020 16:28:23 +0530
Message-ID: <74c911ac-95ab-d2a0-8604-1ef19c2f997d@nvidia.com>
References: <20200520163739.GA1100601@bjorn-Precision-5520>
 <e7c967a0-c285-450a-bbad-f6456c661d41@nvidia.com>
 <20200529102317.GA12270@e121166-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20200529102317.GA12270@e121166-lin.cambridge.arm.com>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 29-May-20 3:53 PM, Lorenzo Pieralisi wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Wed, May 20, 2020 at 11:39:08PM +0530, Vidya Sagar wrote:
>> Thanks for pushing a patch to fix it. I've been under the wrong assumption
>> that a failing pm_runtime_get_sync() wouldn't increment the usage counter.
>> With Thierry's and Bjorn's comments addressed
>>
>> Acked-by: Vidya Sagar <vidyas@nvidia.com>
> 
> Thierry, Vidya,
> 
> are your ACKs applying also to:
> 
> https://patchwork.kernel.org/patch/11562109/
I just took a look at this change and it looks good to me.
So, I'm fine with extending my 'Acked-by' to this patch as well.

Thanks,
Vidya Sagar
> 
> Dinghao did not carry them over and I could not understand from this
> thread if your ACKs apply to both tegra and tegra194.
> 
> Thanks,
> Lorenzo
> 
>> On 20-May-20 10:07 PM, Bjorn Helgaas wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Wed, May 20, 2020 at 11:59:08AM +0200, Thierry Reding wrote:
>>>> On Wed, May 20, 2020 at 04:52:23PM +0800, Dinghao Liu wrote:
>>>>> pm_runtime_get_sync() increments the runtime PM usage counter even
>>>>> it returns an error code. Thus a pairing decrement is needed on
>>>>
>>>> s/even it/even when it/
>>>>
>>>> Might also be a good idea to use a different subject prefix because I
>>>> was almost not going to look at the other patch, taking this to be a
>>>> replacement for it.
>>>
>>> Amen.  This would be a good change to start using "PCI: tegra194" or
>>> something for pcie-tegra194.c.  Or will there be tegra195, tegra 196,
>>> etc added to this driver?
>>>
>>> Also, please capitalize the first word and "PM" in the subjects:
>>>
>>>     PCI: tegra194: Fix runtime PM imbalance on error
>>>
>>> Bjorn
>>>
