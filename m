From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] gpio: Add Tegra186 support
Date: Fri, 31 Mar 2017 15:10:06 +0200
Message-ID: <20170331131006.GC29779@ulmo.ba.sec>
References: <20170310162629.31455-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170310162629.31455-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2017 at 05:26:29PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra186 has two GPIO controllers that are largely register compatible
> between one another but are completely different from the controller
> found on earlier generations.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> - add pin names to allow easy lookup using the chardev interface
> - distinguish AON and main GPIO controllers by label
> - use gpiochip_get_data() instead of container_of()
> - use C99 initializers
>=20
> Hi Linus,
>=20
> This addresses all comments I got on the last revision, except for your
> request to use gpiolib's IRQ chip helpers. I investigated using it with
> the driver but still can't figure out how it's supposed to work given
> our requirement to service multiple parent interrupts.
>=20
> Thierry
>=20
>  drivers/gpio/Kconfig         |   8 +
>  drivers/gpio/Makefile        |   1 +
>  drivers/gpio/gpio-tegra186.c | 636 +++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 645 insertions(+)
>  create mode 100644 drivers/gpio/gpio-tegra186.c

Hi Linus,

any objections to merging this for v4.12? I know Laxman has some
reservations about the internal numbering, but I hope my explanation in
the other subthread shows that this is the simplest way to achieve what
we want with the least amount of surprises.

