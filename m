From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH V4 2/9] genirq: Look-up trigger type if not specified by
 caller
Date: Sat, 4 Jun 2016 10:41:17 +0100
Message-ID: <20160604104117.7d22bdb2@arm.com>
References: <1463066372-13115-1-git-send-email-jonathanh@nvidia.com>
	<1463066372-13115-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463066372-13115-3-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 12 May 2016 16:19:25 +0100
Jon Hunter <jonathanh@nvidia.com> wrote:

> For some devices the IRQ trigger type for a device is read from
> firmware, such as device-tree. The IRQ trigger type is typically read
> when the mapping for IRQ is created, which is before the IRQ is
> requested. Hence, the IRQ trigger type is programmed when mapping the
> IRQ and not when requesting the IRQ.
> 
> Although this works for most cases, in order to support IRQ chips which
> require runtime power management, which may not be accessible prior
> to requesting the IRQ, it is desirable to look-up the IRQ trigger type
> when it is requested. Therefore, if the IRQ trigger type is not
> specified when __setup_irq() is called, look-up the saved IRQ trigger
> type. This will allow us to defer the programming of the trigger type
> from when the IRQ is mapped to when it is actually requested.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny.
