From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [PATCH 1/2] iommu/tegra: smmu: Add device tree support for SMMU
Date: Fri, 18 May 2012 08:50:51 +0300
Message-ID: <20120518085051.4a0fca863c5ab37cf8d42cb1@nvidia.com>
References: <1336636221-31575-1-git-send-email-hdoyu@nvidia.com>
	<1336636221-31575-2-git-send-email-hdoyu@nvidia.com>
	<4FB143C4.6030502@wwwdotorg.org>
	<4FB52BE7.8080908@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4FB52BE7.8080908@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Joerg Roedel <joerg.roedel@amd.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Ohad Ben-Cohen <ohad@wizery.com>, Tony Lindgren <tony@atomide.com>, Jiri Kosina <jkosina@suse.cz>, Thierry Reding <thierry.reding@avionic-design.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen and Joerg,

On Thu, 17 May 2012 18:48:39 +0200
Stephen Warren <swarren@wwwdotorg.org> wrote:

> On 05/14/2012 11:41 AM, Stephen Warren wrote:
> > On 05/10/2012 01:50 AM, Hiroshi DOYU wrote:
> >> The necessary info is expected to pass from DT.
> >>
> >> For more precise resource reservation, there shouldn't be any
> >> overlapping of register range between SMMU and MC. SMMU register
> >> offset needs to be calculated correctly, based on its register bank.
> >>
> >> Signed-off-by: Hiroshi DOYU <hdoyu@nvidia.com>
> >> ---
> >> This patch requires the following ones, sent earlier:
> >>
> >> DMA window:
> >> http://article.gmane.org/gmane.linux.ports.tegra/4603
> > 
> > This patch has been merged even though the patch above isn't present in
> > the kernel anywhere, let alone in the history of the iommu tree. This
> > breaks compilation in linux-next.
> > 
> >> AHB:
> >> http://article.gmane.org/gmane.linux.ports.tegra/4657
> > 
> > This patch is in linux-next, but also is not in the history of the iommu
> > tree, so will break bisection of the iommu tree for Tegra.
> 
> Joerg,
> 
> Can this patch please be dropped or reverted? It's still breaking
> tegra_defconfig in next-20120517 since the dependencies I mentioned
> above aren't satisfied. At this stage, it seems unlikely that the DMA
> window parsing change is going to make it into 3.5, so this isn't just a
> temporary issue.

I can move of_get_dma_window() function into tegra-smmu.c as a static
function. I just want SMMU available with DT for the furthuer
development. Then, it's also possible to promote that function global
later as is in the origianl patch.

I'm posting that patch follows this email. Please take it if this
proposal is acceptable.
