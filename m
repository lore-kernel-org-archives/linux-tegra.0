From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH] PCI: tegra: Correctly handle return code of
 pm_runtime_get_sync()
Date: Mon, 16 Dec 2019 10:22:09 +0000
Message-ID: <20191216102208.GO24359@e119886-lin.cambridge.arm.com>
References: <20191216093415.27320-1-david.engraf@sysgo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191216093415.27320-1-david.engraf@sysgo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Engraf <david.engraf@sysgo.com>
Cc: thierry.reding@gmail.com, lorenzo.pieralisi@arm.com, bhelgaas@google.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 16, 2019 at 10:34:15AM +0100, David Engraf wrote:
> pm_runtime_get_sync() returns the device's usage counter. This might
> be >0 if the device is already powered up or CONFIG_PM is disabled.
> 
> Abort probe function on real error only.
> 
> Signed-off-by: David Engraf <david.engraf@sysgo.com>

Thanks for this, looks OK to me.

As this is a fix, can you add the following fixes tag?

Fixes: da76ba50963b ("PCI: tegra: Add power management support")

And whilst doing that can you rename the subject to "PCI: tegra: Fix return
value check of pm_runtime_get_sync" - it's slightly shorter and has the
word fix in the title.

Thanks,

Andrew Murray

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
