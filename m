From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v3 4/6] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Date: Sat, 9 Jun 2018 09:18:33 +0200
Message-ID: <20180609091833.1a20db07@bbrezillon>
References: <20180531221637.6017-1-stefan@agner.ch>
        <20180531221637.6017-5-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180531221637.6017-5-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri,  1 Jun 2018 00:16:35 +0200
Stefan Agner <stefan@agner.ch> wrote:

> +
> +static int tegra_nand_chips_init(struct device *dev,
> +				 struct tegra_nand_controller *ctrl)
> +{
> +	struct device_node *np = dev->of_node;
> +	struct device_node *np_nand;
> +	int nchips = of_get_child_count(np);
> +	struct tegra_nand_chip *nand;
> +	struct mtd_info *mtd;
> +	struct nand_chip *chip;
> +	unsigned long config, bch_config = 0;
> +	int bits_per_step;
> +	int ret;
> +
> +	if (nchips != 1) {
> +		dev_err(dev, "Currently only one NAND chip supported\n");
> +		return -EINVAL;
> +	}
> +
> +	np_nand = of_get_next_child(np, NULL);
> +
> +	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
> +	if (!nand)
> +		return -ENOMEM;
> +
> +	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
> +
> +	if (IS_ERR(nand->wp_gpio)) {
> +		ret = PTR_ERR(nand->wp_gpio);
> +		dev_err(dev, "Failed to request WP GPIO: %d\n", ret);
> +		return ret;
> +	}
> +

You should retrieve the value of reg and store it somewhere in
tegra_nand_chip. ->select_chip() is passed a chip_CE id, and it has to
be converted into a ctrl_CE id. Right now you're assuming that ctrl_CE0
always drives chip_CE0, but that's not necessarily the case.

Also, you don't support multi-CE chips, so you should check the number
of entries in reg and fail if it's not 1.
