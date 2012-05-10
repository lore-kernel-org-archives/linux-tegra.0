From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] iommu/tegra: smmu: Add device tree support for SMMU
Date: Thu, 10 May 2012 14:08:33 -0600
Message-ID: <4FAC2041.7030405@wwwdotorg.org>
References: <1336636221-31575-1-git-send-email-hdoyu@nvidia.com> <1336636221-31575-2-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336636221-31575-2-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hiroshi DOYU <hdoyu@nvidia.com>, Joerg Roedel <joerg.roedel@amd.com>
Cc: linux-tegra@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Ohad Ben-Cohen <ohad@wizery.com>, Tony Lindgren <tony@atomide.com>, Jiri Kosina <jkosina@suse.cz>, Thierry Reding <thierry.reding@avionic-design.de>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05/10/2012 01:50 AM, Hiroshi DOYU wrote:
> The necessary info is expected to pass from DT.
> 
> For more precise resource reservation, there shouldn't be any
> overlapping of register range between SMMU and MC. SMMU register
> offset needs to be calculated correctly, based on its register bank.
> 
> Signed-off-by: Hiroshi DOYU <hdoyu@nvidia.com>

Acked-by: Stephen Warren <swarren@wwwdotorg.org>

I expect patch 1 will go through the IOMMU tree, and I'll take patch 2
through the Tegra tree.
