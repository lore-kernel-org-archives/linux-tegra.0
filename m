From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: Re: [PATCH 0/6] Tegra PCIe end point config space map code
 refactoring
Date: Sun, 15 Oct 2017 11:51:30 +0530
Message-ID: <545282e4-e702-2839-7ae8-49e309259287@nvidia.com>
References: <1507834211-24922-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1507834211-24922-1-git-send-email-vidyas@nvidia.com>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>, treding@nvidia.com, bhelgaas@google.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, kthota@nvidia.com
List-Id: linux-tegra@vger.kernel.org

These series of patches are tested on Tegra210

Reviewed-by: Manikanta Maddireddy<mmaddireddy@nvidia.com>
Tested-by: Manikanta Maddireddy<mmaddireddy@nvidia.com>


On 13-Oct-17 12:20 AM, Vidya Sagar wrote:
> PCIe host controller in Tegra SoCs has 1GB of aperture available
> for mapping end points config space, IO and BARs. In that, currently
> 256MB is being reserved for mapping end points configuration space
> which leaves less memory space available for mapping end points BARs
> on some of the platforms.
> This patch series attempts to use only 4K space from 1GB aperture to
> access end points configuration space.
> 
> Currently, this change benefits T20 and future chips in saving (i.e. repurposed
> to use for BAR mapping) physical space as well as kernel virtual mapping space,
> it saves only kernel virtual address space in T30, T124, T132 and T210.
> 
> Testing Done on T210:
>  Enumeration is and basic functionality of immediate devices
>  Enumeration of devices behind a PCIe switch
>  Complete 4K configuration space access
> 
> Vidya Sagar (6):
>   PCI: tegra: refactor config space mapping code
>   ARM: tegra: limit PCIe config space mapping to 4K for T20
>   ARM: tegra: limit PCIe config space mapping to 4K for T30
>   ARM: tegra: limit PCIe config space mapping to 4K for T124
>   ARM64: tegra: limit PCIe config space mapping to 4K for T132
>   ARM64: tegra: limit PCIe config space mapping to 4K for T210
> 
>  arch/arm/boot/dts/tegra124.dtsi          |  2 +-
>  arch/arm/boot/dts/tegra20.dtsi           |  8 +--
>  arch/arm/boot/dts/tegra30.dtsi           |  2 +-
>  arch/arm64/boot/dts/nvidia/tegra132.dtsi |  2 +-
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi |  2 +-
>  drivers/pci/host/pci-tegra.c             | 85 +++++++++-----------------------
>  6 files changed, 31 insertions(+), 70 deletions(-)
> 
