From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH 10/10] arm64: Add Tegra194 PCIe driver to defconfig
Date: Wed, 27 Mar 2019 15:42:40 +0530
Message-ID: <44d7ff1d-c317-6ba2-86c0-981a6356ee9e@nvidia.com>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
 <1553613207-3988-11-git-send-email-vidyas@nvidia.com>
 <a0491042-2f24-4ba8-754b-ba3959b77d6f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a0491042-2f24-4ba8-754b-ba3959b77d6f@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, tiwai@suse.de, spujar@nvidia.com, skomatineni@nvidia.com, liviu.dudau@arm.com, krzk@kernel.org, heiko@sntech.de, horms+renesas@verge.net.au, olof@lixom.net, maxime.ripard@bootlin.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, ezequiel@collabora.com, stefan.wahren@i2se.com, marc.w.gonzalez@free.fr, l.stach@pengutronix.de, tpiepho@impinj.com, hayashi.kunihiko@socionext.
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 3/27/2019 3:38 PM, Jon Hunter wrote:
> 
> On 26/03/2019 15:13, Vidya Sagar wrote:
>> Add PCIe host controller driver for DesignWare core based
>> PCIe controller IP present in Tegra194.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 2d9c39033c1a..2ddea5c4e87d 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -87,6 +87,7 @@ CONFIG_PCIE_QCOM=y
>>   CONFIG_PCIE_ARMADA_8K=y
>>   CONFIG_PCIE_KIRIN=y
>>   CONFIG_PCIE_HISI_STB=y
>> +CONFIG_PCIE_TEGRA194=y
>>   CONFIG_ARM64_VA_BITS_48=y
>>   CONFIG_SCHED_MC=y
>>   CONFIG_NUMA=y
> 
> Maybe building as a module is more appropriate here as I am not sure
> that anyone else will want this built-in and it is not critical to
> booting AFAIK.
Since the DesignWare core framework doesn't yet have support for making this
as a module, I added it as a built-in driver. I'll switch it to a module
once support is available.

> 
> Cheers
> Jon
> 
