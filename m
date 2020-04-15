From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: Fix reporting GPIO error value
Date: Wed, 15 Apr 2020 18:49:30 +0200
Message-ID: <20200415164930.GF19897@qmqm.qmqm.pl>
References: <20200414102512.27506-1-pali@kernel.org>
 <20200414113104.GA27984@qmqm.qmqm.pl>
 <20200415111736.czeh7a3iqmmasow6@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200415111736.czeh7a3iqmmasow6@pali>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pali =?iso-8859-2?Q?Roh=E1r?= <pali-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Andrew Murray <amurray-tUaQ5FxYRYX4aQPF92CzsNBc4/FLrbF6@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 15, 2020 at 01:17:36PM +0200, Pali Rohár wrote:
> On Tuesday 14 April 2020 13:31:04 Micha³ Miros³aw wrote:
> > On Tue, Apr 14, 2020 at 12:25:12PM +0200, Pali Rohár wrote:
> > > Error code is stored in rp->reset_gpio and not in err variable.a
[...]
> > > -				dev_err(dev, "failed to get reset GPIO: %d\n",
> > > -					err);
> > > +				dev_err(dev, "failed to get reset GPIO: %ld\n",
> > > +					PTR_ERR(rp->reset_gpio));
> > >  				return PTR_ERR(rp->reset_gpio);
> > >  			}
> > >  		}
> > 
> > You can use %pe directly on the pointer for added benefit of translation
> > of the error to a name.
> 
> Well, I do not know what is the current preferred style of error
> messages. On lot of places I see just numeric error numbers.

%pe is quite a recent addition to the kernel (since v5.3).

Best Regards
Micha³ Miros³aw