Thierry

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 05043071fc98..f74b61cfd113 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -431,6 +431,14 @@ config GPIO_TEGRA
>  	help
>  	  Say yes here to support GPIO pins on NVIDIA Tegra SoCs.
> =20
> +config GPIO_TEGRA186
> +	tristate "NVIDIA Tegra186 GPIO support"
> +	default ARCH_TEGRA_186_SOC
> +	depends on ARCH_TEGRA_186_SOC || COMPILE_TEST
> +	depends on OF_GPIO
> +	help
> +	  Say yes here to support GPIO pins on NVIDIA Tegra186 SoCs.
> +
>  config GPIO_TS4800
>  	tristate "TS-4800 DIO blocks and compatibles"
>  	depends on OF_GPIO
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index becb96c724fe..cad0eb2c3531 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -111,6 +111,7 @@ obj-$(CONFIG_GPIO_SYSCON)	+=3D gpio-syscon.o
>  obj-$(CONFIG_GPIO_TB10X)	+=3D gpio-tb10x.o
>  obj-$(CONFIG_GPIO_TC3589X)	+=3D gpio-tc3589x.o
>  obj-$(CONFIG_GPIO_TEGRA)	+=3D gpio-tegra.o
> +obj-$(CONFIG_GPIO_TEGRA186)	+=3D gpio-tegra186.o
>  obj-$(CONFIG_GPIO_TIMBERDALE)	+=3D gpio-timberdale.o
>  obj-$(CONFIG_GPIO_PALMAS)	+=3D gpio-palmas.o
>  obj-$(CONFIG_GPIO_TPIC2810)	+=3D gpio-tpic2810.o
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> new file mode 100644
> index 000000000000..87e02d9165d8
> --- /dev/null
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -0,0 +1,636 @@
> +/*
> + * Copyright (c) 2016-2017 NVIDIA Corporation
> + *
> + * Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + */
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/gpio/tegra186-gpio.h>
> +
> +#define TEGRA186_GPIO_ENABLE_CONFIG 0x00
> +#define  TEGRA186_GPIO_ENABLE_CONFIG_ENABLE BIT(0)
> +#define  TEGRA186_GPIO_ENABLE_CONFIG_OUT BIT(1)
> +#define  TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_NONE (0x0 << 2)
> +#define  TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_LEVEL (0x1 << 2)
> +#define  TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_SINGLE_EDGE (0x2 << 2)
> +#define  TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_DOUBLE_EDGE (0x3 << 2)
> +#define  TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_MASK (0x3 << 2)
> +#define  TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_LEVEL BIT(4)
> +#define  TEGRA186_GPIO_ENABLE_CONFIG_INTERRUPT BIT(6)
> +
> +#define TEGRA186_GPIO_DEBOUNCE_CONTROL 0x04
> +#define  TEGRA186_GPIO_DEBOUNCE_CONTROL_THRESHOLD(x) ((x) & 0xff)
> +
> +#define TEGRA186_GPIO_INPUT 0x08
> +#define  TEGRA186_GPIO_INPUT_HIGH BIT(0)
> +
> +#define TEGRA186_GPIO_OUTPUT_CONTROL 0x0c
> +#define  TEGRA186_GPIO_OUTPUT_CONTROL_FLOATED BIT(0)
> +
> +#define TEGRA186_GPIO_OUTPUT_VALUE 0x10
> +#define  TEGRA186_GPIO_OUTPUT_VALUE_HIGH BIT(0)
> +
> +#define TEGRA186_GPIO_INTERRUPT_CLEAR 0x14
> +
> +#define TEGRA186_GPIO_INTERRUPT_STATUS(x) (0x100 + (x) * 4)
> +
> +struct tegra_gpio_port {
> +	const char *name;
> +	unsigned int offset;
> +	unsigned int pins;
> +};
> +
> +struct tegra_gpio_soc {
> +	const struct tegra_gpio_port *ports;
> +	unsigned int num_ports;
> +	const char *name;
> +};
> +
> +struct tegra_gpio {
> +	struct gpio_chip gpio;
> +	struct irq_chip intc;
> +	unsigned int num_irq;
> +	unsigned int *irq;
> +
> +	const struct tegra_gpio_soc *soc;
> +
> +	void __iomem *base;
> +
> +	struct irq_domain *domain;
> +};
> +
> +static const struct tegra_gpio_port *
> +tegra186_gpio_get_port(struct tegra_gpio *gpio, unsigned int *pin)
> +{
> +	unsigned int start =3D 0, i;
> +
> +	for (i =3D 0; i < gpio->soc->num_ports; i++) {
> +		const struct tegra_gpio_port *port =3D &gpio->soc->ports[i];
> +
> +		if (*pin >=3D start && *pin < start + port->pins) {
> +			*pin -=3D start;
> +			return port;
> +		}
> +
> +		start +=3D port->pins;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void __iomem *tegra186_gpio_get_base(struct tegra_gpio *gpio,
> +					    unsigned int pin)
> +{
> +	const struct tegra_gpio_port *port;
> +
> +	port =3D tegra186_gpio_get_port(gpio, &pin);
> +	if (!port)
> +		return NULL;
> +
> +	return gpio->base + port->offset + pin * 0x20;
> +}
> +
> +static int tegra186_gpio_get_direction(struct gpio_chip *chip,
> +				       unsigned int offset)
> +{
> +	struct tegra_gpio *gpio =3D gpiochip_get_data(chip);
> +	void __iomem *base;
> +	u32 value;
> +
> +	base =3D tegra186_gpio_get_base(gpio, offset);
> +	if (WARN_ON(base =3D=3D NULL))
> +		return -ENODEV;
> +
> +	value =3D readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
> +	if (value & TEGRA186_GPIO_ENABLE_CONFIG_OUT)
> +		return GPIOF_DIR_OUT;
> +
> +	return GPIOF_DIR_IN;
> +}
> +
> +static int tegra186_gpio_direction_input(struct gpio_chip *chip,
> +					 unsigned int offset)
> +{
> +	struct tegra_gpio *gpio =3D gpiochip_get_data(chip);
> +	void __iomem *base;
> +	u32 value;
> +
> +	base =3D tegra186_gpio_get_base(gpio, offset);
> +	if (WARN_ON(base =3D=3D NULL))
> +		return -ENODEV;
> +
> +	value =3D readl(base + TEGRA186_GPIO_OUTPUT_CONTROL);
> +	value |=3D TEGRA186_GPIO_OUTPUT_CONTROL_FLOATED;
> +	writel(value, base + TEGRA186_GPIO_OUTPUT_CONTROL);
> +
> +	value =3D readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
> +	value |=3D TEGRA186_GPIO_ENABLE_CONFIG_ENABLE;
> +	value &=3D ~TEGRA186_GPIO_ENABLE_CONFIG_OUT;
> +	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
> +
> +	return 0;
> +}
> +
> +static int tegra186_gpio_direction_output(struct gpio_chip *chip,
> +					  unsigned int offset, int level)
> +{
> +	struct tegra_gpio *gpio =3D gpiochip_get_data(chip);
> +	void __iomem *base;
> +	u32 value;
> +
> +	/* configure output level first */
> +	chip->set(chip, offset, level);
> +
> +	base =3D tegra186_gpio_get_base(gpio, offset);
> +	if (WARN_ON(base =3D=3D NULL))
> +		return -EINVAL;
> +
> +	/* set the direction */
> +	value =3D readl(base + TEGRA186_GPIO_OUTPUT_CONTROL);
> +	value &=3D ~TEGRA186_GPIO_OUTPUT_CONTROL_FLOATED;
> +	writel(value, base + TEGRA186_GPIO_OUTPUT_CONTROL);
> +
> +	value =3D readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
> +	value |=3D TEGRA186_GPIO_ENABLE_CONFIG_ENABLE;
> +	value |=3D TEGRA186_GPIO_ENABLE_CONFIG_OUT;
> +	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
> +
> +	return 0;
> +}
> +
> +static int tegra186_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct tegra_gpio *gpio =3D gpiochip_get_data(chip);
> +	void __iomem *base;
> +	u32 value;
> +
> +	base =3D tegra186_gpio_get_base(gpio, offset);
> +	if (WARN_ON(base =3D=3D NULL))
> +		return -ENODEV;
> +
> +	value =3D readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
> +	if (value & TEGRA186_GPIO_ENABLE_CONFIG_OUT)
> +		value =3D readl(base + TEGRA186_GPIO_OUTPUT_VALUE);
> +	else
> +		value =3D readl(base + TEGRA186_GPIO_INPUT);
> +
> +	return value & BIT(0);
> +}
> +
> +static void tegra186_gpio_set(struct gpio_chip *chip, unsigned int offse=
t,
> +			      int level)
> +{
> +	struct tegra_gpio *gpio =3D gpiochip_get_data(chip);
> +	void __iomem *base;
> +	u32 value;
> +
> +	base =3D tegra186_gpio_get_base(gpio, offset);
> +	if (WARN_ON(base =3D=3D NULL))
> +		return;
> +
> +	value =3D readl(base + TEGRA186_GPIO_OUTPUT_VALUE);
> +	if (level =3D=3D 0)
> +		value &=3D ~TEGRA186_GPIO_OUTPUT_VALUE_HIGH;
> +	else
> +		value |=3D TEGRA186_GPIO_OUTPUT_VALUE_HIGH;
> +
> +	writel(value, base + TEGRA186_GPIO_OUTPUT_VALUE);
> +}
> +
> +static int tegra186_gpio_to_irq(struct gpio_chip *chip, unsigned int off=
set)
> +{
> +	struct tegra_gpio *gpio =3D gpiochip_get_data(chip);
> +
> +	return irq_find_mapping(gpio->domain, offset);
> +}
> +
> +static int tegra186_gpio_of_xlate(struct gpio_chip *chip,
> +				  const struct of_phandle_args *spec,
> +				  u32 *flags)
> +{
> +	struct tegra_gpio *gpio =3D gpiochip_get_data(chip);
> +	unsigned int port, pin, i, offset =3D 0;
> +
> +	if (WARN_ON(chip->of_gpio_n_cells < 2))
> +		return -EINVAL;
> +
> +	if (WARN_ON(spec->args_count < chip->of_gpio_n_cells))
> +		return -EINVAL;
> +
> +	port =3D spec->args[0] / 8;
> +	pin =3D spec->args[0] % 8;
> +
> +	if (port >=3D gpio->soc->num_ports) {
> +		dev_err(chip->parent, "invalid port number: %u\n", port);
> +		return -EINVAL;
> +	}
> +
> +	for (i =3D 0; i < port; i++)
> +		offset +=3D gpio->soc->ports[i].pins;
> +
> +	if (flags)
> +		*flags =3D spec->args[1];
> +
> +	return offset + pin;
> +}
> +
> +static void tegra186_irq_ack(struct irq_data *data)
> +{
> +	struct tegra_gpio *gpio =3D irq_data_get_irq_chip_data(data);
> +	void __iomem *base;
> +
> +	base =3D tegra186_gpio_get_base(gpio, data->hwirq);
> +	if (WARN_ON(base =3D=3D NULL))
> +		return;
> +
> +	writel(1, base + TEGRA186_GPIO_INTERRUPT_CLEAR);
> +}
> +
> +static void tegra186_irq_mask(struct irq_data *data)
> +{
> +	struct tegra_gpio *gpio =3D irq_data_get_irq_chip_data(data);
> +	void __iomem *base;
> +	u32 value;
> +
> +	base =3D tegra186_gpio_get_base(gpio, data->hwirq);
> +	if (WARN_ON(base =3D=3D NULL))
> +		return;
> +
> +	value =3D readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
> +	value &=3D ~TEGRA186_GPIO_ENABLE_CONFIG_INTERRUPT;
> +	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
> +}
> +
> +static void tegra186_irq_unmask(struct irq_data *data)
> +{
> +	struct tegra_gpio *gpio =3D irq_data_get_irq_chip_data(data);
> +	void __iomem *base;
> +	u32 value;
> +
> +	base =3D tegra186_gpio_get_base(gpio, data->hwirq);
> +	if (WARN_ON(base =3D=3D NULL))
> +		return;
> +
> +	value =3D readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
> +	value |=3D TEGRA186_GPIO_ENABLE_CONFIG_INTERRUPT;
> +	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
> +}
> +
> +static int tegra186_irq_set_type(struct irq_data *data, unsigned int flo=
w)
> +{
> +	struct tegra_gpio *gpio =3D irq_data_get_irq_chip_data(data);
> +	void __iomem *base;
> +	u32 value;
> +
> +	base =3D tegra186_gpio_get_base(gpio, data->hwirq);
> +	if (WARN_ON(base =3D=3D NULL))
> +		return -ENODEV;
> +
> +	value =3D readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
> +	value &=3D ~TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_MASK;
> +	value &=3D ~TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_LEVEL;
> +
> +	switch (flow & IRQ_TYPE_SENSE_MASK) {
> +	case IRQ_TYPE_NONE:
> +		break;
> +
> +	case IRQ_TYPE_EDGE_RISING:
> +		value |=3D TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_SINGLE_EDGE;
> +		value |=3D TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_LEVEL;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_FALLING:
> +		value |=3D TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_SINGLE_EDGE;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_BOTH:
> +		value |=3D TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_DOUBLE_EDGE;
> +		break;
> +
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		value |=3D TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_LEVEL;
> +		value |=3D TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_LEVEL;
> +		break;
> +
> +	case IRQ_TYPE_LEVEL_LOW:
> +		value |=3D TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_LEVEL;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
> +
> +	if ((flow & IRQ_TYPE_EDGE_BOTH) =3D=3D 0)
> +		irq_set_handler_locked(data, handle_level_irq);
> +	else
> +		irq_set_handler_locked(data, handle_edge_irq);
> +
> +	return 0;
> +}
> +
> +static void tegra186_gpio_irq(struct irq_desc *desc)
> +{
> +	struct tegra_gpio *gpio =3D irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +	unsigned int i, offset =3D 0;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	for (i =3D 0; i < gpio->soc->num_ports; i++) {
> +		const struct tegra_gpio_port *port =3D &gpio->soc->ports[i];
> +		void __iomem *base =3D gpio->base + port->offset;
> +		unsigned int pin, irq;
> +		unsigned long value;
> +
> +		value =3D readl(base + TEGRA186_GPIO_INTERRUPT_STATUS(1));
> +
> +		for_each_set_bit(pin, &value, port->pins) {
> +			irq =3D irq_find_mapping(gpio->domain, offset + pin);
> +			if (WARN_ON(irq =3D=3D 0))
> +				continue;
> +
> +			generic_handle_irq(irq);
> +		}
> +
> +		offset +=3D port->pins;
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
> +static int tegra186_gpio_irq_domain_xlate(struct irq_domain *domain,
> +					  struct device_node *np,
> +					  const u32 *spec, unsigned int size,
> +					  unsigned long *hwirq,
> +					  unsigned int *type)
> +{
> +	struct tegra_gpio *gpio =3D domain->host_data;
> +	unsigned int port, pin, i, offset =3D 0;
> +
> +	if (size < 2)
> +		return -EINVAL;
> +
> +	port =3D spec[0] / 8;
> +	pin =3D spec[0] % 8;
> +
> +	if (port >=3D gpio->soc->num_ports) {
> +		dev_err(gpio->gpio.parent, "invalid port number: %u\n", port);
> +		return -EINVAL;
> +	}
> +
> +	for (i =3D 0; i < port; i++)
> +		offset +=3D gpio->soc->ports[i].pins;
> +
> +	*type =3D spec[1] & IRQ_TYPE_SENSE_MASK;
> +	*hwirq =3D offset + pin;
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops tegra186_gpio_irq_domain_ops =3D {
> +	.xlate =3D tegra186_gpio_irq_domain_xlate,
> +};
> +
> +static struct lock_class_key tegra186_gpio_lock_class;
> +
> +static int tegra186_gpio_probe(struct platform_device *pdev)
> +{
> +	unsigned int i, j, irq, offset =3D 0;
> +	struct tegra_gpio *gpio;
> +	struct resource *res;
> +	char **names;
> +	int err;
> +
> +	gpio =3D devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> +	if (!gpio)
> +		return -ENOMEM;
> +
> +	gpio->soc =3D of_device_get_match_data(&pdev->dev);
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "gpio");
> +	gpio->base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(gpio->base))
> +		return PTR_ERR(gpio->base);
> +
> +	err =3D of_irq_count(pdev->dev.of_node);
> +	if (err < 0)
> +		return err;
> +
> +	gpio->num_irq =3D err;
> +
> +	gpio->irq =3D devm_kcalloc(&pdev->dev, gpio->num_irq, sizeof(*gpio->irq=
),
> +				 GFP_KERNEL);
> +	if (!gpio->irq)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < gpio->num_irq; i++) {
> +		err =3D platform_get_irq(pdev, i);
> +		if (err < 0)
> +			return err;
> +
> +		gpio->irq[i] =3D err;
> +	}
> +
> +	gpio->gpio.label =3D gpio->soc->name;
> +	gpio->gpio.parent =3D &pdev->dev;
> +
> +	gpio->gpio.get_direction =3D tegra186_gpio_get_direction;
> +	gpio->gpio.direction_input =3D tegra186_gpio_direction_input;
> +	gpio->gpio.direction_output =3D tegra186_gpio_direction_output;
> +	gpio->gpio.get =3D tegra186_gpio_get,
> +	gpio->gpio.set =3D tegra186_gpio_set;
> +	gpio->gpio.to_irq =3D tegra186_gpio_to_irq;
> +
> +	gpio->gpio.base =3D -1;
> +
> +	for (i =3D 0; i < gpio->soc->num_ports; i++)
> +		gpio->gpio.ngpio +=3D gpio->soc->ports[i].pins;
> +
> +	names =3D devm_kcalloc(gpio->gpio.parent, gpio->gpio.ngpio,
> +			     sizeof(*names), GFP_KERNEL);
> +	if (!names)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < gpio->soc->num_ports; i++) {
> +		const struct tegra_gpio_port *port =3D &gpio->soc->ports[i];
> +		char *name;
> +
> +		for (j =3D 0; j < port->pins; j++) {
> +			name =3D devm_kasprintf(gpio->gpio.parent, GFP_KERNEL,
> +					      "P%s.%02x", port->name, j);
> +			if (!name)
> +				return -ENOMEM;
> +
> +			names[offset + j] =3D name;
> +		}
> +
> +		offset +=3D port->pins;
> +	}
> +
> +	gpio->gpio.names =3D (const char * const *)names;
> +
> +	gpio->gpio.of_node =3D pdev->dev.of_node;
> +	gpio->gpio.of_gpio_n_cells =3D 2;
> +	gpio->gpio.of_xlate =3D tegra186_gpio_of_xlate;
> +
> +	gpio->intc.name =3D pdev->dev.of_node->name;
> +	gpio->intc.irq_ack =3D tegra186_irq_ack;
> +	gpio->intc.irq_mask =3D tegra186_irq_mask;
> +	gpio->intc.irq_unmask =3D tegra186_irq_unmask;
> +	gpio->intc.irq_set_type =3D tegra186_irq_set_type;
> +
> +	platform_set_drvdata(pdev, gpio);
> +
> +	err =3D devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
> +	if (err < 0)
> +		return err;
> +
> +	gpio->domain =3D irq_domain_add_linear(pdev->dev.of_node,
> +					     gpio->gpio.ngpio,
> +					     &tegra186_gpio_irq_domain_ops,
> +					     gpio);
> +	if (!gpio->domain)
> +		return -ENODEV;
> +
> +	for (i =3D 0; i < gpio->gpio.ngpio; i++) {
> +		irq =3D irq_create_mapping(gpio->domain, i);
> +		if (irq =3D=3D 0) {
> +			dev_err(&pdev->dev,
> +				"failed to create IRQ mapping for GPIO#%u\n",
> +				i);
> +			continue;
> +		}
> +
> +		irq_set_lockdep_class(irq, &tegra186_gpio_lock_class);
> +		irq_set_chip_data(irq, gpio);
> +		irq_set_chip_and_handler(irq, &gpio->intc, handle_simple_irq);
> +	}
> +
> +	for (i =3D 0; i < gpio->num_irq; i++)
> +		irq_set_chained_handler_and_data(gpio->irq[i],
> +						 tegra186_gpio_irq,
> +						 gpio);
> +
> +	return 0;
> +}
> +
> +static int tegra186_gpio_remove(struct platform_device *pdev)
> +{
> +	struct tegra_gpio *gpio =3D platform_get_drvdata(pdev);
> +	unsigned int i, irq;
> +
> +	for (i =3D 0; i < gpio->num_irq; i++)
> +		irq_set_chained_handler_and_data(gpio->irq[i], NULL, NULL);
> +
> +	for (i =3D 0; i < gpio->gpio.ngpio; i++) {
> +		irq =3D irq_find_mapping(gpio->domain, i);
> +		irq_dispose_mapping(irq);
> +	}
> +
> +	irq_domain_remove(gpio->domain);
> +
> +	return 0;
> +}
> +
> +#define TEGRA_MAIN_GPIO_PORT(port, base, count)	\
> +	[TEGRA_MAIN_GPIO_PORT_##port] =3D {	\
> +		.name =3D #port,			\
> +		.offset =3D base,			\
> +		.pins =3D count,			\
> +	}
> +
> +static const struct tegra_gpio_port tegra186_main_ports[] =3D {
> +	TEGRA_MAIN_GPIO_PORT( A, 0x2000, 7),
> +	TEGRA_MAIN_GPIO_PORT( B, 0x3000, 7),
> +	TEGRA_MAIN_GPIO_PORT( C, 0x3200, 7),
> +	TEGRA_MAIN_GPIO_PORT( D, 0x3400, 6),
> +	TEGRA_MAIN_GPIO_PORT( E, 0x2200, 8),
> +	TEGRA_MAIN_GPIO_PORT( F, 0x2400, 6),
> +	TEGRA_MAIN_GPIO_PORT( G, 0x4200, 6),
> +	TEGRA_MAIN_GPIO_PORT( H, 0x1000, 7),
> +	TEGRA_MAIN_GPIO_PORT( I, 0x0800, 8),
> +	TEGRA_MAIN_GPIO_PORT( J, 0x5000, 8),
> +	TEGRA_MAIN_GPIO_PORT( K, 0x5200, 1),
> +	TEGRA_MAIN_GPIO_PORT( L, 0x1200, 8),
> +	TEGRA_MAIN_GPIO_PORT( M, 0x5600, 6),
> +	TEGRA_MAIN_GPIO_PORT( N, 0x0000, 7),
> +	TEGRA_MAIN_GPIO_PORT( O, 0x0200, 4),
> +	TEGRA_MAIN_GPIO_PORT( P, 0x4000, 7),
> +	TEGRA_MAIN_GPIO_PORT( Q, 0x0400, 6),
> +	TEGRA_MAIN_GPIO_PORT( R, 0x0a00, 6),
> +	TEGRA_MAIN_GPIO_PORT( T, 0x0600, 4),
> +	TEGRA_MAIN_GPIO_PORT( X, 0x1400, 8),
> +	TEGRA_MAIN_GPIO_PORT( Y, 0x1600, 7),
> +	TEGRA_MAIN_GPIO_PORT(BB, 0x2600, 2),
> +	TEGRA_MAIN_GPIO_PORT(CC, 0x5400, 4),
> +};
> +
> +static const struct tegra_gpio_soc tegra186_main_soc =3D {
> +	.num_ports =3D ARRAY_SIZE(tegra186_main_ports),
> +	.ports =3D tegra186_main_ports,
> +	.name =3D "tegra186-gpio",
> +};
> +
> +#define TEGRA_AON_GPIO_PORT(port, base, count)	\
> +	[TEGRA_AON_GPIO_PORT_##port] =3D {	\
> +		.name =3D #port,			\
> +		.offset =3D base,			\
> +		.pins =3D count,			\
> +	}
> +
> +static const struct tegra_gpio_port tegra186_aon_ports[] =3D {
> +	TEGRA_AON_GPIO_PORT( S, 0x0200, 5),
> +	TEGRA_AON_GPIO_PORT( U, 0x0400, 6),
> +	TEGRA_AON_GPIO_PORT( V, 0x0800, 8),
> +	TEGRA_AON_GPIO_PORT( W, 0x0a00, 8),
> +	TEGRA_AON_GPIO_PORT( Z, 0x0e00, 4),
> +	TEGRA_AON_GPIO_PORT(AA, 0x0c00, 8),
> +	TEGRA_AON_GPIO_PORT(EE, 0x0600, 3),
> +	TEGRA_AON_GPIO_PORT(FF, 0x0000, 5),
> +};
> +
> +static const struct tegra_gpio_soc tegra186_aon_soc =3D {
> +	.num_ports =3D ARRAY_SIZE(tegra186_aon_ports),
> +	.ports =3D tegra186_aon_ports,
> +	.name =3D "tegra186-gpio-aon",
> +};
> +
> +static const struct of_device_id tegra186_gpio_of_match[] =3D {
> +	{
> +		.compatible =3D "nvidia,tegra186-gpio",
> +		.data =3D &tegra186_main_soc
> +	}, {
> +		.compatible =3D "nvidia,tegra186-gpio-aon",
> +		.data =3D &tegra186_aon_soc
> +	}, {
> +		/* sentinel */
> +	}
> +};
> +
> +static struct platform_driver tegra186_gpio_driver =3D {
> +	.driver =3D {
> +		.name =3D "tegra186-gpio",
> +		.of_match_table =3D tegra186_gpio_of_match,
> +	},
> +	.probe =3D tegra186_gpio_probe,
> +	.remove =3D tegra186_gpio_remove,
> +};
> +module_platform_driver(tegra186_gpio_driver);
> +
> +MODULE_DESCRIPTION("NVIDIA Tegra186 GPIO controller driver");
> +MODULE_AUTHOR("Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");
> --=20
> 2.12.0
>=20

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljeVS4ACgkQ3SOs138+
s6FYPBAApdNJdh51lPGosXTEJSVCVu1m3yDJsTSq53QC0Ln5wB4FB51AoZ8EwDNd
rmSd2xEW09Hc/iLsJQKHI5AdlzrNOtEsPmbjHfAzWMjh195rlBpMjiYs+BpA36aN
cQZQn0mRbXFfgDvQaswNkIWhRGC//J6gekkGSzrG1H4VhQ8Ee22vTJssX++eZnoz
SuxFihOEBGqO/lPIqlubuZzJciaZFUqh+b9ceZmpXY2SrDfIIWMwflNYar7tPgbI
1HKleZBqcfmoMeYFjM4qZknfMF5x8NaFbgtQ22ogMtKJ9D7xly/aDL8kz31rXTRY
N6DyjY6hpzShjBVvzifZzBf2ShKGNi5Se+bG2bFzRf9e6O6j/LJLIx0x+B9G8EPe
nycOVDK+F5LY7TsDe7wIScNsYJqPWgo9BQc2LoYSljjmJKF0gycaH4ht7Y6fyb3J
UBjqQR7h7Z3In091jnBU9Y1+ukZmgiIPACA+Q9L1IGQnsBtSpKvc1kJsyzxp7ugZ
7H6/5pO8vpbvjbqzbSkGTcJ6WrAtZjpydlhmmZfba4TFOcWMpWWbnlIcnZJ0Hpmg
Sp7OI8fJP9oQBg0aB3kZJPiYoaINQVahsjpc7+JLpPnGzz5UzBJCQSXLGUzLA1eZ
pFx6FqntmyDNWmp6D1roHxqy8i5a/I57WR47dD02T62UAILrj/I=
=lwwj
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
