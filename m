From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCHv3 3/4] iommu/tegra: smmu: Refrain from accessing to AHB
 registers
Date: Thu, 26 Apr 2012 13:58:32 -0600
Message-ID: <4F99A8E8.7090909@wwwdotorg.org>
References: <1335352072-4001-1-git-send-email-hdoyu@nvidia.com> <1335352072-4001-3-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1335352072-4001-3-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hiroshi DOYU <hdoyu@nvidia.com>
Cc: swarren@nvidia.com, Joerg Roedel <joerg.roedel@amd.com>, Thierry Reding <thierry.reding@avionic-design.de>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 04/25/2012 05:07 AM, Hiroshi DOYU wrote:
> Use "tegra_ahb_enable_smmu()" to inform AHB that SMMU is
> ready, instead of directly aceessing AHB registers.

> @@ -397,11 +384,7 @@ static void smmu_setup_regs(struct smmu_device *smmu)
...
> +	tegra_ahb_enable_smmu();

You need to check for an error there, and make smmu_setup_regs()
propagate any error back to its callers and check it there too.
