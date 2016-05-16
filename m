From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drivers/of: Fix depth when unflattening devicetree
Date: Mon, 16 May 2016 09:10:54 -0500
Message-ID: <20160516141054.GB21849@rob-hp-laptop>
References: <1462988217-29314-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462988217-29314-1-git-send-email-rklein@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, May 11, 2016 at 01:36:57PM -0400, Rhyland Klein wrote:
> When the implementation for unflatten_dt_node() changed from being
> recursive to being non-recursive, it had a side effect of increasing the
> depth passed to fdt_next_node() by 1. This is fine most of the time, but
> it seems that when the end of the dtb is being parsed, it will cause the
> FDT_END condition in fdt_next_node() to return a different value
> (returning nextoffset instead of -FDT_ERR_NOTFOUND). This ends up passing
> an FDT_ERR_TRUNCATED error back to the unflatten_dt_node() which then
> sees that and complains "Error -8 processing FDT" causing boot to fail.
> 
> This patch simply avoids incrementing depth and uses modified accesses
> for local array indices so that the depth is the same as it was before
> the change as far as fdt_next_node() is concerned.
> 
> This problem was discovered trying to boot Tegra210-Smaug platforms.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9ffa9eb41763 ("drivers/of: Avoid recursively calling unflatten_dt_node()")
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/of/fdt.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Applied, thanks.

Rob
