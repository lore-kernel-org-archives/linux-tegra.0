From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v2] PCI: tegra: Fix return value check of
 pm_runtime_get_sync
Date: Thu, 9 Jan 2020 12:13:09 +0000
Message-ID: <20200109121309.GB10919@e121166-lin.cambridge.arm.com>
References: <20191216111825.28136-1-david.engraf@sysgo.com>
 <20191217143632.GA160591@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191217143632.GA160591@google.com>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: David Engraf <david.engraf@sysgo.com>, thierry.reding@gmail.com, andrew.murray@arm.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 17, 2019 at 08:36:32AM -0600, Bjorn Helgaas wrote:
> On Mon, Dec 16, 2019 at 12:18:25PM +0100, David Engraf wrote:
> > pm_runtime_get_sync() returns the device's usage counter. This might
> > be >0 if the device is already powered up or CONFIG_PM is disabled.
> > 
> > Abort probe function on real error only.
> > 
> > Fixes: da76ba50963b ("PCI: tegra: Add power management support")
> > Signed-off-by: David Engraf <david.engraf@sysgo.com>
> 
> I added Andrew's ack and a stable tag for v4.17+.  Also cc'd
> Manikanta, author of da76ba50963b.
> 
> I put this on my pci/host-tegra branch for v5.6 for now.  Lorenzo may
> move this when he returns.

Hi Bjorn,

I could not find pci/host-tegra in your public repo, have you deleted it
in the meanwhile ?

I am happy to merge it myself, asking to check if there is anything
I am missing.

Thanks,
Lorenzo
