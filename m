From: Stefan Agner <stefan@agner.ch>
Subject: Re: [RESEND PATCH 2/5] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Date: Thu, 31 May 2018 19:54:08 +0200
Message-ID: <047a9a5e72c8db52858a505865d4f720@agner.ch>
References: <cover.1526990589.git.stefan@agner.ch>
 <86fdf19ec92b732709732fb60199f16488b4b727.1526990589.git.stefan@agner.ch>
 <20180528000422.7f18dc5f@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180528000422.7f18dc5f@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, boris.brezillon@bootlin.com, robh+dt@kernel.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, mark.rutland@arm.com, thierry.reding@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, dev@lynxeye.de, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Miquel, Boris,

[also adding Rob to to since it is DT related]

On 28.05.2018 00:04, Miquel Raynal wrote:
> Hi Stefan,
> 
> I just see your v2 while I'm sending my review on the driver, will
> probably wait for v4 then ;)
> 
> Thanks for the work though!
> Miquèl
> 
> On Tue, 22 May 2018 14:07:06 +0200, Stefan Agner <stefan@agner.ch>
> wrote:
> 
>> Add support for the NAND flash controller found on NVIDIA
>> Tegra 2 SoCs. This implementation does not make use of the
>> command queue feature. Regular operations/data transfers are
>> done in PIO mode. Page read/writes with hardware ECC make
>> use of the DMA for data transfer.
>>
>> Signed-off-by: Lucas Stach <dev@lynxeye.de>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
> 
> [...]
> 

[...]

>> +
>> +static int tegra_nand_probe(struct platform_device *pdev)
>> +{
>> +	struct reset_control *rst;
>> +	struct tegra_nand *nand;
> 
> Would you mind having another name for the tegra_nand structure than
> just 'nand'? I found it confusing as, following Boris comment, it won't
> be a 'NAND device' structure but rather more a controller structure.
> 
>> +	struct nand_chip *chip;
>> +	struct mtd_info *mtd;
>> +	struct resource *res;
>> +	unsigned long value;
> 
> s/value/reg/ ? or something more explicit?
> 
>> +	int irq, err = 0;
>> +
>> +	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
>> +	if (!nand)
>> +		return -ENOMEM;
>> +
>> +	nand->dev = &pdev->dev;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	nand->regs = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(nand->regs))
>> +		return PTR_ERR(nand->regs);
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	err = devm_request_irq(&pdev->dev, irq, tegra_nand_irq, 0,
>> +			       dev_name(&pdev->dev), nand);
>> +	if (err)
>> +		return err;
>> +
>> +	rst = devm_reset_control_get(&pdev->dev, "nand");
>> +	if (IS_ERR(rst))
>> +		return PTR_ERR(rst);
>> +
>> +	nand->clk = devm_clk_get(&pdev->dev, "nand");
>> +	if (IS_ERR(nand->clk))
>> +		return PTR_ERR(nand->clk);
>> +
>> +	nand->wp_gpio = gpiod_get_optional(&pdev->dev, "wp-gpios",
>> +					   GPIOD_OUT_HIGH);
>> +	if (IS_ERR(nand->wp_gpio))
>> +		return PTR_ERR(nand->wp_gpio);
>> +
>> +	err = clk_prepare_enable(nand->clk);
>> +	if (err)
>> +		return err;
>> +
>> +	reset_control_assert(rst);
>> +	udelay(2);
>> +	reset_control_deassert(rst);
>> +
>> +	value = HWSTATUS_RDSTATUS_MASK(1) | HWSTATUS_RDSTATUS_VALUE(0) |
>> +		HWSTATUS_RBSY_MASK(NAND_STATUS_READY) |
>> +		HWSTATUS_RBSY_VALUE(NAND_STATUS_READY);
>> +	writel(NAND_CMD_STATUS, nand->regs + HWSTATUS_CMD);
>> +	writel(value, nand->regs + HWSTATUS_MASK);
>> +
>> +	init_completion(&nand->command_complete);
>> +	init_completion(&nand->dma_complete);
>> +
>> +	/* clear interrupts */
>> +	value = readl(nand->regs + ISR);
>> +	writel(value, nand->regs + ISR);
>> +
>> +	writel(DMA_CTRL_IS_DONE, nand->regs + DMA_CTRL);
>> +
>> +	/* enable interrupts */
>> +	value = IER_UND | IER_OVR | IER_CMD_DONE | IER_ECC_ERR | IER_GIE;
>> +	writel(value, nand->regs + IER);
>> +
>> +	/* reset config */
>> +	writel(0, nand->regs + CFG);
>> +
>> +	chip = &nand->chip;
>> +	mtd = nand_to_mtd(chip);
>> +
>> +	mtd->dev.parent = &pdev->dev;
>> +	mtd->name = "tegra_nand";
> 
> I just figured it was undocumented (yet) but you could have a label
> string property in your nand DT node that tells you the name of the
> MTD device instead of something too generic like tegra_nand.
> 

