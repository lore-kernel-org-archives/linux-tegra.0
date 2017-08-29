From: Himanshu Jha <himanshujha199640@gmail.com>
Subject: Re: [PATCH] PCI: tegra: Use PTR_ERR_OR_ZERO
Date: Tue, 29 Aug 2017 19:44:01 +0530
Message-ID: <20170829141401.GA18389@himanshu-Vostro-3559>
References: <1504013940-16304-1-git-send-email-himanshujha199640@gmail.com>
 <20170829135517.GA30733@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170829135517.GA30733@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 29, 2017 at 03:55:17PM +0200, Thierry Reding wrote:
> On Tue, Aug 29, 2017 at 07:09:00PM +0530, Himanshu Jha wrote:
> > Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> > 
> > Signed-off-by: Himanshu Jha <himanshujha199640@gmail.com>
> > ---
> >  drivers/pci/host/pci-tegra.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> > index 9c40da5..90cda5b 100644
> > --- a/drivers/pci/host/pci-tegra.c
> > +++ b/drivers/pci/host/pci-tegra.c
> > @@ -1156,10 +1156,7 @@ static int tegra_pcie_resets_get(struct tegra_pcie *pcie)
> >  		return PTR_ERR(pcie->afi_rst);
> >  
> >  	pcie->pcie_xrst = devm_reset_control_get_exclusive(dev, "pcie_x");
> > -	if (IS_ERR(pcie->pcie_xrst))
> > -		return PTR_ERR(pcie->pcie_xrst);
> > -
> > -	return 0;
> > +	return PTR_ERR_OR_ZERO(pcie->pcie_xrst);
> >  }
> 
> I'm not a big fan of this construct because it's a pain to undo this if
> ever we need to add code to this function. But since we do have scripts
> that will flag this, I guess this would pop up every now and again. The
> driver is unlikely to change in this part, too, so:

What do you suggest ? Shall I stop sending these patches ?

Thanks
-Himanshu Jha

> Acked-by: Thierry Reding <treding@nvidia.com>
