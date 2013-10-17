From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Add MIPI pad calibration support
Date: Thu, 17 Oct 2013 11:22:02 -0700
Message-ID: <CAK5ve-J1wXRqMb_RnKpK3aVxn4QxKgdqzq58hfBK9FJjf9T1ew@mail.gmail.com>
References: <1381944997-30671-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381944997-30671-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 16, 2013 at 10:36 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This driver adds support to perform calibration of the MIPI pads for CSI
> and DSI.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v3:
> - add device tree binding documentation
>
> Changes in v2:
> - rename fields to mirror the names in the TRM
> - remove unused fields
>
>  .../bindings/misc/nvidia,tegra114-mipi.txt         |  37 ++++
>  drivers/gpu/host1x/Makefile                        |   1 +
>  drivers/gpu/host1x/dev.c                           |  17 +-
>  drivers/gpu/host1x/dev.h                           |   2 +
>  drivers/gpu/host1x/mipi.c                          | 230 +++++++++++++++++++++
>  include/linux/host1x.h                             |   2 +
>  6 files changed, 285 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt
>  create mode 100644 drivers/gpu/host1x/mipi.c
>
> diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt
> new file mode 100644
> index 0000000..642c5d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt
> @@ -0,0 +1,37 @@
> +NVIDIA Tegra MIPI pad calibration controller
> +
> +Required properties:
> +- compatible: "nvidia,tegra<chip>-mipi"
> +- reg: Physical base address and length of the controller's registers.
> +- clocks: The clock consumed by the controller.
> +- #calibrate-cells: Should be 1. The cell is a bitmask of the pads that need
> +  to be calibrated by a given device.
> +
> +User nodes need to contain a calibrate property that has a phandle to refer
> +to the calibration controller node and a bitmask of the pads that need to be
> +calibrated.
> +
> +Example:
> +
> +       mipi: mipi@700e3000 {
> +               compatible = "nvidia,tegra114-mipi";
> +               reg = <0x700e3000 0x100>;
> +               clocks = <&tegra_car TEGRA114_CLK_MIPI_CAL>;
> +               #calibrate-cells = <1>;
> +       };
> +
> +       ...
> +
> +       host1x@50000000 {
> +               ...
> +
> +               dsi@54300000 {
> +                       ...
> +
> +                       calibrate = <&mipi 0x060>;
> +
> +                       ...
> +               };
> +
> +               ...
> +       };
> diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
> index afa1e9e..de305c2 100644
> --- a/drivers/gpu/host1x/Makefile
> +++ b/drivers/gpu/host1x/Makefile
> @@ -7,6 +7,7 @@ host1x-y = \
>         channel.o \
>         job.o \
>         debug.o \
> +       mipi.o \
>         hw/host1x01.o \
>         hw/host1x02.o
>
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index ab402a5..12d6333 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -208,17 +208,26 @@ static int __init tegra_host1x_init(void)
>                 return err;
>
>         err = platform_driver_register(&tegra_host1x_driver);
> -       if (err < 0) {
> -               host1x_bus_exit();
> -               return err;
> -       }
> +       if (err < 0)
> +               goto unregister_bus;
> +
> +       err = platform_driver_register(&tegra_mipi_driver);
> +       if (err < 0)
> +               goto unregister_host1x;
>
>         return 0;
> +
> +unregister_host1x:
> +       platform_driver_unregister(&tegra_host1x_driver);
> +unregister_bus:
> +       host1x_bus_exit();
> +       return err;
>  }
>  module_init(tegra_host1x_init);
>
>  static void __exit tegra_host1x_exit(void)
>  {
> +       platform_driver_unregister(&tegra_mipi_driver);
>         platform_driver_unregister(&tegra_host1x_driver);
>         host1x_bus_exit();
>  }
> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
> index 6cf689b..65c80dc 100644
> --- a/drivers/gpu/host1x/dev.h
> +++ b/drivers/gpu/host1x/dev.h
> @@ -304,4 +304,6 @@ static inline void host1x_hw_show_mlocks(struct host1x *host, struct output *o)
>         host->debug_op->show_mlocks(host, o);
>  }
>
> +extern struct platform_driver tegra_mipi_driver;
> +
>  #endif
> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> new file mode 100644
> index 0000000..8a54613
> --- /dev/null
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -0,0 +1,230 @@
> +/*
> + * Copyright (C) 2013 NVIDIA Corporation
> + *
> + * Permission to use, copy, modify, distribute, and sell this software and its
> + * documentation for any purpose is hereby granted without fee, provided that
> + * the above copyright notice appear in all copies and that both that copyright
> + * notice and this permission notice appear in supporting documentation, and
> + * that the name of the copyright holders not be used in advertising or
> + * publicity pertaining to distribution of the software without specific,
> + * written prior permission.  The copyright holders make no representations
> + * about the suitability of this software for any purpose.  It is provided "as
> + * is" without express or implied warranty.
> + *
> + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
> + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
> + * OF THIS SOFTWARE.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define MIPI_CAL_CTRL                  0x00
> +#define MIPI_CAL_CTRL_START            (1 << 0)
> +
> +#define MIPI_CAL_AUTOCAL_CTRL          0x01
> +
> +#define MIPI_CAL_STATUS                        0x02
> +#define MIPI_CAL_STATUS_DONE           (1 << 16)
> +#define MIPI_CAL_STATUS_ACTIVE         (1 <<  0)
> +
> +#define MIPI_CAL_CONFIG_CSIA           0x05
> +#define MIPI_CAL_CONFIG_CSIB           0x06
> +#define MIPI_CAL_CONFIG_CSIC           0x07
> +#define MIPI_CAL_CONFIG_CSID           0x08
> +#define MIPI_CAL_CONFIG_CSIE           0x09
> +#define MIPI_CAL_CONFIG_DSIA           0x0e
> +#define MIPI_CAL_CONFIG_DSIB           0x0f
> +#define MIPI_CAL_CONFIG_DSIC           0x10
> +#define MIPI_CAL_CONFIG_DSID           0x11
> +
> +#define MIPI_CAL_CONFIG_SELECT         (1 << 21)
> +#define MIPI_CAL_CONFIG_HSPDOS(x)      (((x) & 0x1f) << 16)
> +#define MIPI_CAL_CONFIG_HSPUOS(x)      (((x) & 0x1f) <<  8)
> +#define MIPI_CAL_CONFIG_TERMOS(x)      (((x) & 0x1f) <<  0)
> +
> +#define MIPI_CAL_BIAS_PAD_CFG0         0x16
> +#define MIPI_CAL_BIAS_PAD_PDVCLAMP     (1 << 1)
> +#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF (1 << 0)
> +
> +#define MIPI_CAL_BIAS_PAD_CFG1         0x17
> +
> +#define MIPI_CAL_BIAS_PAD_CFG2         0x18
> +#define MIPI_CAL_BIAS_PAD_PDVREG       (1 << 1)
> +
> +static const struct module {
> +       unsigned long reg;
> +} modules[] = {
> +       { .reg = MIPI_CAL_CONFIG_CSIA },
> +       { .reg = MIPI_CAL_CONFIG_CSIB },
> +       { .reg = MIPI_CAL_CONFIG_CSIC },
> +       { .reg = MIPI_CAL_CONFIG_CSID },
> +       { .reg = MIPI_CAL_CONFIG_CSIE },
> +       { .reg = MIPI_CAL_CONFIG_DSIA },
> +       { .reg = MIPI_CAL_CONFIG_DSIB },
> +       { .reg = MIPI_CAL_CONFIG_DSIC },
> +       { .reg = MIPI_CAL_CONFIG_DSID },
> +};
> +
> +struct tegra_mipi {
> +       void __iomem *regs;
> +       struct mutex lock;
> +       struct clk *clk;
> +};
> +
> +static inline unsigned long tegra_mipi_readl(struct tegra_mipi *mipi,
> +                                            unsigned long reg)
> +{
> +       return readl(mipi->regs + (reg << 2));
> +}
> +
> +static inline void tegra_mipi_writel(struct tegra_mipi *mipi,
> +                                    unsigned long value, unsigned long reg)
> +{
> +       writel(value, mipi->regs + (reg << 2));
> +}
> +
> +int tegra_mipi_calibrate(struct device *device)
> +{
> +       struct platform_device *pdev;
> +       unsigned int timeout = 20, i;
> +       struct of_phandle_args args;
> +       unsigned long value, pads;
> +       struct tegra_mipi *mipi;
> +       int err;
> +
> +       err = of_parse_phandle_with_args(device->of_node, "calibrate",
> +                                        "#calibrate-cells", 0, &args);
> +       if (err < 0)
> +               return err;
> +
> +       pdev = of_find_device_by_node(args.np);
> +       if (!pdev) {
> +               of_node_put(args.np);
> +               return -ENODEV;
> +       }
> +
> +       of_node_put(args.np);
> +       pads = args.args[0];
> +
> +       mipi = platform_get_drvdata(pdev);
> +       if (!mipi) {
> +               err = -ENODEV;
> +               goto out;
> +       }
> +
> +       err = clk_enable(mipi->clk);
> +       if (err < 0)
> +               goto out;
> +
> +       mutex_lock(&mipi->lock);
> +
> +       value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> +       value &= ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
> +       value |= MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> +       tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> +
> +       value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> +       value &= ~MIPI_CAL_BIAS_PAD_PDVREG;
> +       tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> +
> +       for (i = 0; i < ARRAY_SIZE(modules); i++) {
> +               if (pads & BIT(i))
> +                       value = MIPI_CAL_CONFIG_SELECT |
> +                               MIPI_CAL_CONFIG_HSPDOS(0) |
> +                               MIPI_CAL_CONFIG_HSPUOS(4) |
> +                               MIPI_CAL_CONFIG_TERMOS(5);
> +               else
> +                       value = 0;
> +
> +               tegra_mipi_writel(mipi, value, modules[i].reg);
> +       }
> +
> +       tegra_mipi_writel(mipi, MIPI_CAL_CTRL_START, MIPI_CAL_CTRL);
> +
> +       while (timeout) {
> +               value = tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
> +               if ((value & MIPI_CAL_STATUS_ACTIVE) == 0 &&
> +                   (value & MIPI_CAL_STATUS_DONE) != 0)
> +                       break;
> +
> +               usleep_range(10, 100);
> +               timeout--;
> +       }
> +
> +       mutex_unlock(&mipi->lock);
> +       clk_disable(mipi->clk);
> +
> +       if (timeout == 0)
> +               err = -ETIMEDOUT;
> +       else
> +               err = 0;
> +
> +out:
> +       platform_device_put(pdev);
> +       return err;
> +}
> +EXPORT_SYMBOL_GPL(tegra_mipi_calibrate);
> +

Hi Thierry,

Does this driver support T20/T30 or new chip after T114? I guess there
are should be some difference between them. And is there any guide
about when is it correct to call this API tegra_mipi_calibrate().

I think for CSI, we need get all power and clock ready and external
sensor is generating the data. Calibration will be done during CSI
receive the first frame data. For DSI, it might be different. And Is
there any conflict when CSI/DSI driver both use this API?

Thanks,
-Bryan

> +static int tegra_mipi_probe(struct platform_device *pdev)
> +{
> +       struct tegra_mipi *mipi;
> +       struct resource *res;
> +       int err;
> +
> +       mipi = devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
> +       if (!mipi)
> +               return -ENOMEM;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       mipi->regs = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(mipi->regs))
> +               return PTR_ERR(mipi->regs);
> +
> +       mutex_init(&mipi->lock);
> +
> +       mipi->clk = devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(mipi->clk)) {
> +               dev_err(&pdev->dev, "failed to get clock\n");
> +               return PTR_ERR(mipi->clk);
> +       }
> +
> +       err = clk_prepare(mipi->clk);
> +       if (err < 0)
> +               return err;
> +
> +       platform_set_drvdata(pdev, mipi);
> +
> +       return 0;
> +}
> +
> +static int tegra_mipi_remove(struct platform_device *pdev)
> +{
> +       struct tegra_mipi *mipi = platform_get_drvdata(pdev);
> +
> +       clk_unprepare(mipi->clk);
> +
> +       return 0;
> +}
> +
> +static struct of_device_id tegra_mipi_of_match[] = {
> +       { .compatible = "nvidia,tegra114-mipi", },
> +       { },
> +};
> +
> +struct platform_driver tegra_mipi_driver = {
> +       .driver = {
> +               .name = "tegra-mipi",
> +               .of_match_table = tegra_mipi_of_match,
> +       },
> +       .probe = tegra_mipi_probe,
> +       .remove = tegra_mipi_remove,
> +};
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index e62c61a..da6dd01 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -273,4 +273,6 @@ int host1x_device_exit(struct host1x_device *device);
>  int host1x_client_register(struct host1x_client *client);
>  int host1x_client_unregister(struct host1x_client *client);
>
> +int tegra_mipi_calibrate(struct device *device);
> +
>  #endif
> --
> 1.8.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
