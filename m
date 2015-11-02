From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 7/8] Start migrating XUSB away from MFD
Date: Mon, 2 Nov 2015 12:47:33 +0000
Message-ID: <20151102124732.GW4058@x1>
References: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
 <1446465323-9493-8-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446465323-9493-8-git-send-email-martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Martyn Welch <martyn-UcCTFicEjwugMbh0pXVFDA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 02 Nov 2015, Martyn Welch wrote:

> From: Martyn Welch <martyn-UcCTFicEjwugMbh0pXVFDA@public.gmane.org>
>=20
> This is my initial attempt to get xusb working without being a MFD on=
 the
> latest upstream kernel. It's still a bit hacky in places, but does se=
em to
> get the USB2 up and working (USB3 device is recognised as a USB3 devi=
ce
> rather than enumberating as a USB2 device).

After my 20 second look at the 2 patches of this set you sent me, I've
concluded that it looks barking mad.  In patch 2 you're adding the
XUSB MFD driver, then in this patch you're telling us that you're
moving away from MFD despite adding more code to the subsystem.

Besides, I'm never applying a patch that self confesses to be "hacky
in places" into Mainline, ever.

> ---
>  drivers/mailbox/tegra-xusb-mailbox.c |  16 ++---
>  drivers/mfd/tegra-xusb.c             | 122 +++++++++++++++++++++++++=
++++++----
>  drivers/usb/host/xhci-tegra.c        |  52 +++++++++------
>  include/soc/tegra/xusb.h             |   4 ++
>  4 files changed, 152 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/mailbox/tegra-xusb-mailbox.c b/drivers/mailbox/t=
egra-xusb-mailbox.c
> index 4e2477d..8924a6d 100644
> --- a/drivers/mailbox/tegra-xusb-mailbox.c
> +++ b/drivers/mailbox/tegra-xusb-mailbox.c
> @@ -220,15 +220,11 @@ static struct mbox_chan *tegra_xusb_mbox_of_xla=
te(struct mbox_controller *ctlr,
>  	return chan;
>  }
> =20
> -static const struct of_device_id tegra_xusb_mbox_of_match[] =3D {
> -	{ .compatible =3D "nvidia,tegra124-xusb-mbox" },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, tegra_xusb_mbox_of_match);
> -
>  static int tegra_xusb_mbox_probe(struct platform_device *pdev)
>  {
>  	struct tegra_xusb_mbox *mbox;
> +	struct platform_device *parent;
> +	struct tegra_xusb_shared_regs *sregs;
>  	int ret;
> =20
>  	mbox =3D devm_kzalloc(&pdev->dev, sizeof(*mbox), GFP_KERNEL);
> @@ -236,7 +232,8 @@ static int tegra_xusb_mbox_probe(struct platform_=
device *pdev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, mbox);
>  	spin_lock_init(&mbox->lock);
> -	mbox->fpci_regs =3D dev_get_drvdata(pdev->dev.parent);
> +	sregs =3D pdev->dev.platform_data;
> +	mbox->fpci_regs =3D sregs->fpci_regs;
> =20
>  	mbox->mbox.dev =3D &pdev->dev;
>  	mbox->mbox.chans =3D devm_kcalloc(&pdev->dev, XUSB_MBOX_NUM_CHANS,
> @@ -249,7 +246,9 @@ static int tegra_xusb_mbox_probe(struct platform_=
device *pdev)
>  	mbox->mbox.txpoll_period =3D 1;
>  	mbox->mbox.of_xlate =3D tegra_xusb_mbox_of_xlate;
> =20
> -	mbox->irq =3D platform_get_irq(pdev, 0);
> +	parent =3D to_platform_device(pdev->dev.parent);
> +
> +	mbox->irq =3D platform_get_irq(parent, 1);
>  	if (mbox->irq < 0)
>  		return mbox->irq;
>  	ret =3D devm_request_irq(&pdev->dev, mbox->irq, tegra_xusb_mbox_irq=
, 0,
> @@ -280,7 +279,6 @@ static struct platform_driver tegra_xusb_mbox_dri=
ver =3D {
>  	.remove =3D tegra_xusb_mbox_remove,
>  	.driver =3D {
>  		.name =3D "tegra-xusb-mbox",
> -		.of_match_table =3D tegra_xusb_mbox_of_match,
>  	},
>  };
>  module_platform_driver(tegra_xusb_mbox_driver);
> diff --git a/drivers/mfd/tegra-xusb.c b/drivers/mfd/tegra-xusb.c
> index e11fa23..e9cb365 100644
> --- a/drivers/mfd/tegra-xusb.c
> +++ b/drivers/mfd/tegra-xusb.c
> @@ -18,6 +18,8 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> =20
> +#include <soc/tegra/xusb.h>
> +
>  static const struct of_device_id tegra_xusb_of_match[] =3D {
>  	{ .compatible =3D "nvidia,tegra124-xusb", },
>  	{},
> @@ -30,39 +32,133 @@ static struct regmap_config tegra_fpci_regmap_co=
nfig =3D {
>  	.reg_stride =3D 4,
>  };
> =20
> +struct tegra_xusb_priv {
> +	struct platform_device *mbox_pdev;
> +	struct platform_device *xhci_pdev;
> +};
> +
> +static struct platform_device *tegra_xusb_add_device(struct device *=
parent,
> +	const char *name, int id, const struct resource *res,
> +	unsigned int num_res, const void *data, size_t size_data)
> +{
> +	int ret =3D -ENOMEM;
> +	struct platform_device *pdev;
> +
> +	pdev =3D platform_device_alloc(name, id);
> +	if (!pdev)
> +		goto err_alloc;
> +
> +	pdev->dev.parent =3D parent;
> +	pdev->dev.dma_mask =3D parent->dma_mask;
> +	pdev->dev.dma_parms =3D parent->dma_parms;
> +	pdev->dev.coherent_dma_mask =3D parent->coherent_dma_mask;
> +	pdev->dev.of_node =3D parent->of_node;
> +
> +	ret =3D platform_device_add_resources(pdev,
> +			res, num_res);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D platform_device_add_data(pdev,
> +			data, size_data);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D platform_device_add(pdev);
> +	if (ret)
> +		goto err;
> +
> +	return pdev;
> +
> +err:
> +	kfree(pdev->dev.dma_mask);
> +
> +err_alloc:
> +	platform_device_put(pdev);
> +	return ERR_PTR(ret);
> +}
> +
>  static int tegra_xusb_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> -	struct regmap *fpci_regs;
>  	void __iomem *fpci_base;
>  	int ret;
> +	struct tegra_xusb_shared_regs *sregs;
> +	struct tegra_xusb_priv *priv;
> +
> +	sregs =3D devm_kzalloc(&pdev->dev, sizeof(*sregs), GFP_KERNEL);
> +	if (!sregs)
> +		return -ENOMEM;
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> =20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	/*
> +	  The registers are a bit jumbled up:
> +
> +	  xhci uses:    0x70098000 - 0x700980cf
> +	  mailbox uses: 0x700980e0 - 0x700980f3
> +	  xhci uses:    0x7009841c - 0x7009841f - Undocumented paging regis=
ter
> +	  mailbox uses: 0x70098428 - 0x7009842b
> +	  xhci uses:    0x70098800 - 0x700989ff - Undocumented paging windo=
w
> +
> +	  Use a regmap to cover this area and pass it to child nodes.
> +	*/
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
>  	fpci_base =3D devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(fpci_base))
> -		return PTR_ERR(fpci_base);
> +	if (IS_ERR(fpci_base)) {
> +		ret =3D PTR_ERR(fpci_base);
> +		dev_err(&pdev->dev, "Failed to get shared resource: %d\n", ret);
> +		return ret;
> +	}
> =20
>  	tegra_fpci_regmap_config.max_register =3D res->end - res->start - 3=
;
> -	fpci_regs =3D devm_regmap_init_mmio(&pdev->dev, fpci_base,
> -					  &tegra_fpci_regmap_config);
> -	if (IS_ERR(fpci_regs)) {
> -		ret =3D PTR_ERR(fpci_regs);
> +	sregs->fpci_regs =3D devm_regmap_init_mmio(&pdev->dev, fpci_base,
> +			&tegra_fpci_regmap_config);
> +	if (IS_ERR(sregs->fpci_regs)) {
> +		ret =3D PTR_ERR(sregs->fpci_regs);
>  		dev_err(&pdev->dev, "Failed to init regmap: %d\n", ret);
>  		return ret;
>  	}
> -	platform_set_drvdata(pdev, fpci_regs);
> =20
> -	ret =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->=
dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to add sub-devices: %d\n", ret);
> -		return ret;
> +	priv->mbox_pdev =3D tegra_xusb_add_device(&pdev->dev,
> +			"tegra-xusb-mbox", PLATFORM_DEVID_NONE, NULL, 0,
> +			sregs, sizeof(sregs));
> +	if (IS_ERR(priv->mbox_pdev)) {
> +		dev_err(&pdev->dev, "Failed to add mailbox subdevice\n");
> +		return PTR_ERR(priv->mbox_pdev);
> +	}
> +
> +	priv->xhci_pdev =3D tegra_xusb_add_device(&pdev->dev,
> +			"tegra-xhci", PLATFORM_DEVID_NONE, NULL, 0, sregs,
> +			sizeof(sregs));
> +	if (IS_ERR(priv->xhci_pdev)) {
> +		dev_err(&pdev->dev, "Failed to add xhci subdevice\n");
> +		return PTR_ERR(priv->xhci_pdev);
>  	}
> =20
> +	platform_set_drvdata(pdev, priv);
> +
> +	return 0;
> +}
> +
> +static int tegra_xusb_remove(struct platform_device *pdev)
> +{
> +	struct tegra_xusb_priv *priv;
> +
> +	priv =3D platform_get_drvdata(pdev);
> +
> +	platform_device_unregister(priv->xhci_pdev);
> +
> +	platform_device_unregister(priv->mbox_pdev);
> +
>  	return 0;
>  }
> =20
>  static struct platform_driver tegra_xusb_driver =3D {
>  	.probe =3D tegra_xusb_probe,
> +	.remove =3D tegra_xusb_remove,
>  	.driver =3D {
>  		.name =3D "tegra-xusb",
>  		.of_match_table =3D tegra_xusb_of_match,
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-te=
gra.c
> index d510dc5..0172fe2 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -598,7 +598,7 @@ static const struct tegra_xhci_soc_data tegra124_=
soc_data =3D {
>  MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
> =20
>  static const struct of_device_id tegra_xhci_of_match[] =3D {
> -	{ .compatible =3D "nvidia,tegra124-xhci", .data =3D &tegra124_soc_d=
ata },
> +	{ .compatible =3D "nvidia,tegra124-xusb", .data =3D &tegra124_soc_d=
ata },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, tegra_xhci_of_match);
> @@ -682,6 +682,8 @@ static int tegra_xhci_probe(struct platform_devic=
e *pdev)
>  	struct resource *res;
>  	struct usb_hcd *hcd;
>  	struct phy *phy;
> +	struct platform_device *parent;
> +	struct tegra_xusb_shared_regs *sregs;
>  	unsigned int i, j, k;
>  	int ret;
> =20
> @@ -693,7 +695,10 @@ static int tegra_xhci_probe(struct platform_devi=
ce *pdev)
>  	tegra->dev =3D &pdev->dev;
>  	platform_set_drvdata(pdev, tegra);
> =20
> -	match =3D of_match_device(tegra_xhci_of_match, &pdev->dev);
> +	match =3D of_match_device(tegra_xhci_of_match, pdev->dev.parent);
> +	if(!match)
> +		return -ENODEV;
> +
>  	tegra->soc =3D match->data;
> =20
>  	hcd =3D usb_create_hcd(&tegra_xhci_hc_driver, &pdev->dev,
> @@ -702,9 +707,9 @@ static int tegra_xhci_probe(struct platform_devic=
e *pdev)
>  		return -ENOMEM;
>  	tegra->hcd =3D hcd;
> =20
> -	tegra->fpci_regs =3D dev_get_drvdata(pdev->dev.parent);
> +	parent =3D to_platform_device(pdev->dev.parent);
> =20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	res =3D platform_get_resource(parent, IORESOURCE_MEM, 0);
>  	hcd->regs =3D devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(hcd->regs)) {
>  		ret =3D PTR_ERR(hcd->regs);
> @@ -713,71 +718,74 @@ static int tegra_xhci_probe(struct platform_dev=
ice *pdev)
>  	hcd->rsrc_start =3D res->start;
>  	hcd->rsrc_len =3D resource_size(res);
> =20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	res =3D platform_get_resource(parent, IORESOURCE_MEM, 1);
>  	tegra->ipfs_base =3D devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(tegra->ipfs_base)) {
>  		ret =3D PTR_ERR(tegra->ipfs_base);
>  		goto put_hcd;
>  	}
> =20
> -	tegra->irq =3D platform_get_irq(pdev, 0);
> +	sregs =3D pdev->dev.platform_data;
> +	tegra->fpci_regs =3D sregs->fpci_regs;
> +
> +	tegra->irq =3D platform_get_irq(parent, 0);
>  	if (tegra->irq < 0) {
>  		ret =3D tegra->irq;
>  		goto put_hcd;
>  	}
> =20
> -	tegra->host_rst =3D devm_reset_control_get(&pdev->dev, "xusb_host")=
;
> +	tegra->host_rst =3D devm_reset_control_get(pdev->dev.parent, "xusb_=
host");
>  	if (IS_ERR(tegra->host_rst)) {
>  		ret =3D PTR_ERR(tegra->host_rst);
>  		goto put_hcd;
>  	}
> -	tegra->ss_rst =3D devm_reset_control_get(&pdev->dev, "xusb_ss");
> +	tegra->ss_rst =3D devm_reset_control_get(pdev->dev.parent, "xusb_ss=
");
>  	if (IS_ERR(tegra->ss_rst)) {
>  		ret =3D PTR_ERR(tegra->ss_rst);
>  		goto put_hcd;
>  	}
> =20
> -	tegra->host_clk =3D devm_clk_get(&pdev->dev, "xusb_host");
> +	tegra->host_clk =3D devm_clk_get(pdev->dev.parent, "xusb_host");
>  	if (IS_ERR(tegra->host_clk)) {
>  		ret =3D PTR_ERR(tegra->host_clk);
>  		goto put_hcd;
>  	}
> -	tegra->falc_clk =3D devm_clk_get(&pdev->dev, "xusb_falcon_src");
> +	tegra->falc_clk =3D devm_clk_get(pdev->dev.parent, "xusb_falcon_src=
");
>  	if (IS_ERR(tegra->falc_clk)) {
>  		ret =3D PTR_ERR(tegra->falc_clk);
>  		goto put_hcd;
>  	}
> -	tegra->ss_clk =3D devm_clk_get(&pdev->dev, "xusb_ss");
> +	tegra->ss_clk =3D devm_clk_get(pdev->dev.parent, "xusb_ss");
>  	if (IS_ERR(tegra->ss_clk)) {
>  		ret =3D PTR_ERR(tegra->ss_clk);
>  		goto put_hcd;
>  	}
> -	tegra->ss_src_clk =3D devm_clk_get(&pdev->dev, "xusb_ss_src");
> +	tegra->ss_src_clk =3D devm_clk_get(pdev->dev.parent, "xusb_ss_src")=
;
>  	if (IS_ERR(tegra->ss_src_clk)) {
>  		ret =3D PTR_ERR(tegra->ss_src_clk);
>  		goto put_hcd;
>  	}
> -	tegra->hs_src_clk =3D devm_clk_get(&pdev->dev, "xusb_hs_src");
> +	tegra->hs_src_clk =3D devm_clk_get(pdev->dev.parent, "xusb_hs_src")=
;
>  	if (IS_ERR(tegra->hs_src_clk)) {
>  		ret =3D PTR_ERR(tegra->hs_src_clk);
>  		goto put_hcd;
>  	}
> -	tegra->fs_src_clk =3D devm_clk_get(&pdev->dev, "xusb_fs_src");
> +	tegra->fs_src_clk =3D devm_clk_get(pdev->dev.parent, "xusb_fs_src")=
;
>  	if (IS_ERR(tegra->fs_src_clk)) {
>  		ret =3D PTR_ERR(tegra->fs_src_clk);
>  		goto put_hcd;
>  	}
> -	tegra->pll_u_480m =3D devm_clk_get(&pdev->dev, "pll_u_480m");
> +	tegra->pll_u_480m =3D devm_clk_get(pdev->dev.parent, "pll_u_480m");
>  	if (IS_ERR(tegra->pll_u_480m)) {
>  		ret =3D PTR_ERR(tegra->pll_u_480m);
>  		goto put_hcd;
>  	}
> -	tegra->clk_m =3D devm_clk_get(&pdev->dev, "clk_m");
> +	tegra->clk_m =3D devm_clk_get(pdev->dev.parent, "clk_m");
>  	if (IS_ERR(tegra->clk_m)) {
>  		ret =3D PTR_ERR(tegra->clk_m);
>  		goto put_hcd;
>  	}
> -	tegra->pll_e =3D devm_clk_get(&pdev->dev, "pll_e");
> +	tegra->pll_e =3D devm_clk_get(pdev->dev.parent, "pll_e");
>  	if (IS_ERR(tegra->pll_e)) {
>  		ret =3D PTR_ERR(tegra->pll_e);
>  		goto put_hcd;
> @@ -812,7 +820,6 @@ static int tegra_xhci_probe(struct platform_devic=
e *pdev)
>  		ret =3D PTR_ERR(tegra->mbox_chan);
>  		goto disable_regulator;
>  	}
> -
>  	for (i =3D 0; i < tegra->soc->num_types; i++)
>  		tegra->num_phys +=3D tegra->soc->phy_types[i].num;
>  	tegra->phys =3D devm_kcalloc(&pdev->dev, tegra->num_phys,
> @@ -821,6 +828,7 @@ static int tegra_xhci_probe(struct platform_devic=
e *pdev)
>  		ret =3D -ENOMEM;
>  		goto put_mbox;
>  	}
> +
>  	for (i =3D 0, k =3D 0; i < tegra->soc->num_types; i++) {
>  		char prop[8];
> =20
> @@ -925,13 +933,17 @@ static struct platform_driver tegra_xhci_driver=
 =3D {
>  	.driver =3D {
>  		.name =3D "tegra-xhci",
>  		.pm =3D &tegra_xhci_pm_ops,
> -		.of_match_table =3D tegra_xhci_of_match,
>  	},
>  };
> =20
> +static const struct xhci_driver_overrides tegra_xhci_overrides __ini=
tconst =3D {
> +	.extra_priv_size =3D sizeof(struct xhci_hcd),
> +	.reset =3D tegra_xhci_setup,
> +};
> +
>  static int __init tegra_xhci_init(void)
>  {
> -	xhci_init_driver(&tegra_xhci_hc_driver, tegra_xhci_setup);
> +	xhci_init_driver(&tegra_xhci_hc_driver, &tegra_xhci_overrides);
>  	return platform_driver_register(&tegra_xhci_driver);
>  }
>  module_init(tegra_xhci_init);
> diff --git a/include/soc/tegra/xusb.h b/include/soc/tegra/xusb.h
> index 0136dc1..d3c4dbd 100644
> --- a/include/soc/tegra/xusb.h
> +++ b/include/soc/tegra/xusb.h
> @@ -47,4 +47,8 @@ struct tegra_xusb_mbox_msg {
>  	u32 data;
>  };
> =20
> +struct tegra_xusb_shared_regs {
> +	struct regmap *fpci_regs;
> +};
> +
>  #endif /* __SOC_TEGRA_XUSB_H__ */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
