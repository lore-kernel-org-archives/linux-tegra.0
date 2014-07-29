From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH v2] PCI: tegra: add missing cleanup in error path and
 teardown_irq
Date: Tue, 29 Jul 2014 09:42:10 +0800
Message-ID: <20140729094210.1d599469@xhacker>
References: <1406519142-3018-1-git-send-email-jszhang@marvell.com>
	<20140728153548.GB10126@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140728153548.GB10126@ulmo.nvidia.com>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Mon, 28 Jul 2014 08:35:50 -0700
Thierry Reding <thierry.reding@gmail.com> wrote:

> On Mon, Jul 28, 2014 at 11:45:42AM +0800, Jisheng Zhang wrote:
> > We should call tegra_msi_free() to free the msi bit if
> > irq_create_mapping() fails. And we need to dispose the irq mapping
> > during irq teardown.
> 
> "MSI" and "IRQ" please.

Done in the v3 patch. Thanks for your reviewing.

> 
> > diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> > index 083cf37..4ccc418 100644
> > --- a/drivers/pci/host/pci-tegra.c
> > +++ b/drivers/pci/host/pci-tegra.c
> > @@ -1203,8 +1203,10 @@ static int tegra_msi_setup_irq(struct msi_chip
> > *chip, struct pci_dev *pdev, return hwirq;
> >  
> >  	irq = irq_create_mapping(msi->domain, hwirq);
> > -	if (!irq)
> > +	if (!irq) {
> > +		tegra_msi_free(msi, hwirq);
> >  		return -EINVAL;
> > +	}
> >  
> >  	irq_set_msi_desc(irq, desc);
> >  
> > @@ -1222,8 +1224,10 @@ static void tegra_msi_teardown_irq(struct msi_chip
> > *chip, unsigned int irq) {
> >  	struct tegra_msi *msi = to_tegra_msi(chip);
> >  	struct irq_data *d = irq_get_irq_data(irq);
> > +	unsigned long hwirq = d->hwirq;
> 
> I don't think we need this temporary variable, d->hwirq isn't overly
> long.

irq_dispose_mapping() will clear d->hwirq as 0, so if we don't save to a temporary
variable, we will always MSI 0, this is not what we want. What do you think?

> 
> With both of the above address, this is:
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Thanks for reviewing,
Jisheng
