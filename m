From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: kill off set_irq_flags usage
Date: Tue, 28 Jul 2015 10:49:53 +0200
Message-ID: <CACRpkdY8FyxDT=aYfCRof_b+P06MhRVWvuip+TZdZGHpLhvL-Q@mail.gmail.com>
References: <1438030523-15853-1-git-send-email-robh@kernel.org>
	<1438030523-15853-4-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1438030523-15853-4-git-send-email-robh@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Hennerich <michael.hennerich@analog.com>, Ray Jui <rjui@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 27, 2015 at 10:55 PM, Rob Herring <robh@kernel.org> wrote:

> set_irq_flags is ARM specific with custom flags which have genirq
> equivalents. Convert drivers to use the genirq interfaces directly, so we
> can kill off set_irq_flags. The translation of flags is as follows:
>
> IRQF_VALID -> !IRQ_NOREQUEST
> IRQF_PROBE -> !IRQ_NOPROBE
> IRQF_NOAUTOEN -> IRQ_NOAUTOEN
>
> For IRQs managed by an irqdomain, the irqdomain core code handles clearing
> and setting IRQ_NOREQUEST already, so there is no need to do this in
> .map() functions and we can simply remove the set_irq_flags calls. Some
> users also modify IRQ_NOPROBE and this has been maintained although it
> is not clear that is really needed as most platforms don't use probing.
> There appears to be a great deal of blind copy and paste of this code.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-tegra@vger.kernel.org
> ---
> Thomas asked that this be merged thru subsystem trees instead of arm-soc,
> so please apply this to your tree.

Patch applied with some fuzzing, thanks!

Yours,
Linus Walleij
