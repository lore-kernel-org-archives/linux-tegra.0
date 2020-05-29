From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: fix runtime pm imbalance on error
Date: Fri, 29 May 2020 11:23:17 +0100
Message-ID: <20200529102317.GA12270@e121166-lin.cambridge.arm.com>
References: <20200520163739.GA1100601@bjorn-Precision-5520>
 <e7c967a0-c285-450a-bbad-f6456c661d41@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e7c967a0-c285-450a-bbad-f6456c661d41-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>, kjlu-OJFnDUYgAso@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Murray <amurray-tUaQ5FxYRYX4aQPF92CzsNBc4/FLrbF6@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, May 20, 2020 at 11:39:08PM +0530, Vidya Sagar wrote:
> Thanks for pushing a patch to fix it. I've been under the wrong assumption
> that a failing pm_runtime_get_sync() wouldn't increment the usage counter.
> With Thierry's and Bjorn's comments addressed
> 
> Acked-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thierry, Vidya,

are your ACKs applying also to:

https://patchwork.kernel.org/patch/11562109/

Dinghao did not carry them over and I could not understand from this
thread if your ACKs apply to both tegra and tegra194.

Thanks,
Lorenzo

> On 20-May-20 10:07 PM, Bjorn Helgaas wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Wed, May 20, 2020 at 11:59:08AM +0200, Thierry Reding wrote:
> > > On Wed, May 20, 2020 at 04:52:23PM +0800, Dinghao Liu wrote:
> > > > pm_runtime_get_sync() increments the runtime PM usage counter even
> > > > it returns an error code. Thus a pairing decrement is needed on
> > > 
> > > s/even it/even when it/
> > > 
> > > Might also be a good idea to use a different subject prefix because I
> > > was almost not going to look at the other patch, taking this to be a
> > > replacement for it.
> > 
> > Amen.  This would be a good change to start using "PCI: tegra194" or
> > something for pcie-tegra194.c.  Or will there be tegra195, tegra 196,
> > etc added to this driver?
> > 
> > Also, please capitalize the first word and "PM" in the subjects:
> > 
> >    PCI: tegra194: Fix runtime PM imbalance on error
> > 
> > Bjorn
> > 
