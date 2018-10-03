From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH V2 3/5] usb: xhci: tegra: Add genpd support
Date: Wed, 3 Oct 2018 11:52:13 +0200
Message-ID: <CAPDyKFrfcQX0-QrMKy=E=rif9-SjSfxc+LTMBUn5oqOquRdqRg@mail.gmail.com>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com> <1538143910-24400-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538143910-24400-4-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

[...]

>  static int tegra_xusb_probe(struct platform_device *pdev)
>  {
>         struct tegra_xusb_mbox_msg msg;
> @@ -1038,7 +1095,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>                 goto put_padctl;
>         }
>
> -       if (!pdev->dev.pm_domain) {
> +       if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {

I am assuming the original check was because allowing the two
power-domains to be (wrongly) modeled as one (or as a
master+subdomain)?

I was thinking that, perhaps we should add a new OF helper function,
where one can get the number of specifiers being listed in the
power-domains property. Would that help to easier distinguish what to
do when dealing with backwards compatibility?

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

[...]

Kind regards
Uffe
