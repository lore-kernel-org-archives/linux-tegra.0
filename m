From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V4 0/5] Add support for PCIe endpoint mode in Tegra194
Date: Tue, 10 Mar 2020 17:58:28 +0000
Message-ID: <20200310175820.GA13909@e121166-lin.cambridge.arm.com>
References: <20200303105418.2840-1-vidyas@nvidia.com>
 <20200303170103.GA9641@e121166-lin.cambridge.arm.com>
 <d1e3a42f-c179-fd03-fac0-7cd449580e5b@nvidia.com>
 <b47de9cd-be18-1672-d72c-de4169fb90e5@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b47de9cd-be18-1672-d72c-de4169fb90e5-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, andrew.murray-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 10, 2020 at 11:12:35PM +0530, Vidya Sagar wrote:
> 
> 
> On 3/3/2020 11:43 PM, Vidya Sagar wrote:
> > 
> > 
> > On 3/3/2020 10:31 PM, Lorenzo Pieralisi wrote:
> > > External email: Use caution opening links or attachments
> > > 
> > > 
> > > On Tue, Mar 03, 2020 at 04:24:13PM +0530, Vidya Sagar wrote:
> > > > Tegra194 has three (C0, C4 & C5) dual mode PCIe controllers that
> > > > can operate
> > > > either in root port mode or in end point mode but only in one
> > > > mode at a time.
> > > > Platform P2972-0000 supports enabling endpoint mode for C5
> > > > controller. This
> > > > patch series adds support for PCIe endpoint mode in both the
> > > > driver as well as
> > > > in DT.
> > > > This patch series depends on the changes made for Synopsys
> > > > DesignWare endpoint
> > > > mode subsystem that are recently accepted.
> > > > @ https://patchwork.kernel.org/project/linux-pci/list/?series=202211
> > > > which in turn depends on the patch made by Kishon
> > > > @ https://patchwork.kernel.org/patch/10975123/
> > > > which is also under review.
> > > > 
> > > > V4:
> > > > * Started using threaded irqs instead of kthreads
> > > 
> > > Hi Vidya,
> > > 
> > > sorry for the bother, may I ask you to rebase the series (after
> > > answering Thierry's query) on top of my pci/endpoint branch please ?
> > > 
> > > Please resend it and I will merge patches {1,2,5} then.
> > Sure.
> > I just sent V5 series rebasing patches on top of your pci/endpoint branch.
> Hi,
> Sorry to bother you again.
> Could you please take a look at V5 series?

I will merge it tomorrow, apologies.

Thanks,
Lorenzo
