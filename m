From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 10/11] ARM: tegra: pcie: Add MSI support
Date: Mon, 12 Mar 2012 10:57:10 -0600
Message-ID: <4F5E2AE6.3030404@wwwdotorg.org>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de> <1331218291-16119-11-git-send-email-thierry.reding@avionic-design.de> <4F59213F.6070107@wwwdotorg.org> <20120312080023.GA13788@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120312080023.GA13788-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/12/2012 02:00 AM, Thierry Reding wrote:
> * Stephen Warren wrote:
>> On 03/08/2012 07:51 AM, Thierry Reding wrote:
>>> diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c
...
>> Free the IRQ descriptors in the error paths?
...
>>> +	for (msi = 0; msi < INT_PCI_MSI_NR; msi++) {
>>> +		unsigned int irq = irq_find_mapping(pcie->msi_domain, msi);
>>> +
>>> +		irq_set_chip_data(irq, pcie);
>>> +		irq_set_chip_and_handler(irq, &pcie->msi_chip,
>>> +					 handle_simple_irq);
>>> +		set_irq_flags(irq, IRQF_VALID);
>>> +	}
>>> +
>>> +	err = platform_get_irq(pdev, 1);
>>> +	if (err < 0) {
>>> +		dev_err(&pdev->dev, "failed to get IRQ: %d\n", err);
>>
>> Same here, and undo setting IRQF_VALID?
> 
> Does it make sense to explicitly unset the IRQF_VALID flag when the IRQ
> descriptors are free'd afterwards anyway?

Good point. Probably not per my gut instinct.

...
> I'm also Cc'ing Thomas
> Gleixner as maintainer of the IRQ subsystem, he probably knows best how
> dynamically allocated interrupts should be cleaned up.

But yes, best to check with someone more familiar with interrupts.
