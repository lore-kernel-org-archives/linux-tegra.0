From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH V2 3/5] usb: xhci: tegra: Add genpd support
Date: Mon, 15 Oct 2018 15:29:02 +0200
Message-ID: <CAPDyKFqSp_B6JjScXdZWmdWTi+h4TEt+GjUiqNSu=P4otENopA@mail.gmail.com>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com> <1538143910-24400-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538143910-24400-4-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 28 September 2018 at 16:11, Jon Hunter <jonathanh@nvidia.com> wrote:
> The generic power-domain framework has been updated to allow devices
> that require more than one power-domain to create a new device for
> each power-domain required and then link these new power-domain
> devices to the consumer device.
>
> Update the Tegra xHCI driver to use the new APIs provided by the
> generic power-domain framework so we can use the generic power-domain
> framework for managing the xHCI controllers power-domains. Please
> note that to maintain backward compatibility with older device-tree
> blobs these new generic power-domain APIs are only used if the
> 'power-domains' property is present and otherwise we fall back to
> using the legacy Tegra APIs for managing the power-domains.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

If not too late, feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/usb/host/xhci-tegra.c | 89 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 77 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index a586a7930a3d..696008ecc26e 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -18,6 +18,7 @@
>  #include <linux/phy/tegra/xusb.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
> @@ -194,6 +195,11 @@ struct tegra_xusb {
>         struct reset_control *host_rst;
>         struct reset_control *ss_rst;
>
> +       struct device *genpd_dev_host;
> +       struct device *genpd_dev_ss;
> +       struct device_link *genpd_dl_host;
> +       struct device_link *genpd_dl_ss;
> +
>         struct phy **phys;
>         unsigned int num_phys;
>
> @@ -928,6 +934,57 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
>         return 0;
>  }
>
> +static void tegra_xusb_powerdomain_remove(struct device *dev,
> +                                         struct tegra_xusb *tegra)
> +{
> +       if (tegra->genpd_dl_ss)
> +               device_link_del(tegra->genpd_dl_ss);
> +       if (tegra->genpd_dl_host)
> +               device_link_del(tegra->genpd_dl_host);
> +       if (tegra->genpd_dev_ss)
> +               dev_pm_domain_detach(tegra->genpd_dev_ss, true);
> +       if (tegra->genpd_dev_host)
> +               dev_pm_domain_detach(tegra->genpd_dev_host, true);
> +}
> +
> +static int tegra_xusb_powerdomain_init(struct device *dev,
> +                                      struct tegra_xusb *tegra)
> +{
> +       int err;
> +
> +       tegra->genpd_dev_host = dev_pm_domain_attach_by_name(dev, "xusb_host");
> +       if (IS_ERR(tegra->genpd_dev_host)) {
> +               err = PTR_ERR(tegra->genpd_dev_host);
> +               dev_err(dev, "failed to get host pm-domain: %d\n", err);
> +               return err;
> +       }
> +
> +       tegra->genpd_dev_ss = dev_pm_domain_attach_by_name(dev, "xusb_ss");
> +       if (IS_ERR(tegra->genpd_dev_ss)) {
> +               err = PTR_ERR(tegra->genpd_dev_ss);
> +               dev_err(dev, "failed to get superspeed pm-domain: %d\n", err);
> +               return err;
> +       }
> +
> +       tegra->genpd_dl_host = device_link_add(dev, tegra->genpd_dev_host,
> +                                              DL_FLAG_PM_RUNTIME |
> +                                              DL_FLAG_STATELESS);
> +       if (!tegra->genpd_dl_host) {
> +               dev_err(dev, "adding host device link failed!\n");
> +               return -ENODEV;
> +       }
> +
> +       tegra->genpd_dl_ss = device_link_add(dev, tegra->genpd_dev_ss,
> +                                            DL_FLAG_PM_RUNTIME |
> +                                            DL_FLAG_STATELESS);
> +       if (!tegra->genpd_dl_ss) {
> +               dev_err(dev, "adding superspeed device link failed!\n");
> +               return -ENODEV;
> +       }
> +
> +       return 0;
> +}
> +
>  static int tegra_xusb_probe(struct platform_device *pdev)
>  {
>         struct tegra_xusb_mbox_msg msg;
> @@ -1038,7 +1095,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>                 goto put_padctl;
>         }
>
> -       if (!pdev->dev.pm_domain) {
> +       if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
>                 tegra->host_rst = devm_reset_control_get(&pdev->dev,
>                                                          "xusb_host");
>                 if (IS_ERR(tegra->host_rst)) {
> @@ -1069,17 +1126,22 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>                                                         tegra->host_clk,
>                                                         tegra->host_rst);
>                 if (err) {
> +                       tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
>                         dev_err(&pdev->dev,
>                                 "failed to enable XUSBC domain: %d\n", err);
> -                       goto disable_xusba;
> +                       goto put_padctl;
>                 }
> +       } else {
> +               err = tegra_xusb_powerdomain_init(&pdev->dev, tegra);
> +               if (err)
> +                       goto put_powerdomains;
>         }
>
>         tegra->supplies = devm_kcalloc(&pdev->dev, tegra->soc->num_supplies,
>                                        sizeof(*tegra->supplies), GFP_KERNEL);
>         if (!tegra->supplies) {
>                 err = -ENOMEM;
> -               goto disable_xusbc;
> +               goto put_powerdomains;
>         }
>
>         for (i = 0; i < tegra->soc->num_supplies; i++)
> @@ -1089,7 +1151,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>                                       tegra->supplies);
>         if (err) {
>                 dev_err(&pdev->dev, "failed to get regulators: %d\n", err);
> -               goto disable_xusbc;
> +               goto put_powerdomains;
>         }
>
>         for (i = 0; i < tegra->soc->num_types; i++)
> @@ -1099,7 +1161,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>                                    sizeof(*tegra->phys), GFP_KERNEL);
>         if (!tegra->phys) {
>                 err = -ENOMEM;
> -               goto disable_xusbc;
> +               goto put_powerdomains;
>         }
>
>         for (i = 0, k = 0; i < tegra->soc->num_types; i++) {
> @@ -1115,7 +1177,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>                                         "failed to get PHY %s: %ld\n", prop,
>                                         PTR_ERR(phy));
>                                 err = PTR_ERR(phy);
> -                               goto disable_xusbc;
> +                               goto put_powerdomains;
>                         }
>
>                         tegra->phys[k++] = phy;
> @@ -1126,7 +1188,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>                                     dev_name(&pdev->dev));
>         if (!tegra->hcd) {
>                 err = -ENOMEM;
> -               goto disable_xusbc;
> +               goto put_powerdomains;
>         }
>
>         /*
> @@ -1222,12 +1284,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>  disable_rpm:
>         pm_runtime_disable(&pdev->dev);
>         usb_put_hcd(tegra->hcd);
> -disable_xusbc:
> -       if (!pdev->dev.pm_domain)
> +put_powerdomains:
> +       if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
>                 tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
> -disable_xusba:
> -       if (!pdev->dev.pm_domain)
>                 tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
> +       } else {
> +               tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
> +       }
>  put_padctl:
>         tegra_xusb_padctl_put(tegra->padctl);
>         return err;
> @@ -1249,9 +1312,11 @@ static int tegra_xusb_remove(struct platform_device *pdev)
>         pm_runtime_put_sync(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
>
> -       if (!pdev->dev.pm_domain) {
> +       if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
>                 tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
>                 tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
> +       } else {
> +               tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
>         }
>
>         tegra_xusb_padctl_put(tegra->padctl);
> --
> 2.7.4
>
