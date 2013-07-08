From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 00/22] Unified SMMU driver among Tegra SoCs
Date: Mon, 8 Jul 2013 10:47:36 +0200
Message-ID: <20130708.114736.1280783845180530098.hdoyu@nvidia.com>
References: <1373021097-32420-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373021097-32420-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Fri, 5 Jul 2013 12:44:35 +0200:

> Hi,
> 
> This series provides:
> 
> (1) Unified SMMU driver among Tegra SoCs
> (2) Multiple Address Space support(MASID) in IOMMU(SMMMU)
> (3) Tegra IOMMU'able devices, most of platform devices are IOMMU'able.
> 
> There's some discussion[1] about device population order, which can
> solve the following patches.
> 
>   [HACK] of: dev_node has struct device pointer
>   ARM: tegra: Populate AHB/IOMMU earlier than others
> 
> Also "ARM: dma-mapping: Drop GFP_COMP for DMA memory allocations" may
> not be necessary by [2]
> 
> Tested IOMMU functionality with T30 SD/MMC. Any further testing with
> T114 and/or other devices would be really appreciated.

For tegra device driver maintainers, please try this series to make
your device work with IOMMU enabled. I guess that some of drivers may
need to set its swgroup ID correctly in DT, and also you may need to
check the usage of DMA mapping API correctly. For your convenience,
you can get this series by git fetch:

git://nv-tegra.nvidia.com/user/hdoyu/linux.git smmu-upstreaming@20130705

Although I will not be always online for a few weeks, any feedback
would be really appreciated.
