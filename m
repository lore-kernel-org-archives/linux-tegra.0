From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V5 09/16] Documentation/devicetree: Add PCIe
 supports-clkreq property
Date: Tue, 7 May 2019 14:01:03 +0530
Message-ID: <d8ef9c8d-031b-4c77-b225-4a1fef3bc9eb@nvidia.com>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-10-vidyas@nvidia.com> <20190426152229.GA8492@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426152229.GA8492@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 4/26/2019 8:52 PM, Rob Herring wrote:
> On Wed, Apr 24, 2019 at 10:49:57AM +0530, Vidya Sagar wrote:
>> Some host controllers need to know the existence of clkreq signal routing to
>> downstream devices to be able to advertise low power features like ASPM L1
>> substates. Without clkreq signal routing being present, enabling ASPM L1 sub
>> states might lead to downstream devices falling off the bus. Hence a new device
>> tree property 'supports-clkreq' is added to make such host controllers
>> aware of clkreq signal routing to downstream devices.
> 
> Please be consistent with subjects (Use 'dt-bindings: ...')
When I had made this change, I did a git log and saw 'Documentation/devicetree:' as
the prefix and hence added it. But, now, with linux-next top of the tree,  I see
two more commits with 'dt-bindings:' prefix. I'll change my patch also to the new
'dt-bindings:' prefix.

> 
> With that change,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>> Changes since [v4]:
>> * None
>>
>> Changes since [v3]:
>> * Rebased on top of linux-next top of the tree
>>
>> Changes since [v2]:
>> * None
>>
>> Changes since [v1]:
>> * This is a new patch in v2 series
>>
>>   Documentation/devicetree/bindings/pci/pci.txt | 5 +++++
>>   1 file changed, 5 insertions(+)
