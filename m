From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] memory: tegra_ahb_enable_smmu() depends on TEGRA_IOMMU_SMMU
Date: Wed, 06 Feb 2013 11:51:46 -0700
Message-ID: <5112A642.1020800@wwwdotorg.org>
References: <1360175666-8377-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360175666-8377-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/06/2013 11:34 AM, Hiroshi Doyu wrote:
> New SoC, Tegra114 also uses SMMU. Change tegra_ahb_enable_smmu()'s
> dependency from ARCH_TEGRA_3x_SOC to TEGRA_IOMMU_SMMU. No need to edit
> whenever a new Tegra SoC comes.
> 
> The following combination caused build error, which this patch fixes.
> 
> CONFIG_ARCH_TEGRA_2x_SOC=y
> \# CONFIG_ARCH_TEGRA_3x_SOC is not set
> CONFIG_ARCH_TEGRA_114_SOC=y
> 
> drivers/iommu/tegra-smmu.c:485: undefined reference to 'tegra_ahb_enable_smmu'

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Russell, I assume Hiroshi should upload this to your patch tracker? It's
needed for 3.9.

Hiroshi, for reference, see:
http://www.arm.linux.org.uk/developer/patches/
