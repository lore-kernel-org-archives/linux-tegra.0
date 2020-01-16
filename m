From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V3 0/2] PCI: Add MCFG quirks for Tegra194 host controllers
Date: Thu, 16 Jan 2020 22:48:08 +0530
Message-ID: <e264ae37-f3b3-96d1-9294-3ea9f78b78fc@nvidia.com>
References: <20200106082709.14370-1-vidyas@nvidia.com>
 <20200110191500.9538-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20200110191500.9538-1-vidyas@nvidia.com>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: bhelgaas@google.com, lorenzo.pieralisi@arm.com, rjw@rjwysocki.net, lenb@kernel.org, andrew.murray@arm.com, treding@nvidia.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Hi Bjorn,
Could you please review this series?

Thanks in advance,
Vidya Sagar

On 1/11/20 12:44 AM, Vidya Sagar wrote:
> The PCIe controller in Tegra194 SoC is not completely ECAM-compliant.
> With the current hardware design limitations in place, ECAM can be enabled
> only for one controller (C5 controller to be precise) with bus numbers
> starting from 160 instead of 0. A different approach is taken to avoid this
> abnormal way of enabling ECAM for just one controller but to enable
> configuration space access for all the other controllers. In this approach,
> ops are added through MCFG quirk mechanism which access the configuration
> spaces by dynamically programming iATU (internal AddressTranslation Unit)
> to generate respective configuration accesses just like the way it is
> done in DesignWare core sub-system.
> To increase the size of ECAM, a device-tree change is pushed in this series
> to move the IO window from 32-bit PCIe aperture to 64-bit PCIe aperture leaving
> the entire 32MB of 32-bit aperture for configuration space access.
> 
> V3:
> * Pushed a device-tree change in the series to enable more space for ECAM
> 
> Vidya Sagar (2):
>    arm64: tegra: Re-order PCIe aperture mappings to support ACPI boot
>    PCI: Add MCFG quirks for Tegra194 host controllers
> 
>   arch/arm64/boot/dts/nvidia/tegra194.dtsi   |  36 ++++----
>   drivers/acpi/pci_mcfg.c                    |   7 ++
>   drivers/pci/controller/dwc/Kconfig         |   3 +-
>   drivers/pci/controller/dwc/Makefile        |   2 +-
>   drivers/pci/controller/dwc/pcie-tegra194.c | 102 +++++++++++++++++++++
>   include/linux/pci-ecam.h                   |   1 +
>   6 files changed, 131 insertions(+), 20 deletions(-)
> 
