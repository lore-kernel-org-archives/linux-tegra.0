From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Tue, 8 Nov 2016 12:07:55 -0700
Message-ID: <0e3e89a8-a2f1-68c2-0586-58902fb91587@wwwdotorg.org>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478083719-14836-1-git-send-email-smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/02/2016 04:48 AM, Suresh Mangipudi wrote:
> Add GPIO driver for T186 based platforms.
> Adds support for MAIN and AON GPIO's from T186.

I'm not sure how you/Thierry will approach merging this with the other 
GPIO driver he has, but here's a very quick review of this one in case 
it's useful.

> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c

> +#define TEGRA_MAIN_GPIO_PORT_INFO(port, cid, cind, npins)	\

A comment indicating what "cid" and "cind" mean (and perhaps the other 
parameters too) would be useful.

A brief description of the overall register layout and structure and 
differences between the MAIN/AON controllers would be useful.

> +[TEGRA_MAIN_GPIO_PORT_##port] = {				\
> +		.port_name = #port,				\
> +		.cont_id = cid,					\
> +		.port_index = cind,				\

Why not make the parameter names match the field names they're assigned to?

> +		.valid_pins = npins,				\
> +		.scr_offset = cid * 0x1000 + cind * 0x40,	\
> +		.reg_offset = cid * 0x1000 + cind * 0x200,	\

While C does define operator precedence rules that make that expression 
OK, I personally prefer using () to make it explict:

+		.reg_offset = (cid * 0x1000) + (cind * 0x200),	\

That way, the reader doesn't have to think/remember so much.

Also, if these values can be calculated based on .cont_id and 
.port_index, I wonder why we need to pre-calculate them here and/or what 
else could be pre-calculated from .cont_id/.port_index? I'm tend to 
either (a) just store .cont_id and .port_index and calculate everything 
from them always, or (b) store just derived data and not both storing 
.cont_id/.port_index.

> +static struct tegra_gpio_port_soc_info tegra_main_gpio_cinfo[] = {
> +	TEGRA_MAIN_GPIO_PORT_INFO(A, 2, 0, 7),
> +	TEGRA_MAIN_GPIO_PORT_INFO(B, 3, 0, 7),

I assume the entries in this file must be in the same order as the DT 
binding port IDs? A comment to that effect would be useful.

> +struct tegra_gpio_info;
> +
> +struct tegra_gpio_soc_info {
> +	const char *name;
> +	const struct tegra_gpio_port_soc_info *port;
> +	int nports;
> +};

This isn't information about an SoC; it's information about a 
controller, and there are 2 controllers within Tegra186. Rename to 
tegra_gpio_ctlr_info?

> +struct tegra_gpio_controller {
> +	int controller;
> +	int irq;
> +	struct tegra_gpio_info *tgi;
> +};
> +
> +struct tegra_gpio_info {

Is this structure per-bank/-port? Also, "info" seems to be used above 
for static configuration info/data. I think this should be called 
"tegra_gpio_port"?

> +	struct device *dev;
> +	int nbanks;
> +	void __iomem *gpio_regs;
> +	void __iomem *scr_regs;
> +	struct irq_domain *irq_domain;
> +	const struct tegra_gpio_soc_info *soc;
> +	struct tegra_gpio_controller tg_contrlr[MAX_GPIO_CONTROLLERS];
> +	struct gpio_chip gc;
> +	struct irq_chip ic;
> +};

> +#define GPIO_CNTRL_REG(tgi, gpio, roffset)				    \
> +	((tgi)->gpio_regs + (tgi)->soc->port[GPIO_PORT(gpio)].reg_offset + \
> +	(GPIO_REG_DIFF * GPIO_PIN(gpio)) + (roffset))

Writing a static inline function would make formatting and type safety 
easier.

> +static void tegra_gpio_update(struct tegra_gpio_info *tgi, u32 gpio,
> +				     u32 reg_offset,	u32 mask, u32 val)
> +{
> +	u32 rval;
> +
> +	rval = __raw_readl(GPIO_CNTRL_REG(tgi, gpio, reg_offset));
> +	rval = (rval & ~mask) | (val & mask);
> +	__raw_writel(rval, GPIO_CNTRL_REG(tgi, gpio, reg_offset));
> +}

If you use a regmap object rather than a raw MMIO pointer, I believe 
there's already a function that does this read-modify-write.

> +/* This function will return if the GPIO is accessible by CPU */
> +static bool gpio_is_accessible(struct tegra_gpio_info *tgi, u32 offset)

I'd prefer all functions use the same name prefix. "tegra_gpio" seems to 
be used so far. Actually, given there's already an existing Tegra GPIO 
driver, and this driver covers the new controller(s) in Tegra186, I'd 
prefer everything be named tegra186_gpio_xxx.

> +       if (cont_id  < 0)
> +               return false;

That should trigger a checkpatch error due to the presence of two spaces 
in the expression. Try running checkpatch and fixing any issues.

> +	val = __raw_readl(tgi->scr_regs + scr_offset +
> +			(pin * GPIO_SCR_DIFF) + GPIO_SCR_REG);
> +
> +	if ((val & GPIO_FULL_ACCESS) == GPIO_FULL_ACCESS)
> +		return true;

I'm not entirely convinced about this. It's possible to have only read 
or only write access. I believe the CPU can be assigned to an arbitrary 
bus master group, whereas the value of GPIO_FULL_ACCESS assumes it's on 
group 1. Do we actually need this function at all except for debug? I'd 
be tempted to just drop it and let all GPIO accesses be attempted. If 
the SCR is configured such that the CPU doesn't have access, writes 
should be ignored and reads return valid dummy data. That seems fine to me.

Also, this function isn't consistently used by all client-callable APIs. 
I'd expect it to be used from every function that's accessible via a 
function pointer in struct gpio_chip, if it's useful.

> +static void tegra_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			   int value)

> +	tegra_gpio_writel(tgi, val, offset, GPIO_OUT_VAL_REG);
> +	tegra_gpio_writel(tgi, 0, offset, GPIO_OUT_CTRL_REG);

Shouldn't this function *just* set the output value; any other setup 
should be done solely as part of direction_input/direction_output?

> +static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)

