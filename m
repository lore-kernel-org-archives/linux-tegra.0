From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: Use pci_parse_request_of_pci_ranges()
Date: Mon, 24 Feb 2020 11:37:16 +0000
Message-ID: <20200224113716.GB11120@e121166-lin.cambridge.arm.com>
References: <20191028225136.22289-1-robh@kernel.org>
 <20200221142051.GB15440@e121166-lin.cambridge.arm.com>
 <c7392952-929a-5be4-ab06-9cf04810290f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c7392952-929a-5be4-ab06-9cf04810290f-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Feb 22, 2020 at 11:06:18PM +0530, Vidya Sagar wrote:
> 
> 
> On 2/21/2020 7:50 PM, Lorenzo Pieralisi wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Mon, Oct 28, 2019 at 05:51:36PM -0500, Rob Herring wrote:
> > > Convert Tegra PCI host driver to use the common
> > > pci_parse_request_of_pci_ranges().
> > > 
> > > This allows removing the DT ranges parsing, PCI resource handling, and
> > > private storage of resources from the driver.
> > > 
> > > Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> > > Cc: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
> > > Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > > Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > ---
> > > Here's one more conversion to use pci_parse_request_of_pci_ranges. It's
> > > dependent on my prior series, specifically this patch[1].
> > > 
> > > Compile tested only.
> > > 
> > > Rob
> > > 
> > > [1] https://patchwork.ozlabs.org/patch/1185555/
> > > 
> > >   drivers/pci/controller/pci-tegra.c | 187 +++++++----------------------
> > >   1 file changed, 46 insertions(+), 141 deletions(-)
> > 
> > Patch still applies, I need testing and ACK from Tegra maintainers
> > please.
> I tested this patch on Jetson-TX1 with NVMe drive connected to it.
> Verified basic enumeration and functionality of the drive.
> 
> Tested-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks a lot, I need Thierry's ACK to merge it, thanks.

Lorenzo
