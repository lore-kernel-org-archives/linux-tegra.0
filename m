From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V3 1/2] arm64: tegra: Re-order PCIe aperture mappings to
 support ACPI boot
Date: Tue, 30 Jun 2020 16:22:03 +0530
Message-ID: <7c946e2a-6fd4-f4c8-8afe-f9d0125fdaa0@nvidia.com>
References: <20200106082709.14370-1-vidyas@nvidia.com>
 <20200110191500.9538-1-vidyas@nvidia.com>
 <20200110191500.9538-2-vidyas@nvidia.com>
 <d52db35b-dbf8-a706-9611-95448cf6a69e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d52db35b-dbf8-a706-9611-95448cf6a69e@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, bhelgaas@google.com, lorenzo.pieralisi@arm.com, rjw@rjwysocki.net, lenb@kernel.org, andrew.murray@arm.com, treding@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org



On 29-Jun-20 7:01 PM, Jon Hunter wrote:
> Hi Sagar,
> 
> On 10/01/2020 19:14, Vidya Sagar wrote:
>> Re-order Tegra194's PCIe aperture mappings to have IO window moved to
>> 64-bit aperture and have the entire 32-bit aperture used for accessing
>> the configuration space. This makes it to use the entire 32MB of the 32-bit
>> aperture for ECAM purpose while booting through ACPI.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> 
> Any reason why we should not merge this change, even if patch 2/2 is not
> accepted? If there is no harm in us merging this, this would be one less
> change for us to carry out-of-tree. If so, can you update and re-post
> for 5.9?
There is no issue in merging this change alone. I'll send a patch for 
review for 5.9 soon.

Thanks,
Vidya Sagar

> 
> Cheers
> Jon
> 