> +	tegra_gpio_enable(ctrlr->tgi, gpio);

Shouldn't this only happen when the client actually calls enable/disable?

> +	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
> +		irq_set_handler_locked(d, handle_level_irq);
> +	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
> +		irq_set_handler_locked(d, handle_edge_irq);

Shouldn't the handler be set before the IRQ is enabled?

> +static void tegra_gpio_irq_handler(struct irq_desc *desc)

> +	for (i = 0; i < MAX_GPIO_PORTS; ++i)
> +		port_map[i] = -1;
> +
> +	for (i = 0; i < tgi->soc->nports; ++i) {
> +		if (tgi->soc->port[i].cont_id == tg_cont->controller)
> +			port_map[tgi->soc->port[i].port_index] = i;
> +	}

I would have expected the code to use simple math here (iterate over all 
ports in the controller) rather than creating some kind of 
lookup/mapping table.

> +	chained_irq_enter(chip, desc);
> +	for (i = 0; i < MAX_GPIO_PORTS; i++) {
> +		port = port_map[i];
> +		if (port == -1)
> +			continue;
> +
> +		addr = tgi->soc->port[port].reg_offset;
> +		val = __raw_readl(tg_cont->tgi->gpio_regs + addr +
> +				GPIO_INT_STATUS_OFFSET + GPIO_STATUS_G1);
> +		gpio = tgi->gc.base + (port * 8);
> +		for_each_set_bit(pin, &val, 8)
> +			generic_handle_irq(gpio_to_irq(gpio + pin));

For edge-sensitive IRQs, doesn't the status need to be cleared before 
calling the handler, so that (a) the latched status is cleared, (b) if a 
new edge occurs after this point, that fact is recorded and the new IRQ 
handled?

> +#ifdef CONFIG_DEBUG_FS

Using a regmap might give you some of the debug logic for free.

> +static int tegra_gpio_probe(struct platform_device *pdev)
> +{
> +	struct tegra_gpio_info *tgi;
> +	struct resource *res;
> +	int bank;
> +	int gpio;
> +	int ret;
> +
> +	for (bank = 0;; bank++) {
> +		res = platform_get_resource(pdev, IORESOURCE_IRQ, bank);
> +		if (!res)
> +			break;
> +	}
> +	if (!bank) {
> +		dev_err(&pdev->dev, "No GPIO Controller found\n");
> +		return -ENODEV;
> +	}
...
 > +	tgi->nbanks = bank;

There should be a fixed number of IRQs in DT based on the controller 
definition; the value shouldn't be variable.

See Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt

> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt

The U-Boot Tegra186 GPIO driver might also be useful as a reference to 
how to use the DT binding and structure the driver:

> http://git.denx.de/?p=u-boot.git;a=blob;f=drivers/gpio/tegra186_gpio.c;h=1c681514db9f50e61a9db041ac2067c084db494c;hb=HEAD

> +	tgi->gc.ngpio			= tgi->soc->nports * 8;

This will leave some gaps in the GPIO numbering, since not all ports 
have 8 GPIOs. I think this is the correct thing to do, but IIRC Thierry 
found this caused some issues in the GPIO core since it attempts to 
query initial status of each GPIO. Did you see this issue during testing?

> +static int __init tegra_gpio_init(void)
> +{
> +	return platform_driver_register(&tegra_gpio_driver);
> +}
> +postcore_initcall(tegra_gpio_init);

I would have expected everything to use module_initcall() these days.
