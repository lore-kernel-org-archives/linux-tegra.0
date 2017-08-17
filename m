From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [V6,3/9] irqdomain: Don't set type when mapping an IRQ
Date: Thu, 17 Aug 2017 14:34:37 +0100
Message-ID: <feb4e020-b738-9165-c044-b0e246ee4bd5@arm.com>
References: <1465312354-27778-4-git-send-email-jonathanh@nvidia.com>
 <59959014.9040603@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59959014.9040603@rock-chips.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: jeffy <jeffy.chen@rock-chips.com>, Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, briannorris@chromium.com
List-Id: linux-tegra@vger.kernel.org

On 17/08/17 13:46, jeffy wrote:
> Hi guys,
> 
> I hit an problem when testing a level triggered irq with:
> 
> irq = platform_get_irq_byname(pdev, "wake");
> ...<-- irq trigger type is correct
> irq_set_status_flags(irq, IRQ_NOAUTOEN);
> ...<-- irq trigger type become zero
> request_threaded_irq(irq, ...)
> 
> the trigger type lost(irqd_get_trigger_type returns zero) after 
> irq_set_status_flags.
> 
> 
> it looks like irq_set_status_flags would try to use 
> irq_settings_is_level to get level trigger type, which would get zero 
> since we removed set type here...could you help to check this, thanks :)

Hmm. That's quite unexpected. Can you please try this?

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index a3cc37c0c85e..3675c6004f2a 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1000,7 +1000,7 @@ EXPORT_SYMBOL_GPL(irq_set_chip_and_handler_name);
 
 void irq_modify_status(unsigned int irq, unsigned long clr, unsigned long set)
 {
-	unsigned long flags;
+	unsigned long flags, trigger, tmp;
 	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
 
 	if (!desc)
@@ -1014,6 +1014,8 @@ void irq_modify_status(unsigned int irq, unsigned long clr, unsigned long set)
 
 	irq_settings_clr_and_set(desc, clr, set);
 
+	trigger = irqd_get_trigger_type(&desc->irq_data);
+
 	irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
 		   IRQD_TRIGGER_MASK | IRQD_LEVEL | IRQD_MOVE_PCNTXT);
 	if (irq_settings_has_no_balance_set(desc))
@@ -1025,7 +1027,11 @@ void irq_modify_status(unsigned int irq, unsigned long clr, unsigned long set)
 	if (irq_settings_is_level(desc))
 		irqd_set(&desc->irq_data, IRQD_LEVEL);
 
-	irqd_set(&desc->irq_data, irq_settings_get_trigger_mask(desc));
+	tmp = irq_settings_get_trigger_mask(desc);
+	if (tmp != IRQ_TYPE_NONE)
+		trigger = tmp;
+
+	irqd_set(&desc->irq_data, trigger);
 
 	irq_put_desc_unlock(desc, flags);
 }

Basically, save the trigger info before clearing it. If the interrupt
has already been configured, use that. Otherwise restore the previous
trigger settings. But I'm slightly confused as to which field is used
for what...

	M.
-- 
Jazz is not dead. It just smells funny...
