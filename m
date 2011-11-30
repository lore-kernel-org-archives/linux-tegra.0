From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/2] gpio/tegra: Make it a DT interrupt controller
Date: Wed, 30 Nov 2011 09:19:42 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174FDAFE4D@HQMAIL01.nvidia.com>
References: <1322616743-31985-1-git-send-email-swarren@nvidia.com>
 <1322616743-31985-2-git-send-email-swarren@nvidia.com>
 <4ED5A2CB.8020905@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4ED5A2CB.8020905-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Rob Herring wrote at Tuesday, November 29, 2011 8:28 PM:
> On 11/29/2011 07:32 PM, Stephen Warren wrote:
> > Fix the DT binding documentation to describe interrupt-related properties,
> > and the contents of "child" node interrupts property.
> >
> > Update tegra20.dtsi to specify the required interrupt-related properties.
> >
> > Fix the driver to creating an IRQ domain for itself, so that child node
> > interrupts properties are correctly parsed.

> > diff --git a/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt b/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt
...
> > +- #interrupt-cells : Should be 3.
> 
> Should be 2??

Yes, typo.

> > diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c

> > +	if (pdev->dev.of_node)
> > +		irq_domain_add_simple(pdev->dev.of_node, TEGRA_GPIO_TO_IRQ(0));
> > +
> 
> This is a bit of a temporary solution. Really, you want to end up with
> something like this to eliminate INT_GPIO_BASE and dynamically assign
> the irqbase:

>  static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
> -       return TEGRA_GPIO_TO_IRQ(offset);
> +       return irq_domain_to_irq(chip->domain, offset);
> 
> >>> This is a bit wrong. You need a tegra_gpio_chip containing a domain
> and gpio_chip.

That implies there's always an IRQ domain for this chip. Right now, my
patch only creates an IRQ domain when the GPIO controller is instantiated
from DT; there is no domain when instantiated as a platform device from a
board file. I suppose that really should change, but:

Some board files initialize platform devices as follows:

./arch/arm/mach-tegra/board-seaboard.c:162:	.irq = TEGRA_GPIO_TO_IRQ(TEGRA_GPIO_ISL29018_IRQ),
./arch/arm/mach-tegra/board-seaboard.c:186:	.irq = TEGRA_GPIO_TO_IRQ(TEGRA_GPIO_CDC_IRQ),
./arch/arm/mach-tegra/board-harmony.c:104:	.irq = TEGRA_GPIO_TO_IRQ(TEGRA_GPIO_CDC_IRQ),

Is there a way to make that work if there is no static IRQ numbering and
hence the compile-time macro TEGRA_GPIO_TO_IRQ() doesn't exist?

For Tegra, IRQ domain support (CONFIG_IRQ_DOMAIN) is only enabled via
CONFIG_USE_OF, so for non-DT builds isn't enabled. I guess we could
easily make CONFIG_ARCH_TEGRA select CONFIG_IRQ_DOMAIN though.

The sooner we switch to DT-only the better!

>  static void tegra_gpio_irq_ack(struct irq_data *d)
>  {
> -       int gpio = d->irq - INT_GPIO_BASE;
> +       int gpio = d->hwirq;

Is the hwirq field valid when there isn't an IRQ domain?

Thanks for the feedback.

-- 
nvpublic
