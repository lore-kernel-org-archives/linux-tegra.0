From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] PCI: tegra: handle failure case of pm_runtime_get_sync
Date: Fri, 5 Jun 2020 06:58:03 +0100
Message-ID: <e595b755-ea15-48d6-1f2a-c485f0f365e2@nvidia.com>
References: <20200605031239.6638-1-navid.emamdoost@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20200605031239.6638-1-navid.emamdoost@gmail.com>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: Navid Emamdoost <navid.emamdoost@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: emamd001@umn.edu, wu000273@umn.edu, kjlu@umn.edu, smccaman@umn.edu
List-Id: linux-tegra@vger.kernel.org


On 05/06/2020 04:12, Navid Emamdoost wrote:
> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count. Call pm_runtime_put if
> pm_runtime_get_sync fails.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 3e64ba6a36a8..3d4b448fd8df 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2712,6 +2712,7 @@ static int tegra_pcie_probe(struct platform_device *pdev)
>  	err = pm_runtime_get_sync(pcie->dev);
>  	if (err < 0) {
>  		dev_err(dev, "fail to enable pcie controller: %d\n", err);
> +		pm_runtime_put_sync(pcie->dev);
>  		goto teardown_msi;
>  	}

Same thing for this patch, there is already a put in the error path and
so it is not necessary to add the put call here. Just update the goto
label.

Jon

-- 
nvpublic
