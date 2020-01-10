From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v2] PCI: tegra: Fix return value check of
 pm_runtime_get_sync
Date: Fri, 10 Jan 2020 14:45:55 +0000
Message-ID: <20200110144555.GA27048@e121166-lin.cambridge.arm.com>
References: <20200109121309.GB10919@e121166-lin.cambridge.arm.com>
 <20200109182333.GA252736@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200109182333.GA252736@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: David Engraf <david.engraf@sysgo.com>, thierry.reding@gmail.com, andrew.murray@arm.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 09, 2020 at 12:23:33PM -0600, Bjorn Helgaas wrote:
> On Thu, Jan 09, 2020 at 12:13:09PM +0000, Lorenzo Pieralisi wrote:
> > On Tue, Dec 17, 2019 at 08:36:32AM -0600, Bjorn Helgaas wrote:
> > > On Mon, Dec 16, 2019 at 12:18:25PM +0100, David Engraf wrote:
> > > > pm_runtime_get_sync() returns the device's usage counter. This might
> > > > be >0 if the device is already powered up or CONFIG_PM is disabled.
> > > > 
> > > > Abort probe function on real error only.
> > > > 
> > > > Fixes: da76ba50963b ("PCI: tegra: Add power management support")
> > > > Signed-off-by: David Engraf <david.engraf@sysgo.com>
> > > 
> > > I added Andrew's ack and a stable tag for v4.17+.  Also cc'd
> > > Manikanta, author of da76ba50963b.
> > > 
> > > I put this on my pci/host-tegra branch for v5.6 for now.  Lorenzo may
> > > move this when he returns.
> > 
> > Hi Bjorn,
> > 
> > I could not find pci/host-tegra in your public repo, have you deleted it
> > in the meanwhile ?
> 
> Welcome back, Lorenzo!  Sorry, I forgot to push the pci/host-tegra
> branch.  It has been in -next for a while, though.  I pushed it now.
> Happy to drop the branch if you want to add more Tegra stuff, just let
> me know.

Thank you, I will have to add at least another tegra patch so I think
it is best to drop your branch, I applied this patch to my pci/tegra
branch and pushed it out in the meanwhile.

Thanks,
Lorenzo
