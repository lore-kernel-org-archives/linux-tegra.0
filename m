From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [RFC PATCH V2 8/8] irqchip/gic: Add support for tegra AGIC
 interrupt controller
Date: Thu, 17 Dec 2015 10:58:52 +0000
Message-ID: <5672956C.5010904@nvidia.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
 <1450349309-8107-9-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450349309-8107-9-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 17/12/15 10:48, Jon Hunter wrote:
> Add a driver for the Tegra-AGIC interrupt controller which is compatible
> with the ARM GIC-400 interrupt controller.
> 
> The Tegra AGIC (Audio GIC) is part of the Audio Processing Engine (APE) on
> Tegra210 and can route interrupts to either the GIC for the CPU subsystem
> or the Audio DSP (ADSP) within the APE. The AGIC uses CPU interface 0 to
> route interrupts to the CPU GIC and CPU interface 1 to route interrupts to
> the ADSP.
> 
> The APE is located within its own power domain on the chip and so the
> AGIC needs to manage both the power domain and its clocks. Commit
> afbbd2338176 ("irqchip/gic: Document optional Clock and Power Domain
> properties") adding clock and power-domain properties to the GIC binding
> and so the aim would be to make use of these to handle power management
> (however, this is very much dependent upon adding support for generic
> PM domains for Tegra which is still a work-in-progress).
> 
> With the AGIC being located in a different power domain to the main CPU
> cluster this means that:
> 1. The interrupt controller cannot be registered via IRQCHIP_DECLARE()
>    because it needs to be registered as a platform device so that the
>    generic PM domain core will ensure that the power domain is available
>    before probing.
> 2. The interrupt controller cannot be suspended/restored based upon
>    changes in the CPU power state and needs to use runtime-pm instead.
> 
> This is very much a work-in-progress and there are still a few items that
> need to be resolved. These items are:
> 1. Currently the GIC platform driver only supports non-root GICs. The
>    platform driver performs a save and restore of PPI interrupts for
>    non-root GICs, which is probably not necessary and so could be changed.
>    At a minimum we need to re-enable the CPU interface during the device
>    resume but we could skip the restoration of the PPIs. In general we
>    could update the driver to only save and restore PPIs for the root
>    controller, if that makes sense.
> 2. Currently routing of interrupts to the ADSP for Tegra210 is not
>    supported by this driver. Although the ADSP on Tegra210 could also setup
>    the AGIC distributor having two independent subsystems configure the
>    distributor does not seem like a good idea. Given that the ADSP is a
>    slave and would be under the control of the kernel via its own driver,
>    it would seem best that only the kernel configures the distributors
>    routing of the interrupts. This could be achieved by adding a new genirq
>    API to migrate the interrupt. The GIC driver already has an API to
>    migrate all interrupts from one CPU interface to another (which I
>    understand is for a different reason), but having an generic API to
>    migrate an interrupt to another device could be useful (unless something
>    already exists that I have overlooked).
> 
> Please let me know if you have any thoughts/opinions on the above.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/irqchip/irq-gic.c | 330 +++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 253 insertions(+), 77 deletions(-)

[snip]

> +#ifdef CONFIG_PM_SLEEP
> +static int gic_resume(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = gic_runtime_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +}
> +
> +static int gic_suspend(struct device *dev)
> +{
> +	pm_runtime_disable(dev);
> +	if (!pm_runtime_status_suspended(dev))
> +		return gic_runtime_suspend(dev);
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops gic_pm_ops = {
> +	SET_RUNTIME_PM_OPS(gic_runtime_suspend,
> +			   gic_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(gic_suspend, gic_resume)
> +};

I believe these need to be the noirq variants. Will fix.

Jon
