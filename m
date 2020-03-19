From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: Print -EPROBE_DEFER error message at debug
 level
Date: Thu, 19 Mar 2020 22:34:01 +0530
Message-ID: <2e763237-fe19-68b3-d584-a3ad28689b87@nvidia.com>
References: <20200319131230.3216305-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200319131230.3216305-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Andrew Murray <amurray-tUaQ5FxYRYX4aQPF92CzsNBc4/FLrbF6@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 3/19/2020 6:42 PM, Thierry Reding wrote:
> External email: Use caution opening links or attachments
> 
> 
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Probe deferral is an expected error condition that will usually be
> recovered from. Print such error messages at debug level to make them
> available for diagnostic purposes when building with debugging enabled
> and hide them otherwise to not spam the kernel log with them.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/pci/controller/dwc/pcie-tegra194.c | 42 ++++++++++++++++++----
>   1 file changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 97d3f3db1020..e4870fa6ce9c 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1159,17 +1159,31 @@ static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
>          /* Endpoint mode specific DT entries */
>          pcie->pex_rst_gpiod = devm_gpiod_get(pcie->dev, "reset", GPIOD_IN);
>          if (IS_ERR(pcie->pex_rst_gpiod)) {
> -               dev_err(pcie->dev, "Failed to get PERST GPIO: %ld\n",
> -                       PTR_ERR(pcie->pex_rst_gpiod));
> -               return PTR_ERR(pcie->pex_rst_gpiod);
> +               int err = PTR_ERR(pcie->pex_rst_gpiod);
> +               const char *level = KERN_ERR;
> +
> +               if (err == -EPROBE_DEFER)
> +                       level = KERN_DEBUG;
> +
> +               dev_printk(level, pcie->dev,
> +                          dev_fmt("Failed to get PERST GPIO: %d\n"),
> +                          err);
> +               return err;
>          }
> 
>          pcie->pex_refclk_sel_gpiod = devm_gpiod_get(pcie->dev,
>                                                      "nvidia,refclk-select",
>                                                      GPIOD_OUT_HIGH);
>          if (IS_ERR(pcie->pex_refclk_sel_gpiod)) {
> -               dev_info(pcie->dev, "Failed to get REFCLK select GPIOs: %ld\n",
> -                        PTR_ERR(pcie->pex_refclk_sel_gpiod));
> +               int err = PTR_ERR(pcie->pex_refclk_sel_gpiod);
> +               const char *level = KERN_ERR;
> +
> +               if (err == -EPROBE_DEFER)
> +                       level = KERN_DEBUG;
> +
> +               dev_printk(level, pcie->dev,
> +                          dev_fmt("Failed to get REFCLK select GPIOs: %d\n"),
> +                          err);
>                  pcie->pex_refclk_sel_gpiod = NULL;
>          }
> 
> @@ -2058,13 +2072,27 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
> 
>          ret = tegra_pcie_dw_parse_dt(pcie);
>          if (ret < 0) {
> -               dev_err(dev, "Failed to parse device tree: %d\n", ret);
> +               const char *level = KERN_ERR;
> +
> +               if (ret == -EPROBE_DEFER)
> +                       level = KERN_DEBUG;
> +
> +               dev_printk(level, dev,
> +                          dev_fmt("Failed to parse device tree: %d\n"),
> +                          ret);
>                  return ret;
>          }
> 
>          ret = tegra_pcie_get_slot_regulators(pcie);
>          if (ret < 0) {
> -               dev_err(dev, "Failed to get slot regulators: %d\n", ret);
> +               const char *level = KERN_ERR;
> +
> +               if (ret == -EPROBE_DEFER)
> +                       level = KERN_DEBUG;
> +
> +               dev_printk(level, dev,
> +                          dev_fmt("Failed to get slot regulators: %d\n"),
> +                          ret);
>                  return ret;
>          }
> 
> --
> 2.24.1
> 

Reviewed-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