Using label in the NAND chip subnode actually causes current U-Boot to
delete (!!) the chip node and create partitions on the controller node.

See:
https://elixir.bootlin.com/u-boot/latest/source/common/fdt_support.c#L757

The code essentially uses the property label to detect whether its a
NAND chip or a partition...

At least this is the case when using fdt_fixup_mtdparts and passing the
controller compatible ("nvidia,tegra20-nand") in node_info, what our
downstream U-Boot is currently doing. Maybe we should pass the
compatible property of the NAND chip? But afaik, chips do not have a
compatible necessarily.

So using label in the chip node is currently a no-go for me.

Will send out v3 soon.

--
Stefan


>> +	mtd->owner = THIS_MODULE;
>> +
>> +	nand_set_flash_node(chip, pdev->dev.of_node);
>> +	nand_set_controller_data(chip, nand);
>> +
>> +	chip->options = NAND_NO_SUBPAGE_WRITE;
>> +	chip->exec_op = tegra_nand_exec_op;
>> +	chip->select_chip = tegra_nand_select_chip;
>> +	tegra_nand_setup_timing(nand, 0);
> 
> You really should implement ->setup_data_interface() and let the core
> handle the timings issue entirely (mind that chipnr is not the NAND
> chip id but more the CS id asserted for the pointed NAND chip).
>  
>> +
>> +	err = nand_scan_ident(mtd, 1, NULL);
>> +	if (err)
>> +		goto err_disable_clk;
>> +
>> +	if (chip->bbt_options & NAND_BBT_USE_FLASH)
>> +		chip->bbt_options |= NAND_BBT_NO_OOB;
>> +
>> +	nand->data_buf = dmam_alloc_coherent(&pdev->dev, mtd->writesize,
>> +					    &nand->data_dma, GFP_KERNEL);
> 
> Do you need these buffers before nand_scan_tail() or could you simply
> use the ones allocated by the core right after?
> 
>> +	if (!nand->data_buf) {
>> +		err = -ENOMEM;
>> +		goto err_disable_clk;
>> +	}
>> +
>> +	nand->oob_buf = dmam_alloc_coherent(&pdev->dev, mtd->oobsize,
>> +					    &nand->oob_dma, GFP_KERNEL);
>> +	if (!nand->oob_buf) {
>> +		err = -ENOMEM;
>> +		goto err_disable_clk;
>> +	}
>> +
>> +	chip->ecc.mode = NAND_ECC_HW;
>> +	chip->ecc.size = 512;
>> +	chip->ecc.read_page = tegra_nand_read_page;
>> +	chip->ecc.write_page = tegra_nand_write_page;
>> +
>> +	value = readl(nand->regs + CFG);
>> +	value |= CFG_PIPE_EN | CFG_SKIP_SPARE | CFG_SKIP_SPARE_SIZE_4 |
>> +		 CFG_TAG_BYTE_SIZE(mtd_ooblayout_count_freebytes(mtd) - 1);
>> +
>> +	if (chip->options & NAND_BUSWIDTH_16)
>> +		value |= CFG_BUS_WIDTH_16;
>> +
>> +	switch (mtd->oobsize) {
>> +	case 16:
>> +		mtd_set_ooblayout(mtd, &tegra_nand_oob_16_ops);
>> +		chip->ecc.strength = 1;
>> +		chip->ecc.bytes = 4;
>> +		break;
>> +	case 64:
>> +		mtd_set_ooblayout(mtd, &tegra_nand_oob_64_ops);
>> +		chip->ecc.strength = 8;
>> +		chip->ecc.bytes = 18;
>> +		value |= CFG_ECC_SEL | CFG_TVAL_8;
>> +		break;
>> +	case 128:
>> +		mtd_set_ooblayout(mtd, &tegra_nand_oob_128_ops);
>> +		chip->ecc.strength = 8;
>> +		chip->ecc.bytes = 18;
>> +		value |= CFG_ECC_SEL | CFG_TVAL_8;
>> +		break;
>> +	case 224:
>> +		mtd_set_ooblayout(mtd, &tegra_nand_oob_224_ops);
>> +		chip->ecc.strength = 8;
>> +		chip->ecc.bytes = 18;
>> +		value |= CFG_ECC_SEL | CFG_TVAL_8;
>> +		break;
>> +	default:
>> +		dev_err(&pdev->dev, "unhandled OOB size %d\n", mtd->oobsize);
>> +		err = -ENODEV;
>> +		goto err_disable_clk;
>> +	}
>> +
>> +	switch (mtd->writesize) {
>> +	case 256:
>> +		value |= CFG_PS_256;
>> +		break;
>> +	case 512:
>> +		value |= CFG_PS_512;
>> +		break;
>> +	case 1024:
>> +		value |= CFG_PS_1024;
>> +		break;
>> +	case 2048:
>> +		value |= CFG_PS_2048;
>> +		break;
>> +	case 4096:
>> +		value |= CFG_PS_4096;
>> +		break;
>> +	default:
>> +		dev_err(&pdev->dev, "unhandled writesize %d\n", mtd->writesize);
>> +		err = -ENODEV;
>> +		goto err_disable_clk;
>> +	}
>> +
>> +	writel(value, nand->regs + CFG);
>> +
>> +	tegra_nand_setup_chiptiming(nand);
>> +
>> +	err = nand_scan_tail(mtd);
>> +	if (err)
>> +		goto err_disable_clk;
>> +
>> +	err = mtd_device_register(mtd, NULL, 0);
>> +	if (err)
>> +		goto err_cleanup_nand;
>> +
>> +	platform_set_drvdata(pdev, nand);
>> +
>> +	return 0;
>> +
>> +err_cleanup_nand:
>> +	nand_cleanup(chip);
>> +err_disable_clk:
>> +	clk_disable_unprepare(nand->clk);
>> +	return err;
>> +}
>> +
>> +static int tegra_nand_remove(struct platform_device *pdev)
>> +{
>> +	struct tegra_nand *nand = platform_get_drvdata(pdev);
>> +
>> +	nand_release(nand_to_mtd(&nand->chip));
>> +
>> +	clk_disable_unprepare(nand->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id tegra_nand_of_match[] = {
>> +	{ .compatible = "nvidia,tegra20-nand" },
>> +	{ /* sentinel */ }
>> +};
>> +
>> +static struct platform_driver tegra_nand_driver = {
>> +	.driver = {
>> +		.name = "tegra-nand",
>> +		.of_match_table = tegra_nand_of_match,
>> +	},
>> +	.probe = tegra_nand_probe,
>> +	.remove = tegra_nand_remove,
>> +};
>> +module_platform_driver(tegra_nand_driver);
>> +
>> +MODULE_DESCRIPTION("NVIDIA Tegra NAND driver");
>> +MODULE_AUTHOR("Thierry Reding <thierry.reding@nvidia.com>");
>> +MODULE_AUTHOR("Lucas Stach <dev@lynxeye.de>");
>> +MODULE_AUTHOR("Stefan Agner <stefan@agner.ch>");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DEVICE_TABLE(of, tegra_nand_of_match);
