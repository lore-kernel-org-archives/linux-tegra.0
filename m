From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2] PCI: tegra: Fix return value check of
 pm_runtime_get_sync
Date: Tue, 17 Dec 2019 08:36:32 -0600
Message-ID: <20191217143632.GA160591@google.com>
References: <20191216111825.28136-1-david.engraf@sysgo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191216111825.28136-1-david.engraf@sysgo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Engraf <david.engraf@sysgo.com>
Cc: thierry.reding@gmail.com, lorenzo.pieralisi@arm.com, andrew.murray@arm.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 16, 2019 at 12:18:25PM +0100, David Engraf wrote:
> pm_runtime_get_sync() returns the device's usage counter. This might
> be >0 if the device is already powered up or CONFIG_PM is disabled.
> 
> Abort probe function on real error only.
> 
> Fixes: da76ba50963b ("PCI: tegra: Add power management support")
> Signed-off-by: David Engraf <david.engraf@sysgo.com>

I added Andrew's ack and a stable tag for v4.17+.  Also cc'd
Manikanta, author of da76ba50963b.

I put this on my pci/host-tegra branch for v5.6 for now.  Lorenzo may
move this when he returns.

> ---
>  drivers/pci/controller/pci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 673a1725ef38..090b632965e2 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2798,7 +2798,7 @@ static int tegra_pcie_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(pcie->dev);
>  	err = pm_runtime_get_sync(pcie->dev);
> -	if (err) {
> +	if (err < 0) {
>  		dev_err(dev, "fail to enable pcie controller: %d\n", err);
>  		goto teardown_msi;
>  	}
> -- 
> 2.17.1
> 
