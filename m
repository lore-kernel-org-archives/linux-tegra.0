From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 0/3] PCI: tegra: Cleanups
Date: Wed, 12 Oct 2016 11:02:17 -0500
Message-ID: <20161012160217.GF4308@localhost>
References: <20161012125946.24960.54201.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161012125946.24960.54201.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 12, 2016 at 08:02:12AM -0500, Bjorn Helgaas wrote:
>   - Fix argument order bug for pads_writel() call.
> 
>   - Add local "dev" pointers to reduce repetition of things like
>     "&pdev->dev".
> 
>   - Remove platform drvdata because it appears unused (we called
>     platform_set_drvdata() but not platform_get_drvdata()).
> 
> The first patch fixes a bug.  The others shouldn't change the behavior.
> 
> Changes from v1:
>   I dropped the following patches because they were a lot of churn for
>   questionable benefit:
>     PCI: tegra: Swap order of afi_writel() reg/val arguments
>     PCI: tegra: Swap order of pads_writel() reg/val arguments
> 
> ---
> 
> Bjorn Helgaas (3):
>       PCI: tegra: Fix argument order in tegra_pcie_phy_disable()
>       PCI: tegra: Add local struct device pointers
>       PCI: tegra: Remove unused platform data

I applied these to pci/host-tegra for v4.9.  I hope to ask Linus to
pull them tomorrow, so if you see any issues, let me know soon.
