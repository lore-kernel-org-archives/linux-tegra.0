From: Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH V2 0/5] Tegra xHCI genpd support
Date: Tue, 16 Oct 2018 14:00:39 +0300
Message-ID: <b41a6528-f36f-1d12-3785-95474b00cf97@intel.com>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
 <6a7cda6b-2f2f-43ee-7a53-8b226fdcc88d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6a7cda6b-2f2f-43ee-7a53-8b226fdcc88d@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-tegra@vger.kernel.org

On 15.10.2018 15:40, Jon Hunter wrote:
> Hi Mathias,
> 
> On 28/09/18 15:11, Jon Hunter wrote:
>> This series add genpd support for the Tegra xHCI device that requires
>> more than one power-domain to operate.
>>
>> This series is making changes to more than one subsystem and at first
>> glance may look like a maintainers nightmare. However, my proposal is
>> this, once reviewed and people are happy ...
>> 1. Patches 1-3 should be merged first. Patches 1 can go via the Tegra
>>     tree and 2-3 via the USB tree.
>> 2. Once patches 1-3 are accepted, then 4 and 5 can be merged via the
>>     Tegra tree.
>>
>> Changes since V1:
>> - Dropped unneeded patch to export symbol for genpd API
>> - Added patch to power-off XUSB domains
>> - Slight re-work to Tegra xHCI driver changes to simplify clean-up path.
>>
>> Jon Hunter (5):
>>    dt-bindings: usb: xhci-tegra: Add power-domain details
>>    usb: xhci: tegra: Power-off power-domains on removal
>>    usb: xhci: tegra: Add genpd support
>>    soc/tegra: pmc: Don't power-up XUSB power-domains
>>    arm64: dts: tegra210: Add power-domains for xHCI
> 
> Let me know you are ok to pick up patches 2 and 3 for v4.20.
> 

Patches 2 and 3 look good to me.
I'll resend them to Greg

-Mathias
