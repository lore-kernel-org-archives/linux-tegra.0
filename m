From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] iommu/tegra: gart: Fix register offset correctly
Date: Thu, 10 May 2012 11:28:28 -0600
Message-ID: <4FABFABC.60407@wwwdotorg.org>
References: <1336635940-31068-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1336635940-31068-1-git-send-email-hdoyu@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Hiroshi DOYU <hdoyu@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Thierry Reding <thierry.reding@avionic-design.de>, Joerg Roedel <joerg.roedel@amd.com>, Bharat Nihalani <bnihalani@nvidia.com>, Vandana Salve <vsalve@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05/10/2012 01:45 AM, Hiroshi DOYU wrote:
> DT passes the exact GART register ranges without any overlapping with
> MC register ranges. GART register offset needs to be adjusted by one
> passed by DT correctly.
> 
> Signed-off-by: Hiroshi DOYU <hdoyu@nvidia.com>

Acked-by: Stephen Warren <swarren@wwwdotorg.org>

Joerg, I assume you'll take this patch through the iommu tree and I'll
take patch 2 through the Tegra tree?
