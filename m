From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI: tegra: fix runtime pm imbalance on error
Date: Wed, 20 May 2020 11:37:39 -0500
Message-ID: <20200520163739.GA1100601@bjorn-Precision-5520>
References: <20200520095908.GD2136208@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200520095908.GD2136208@ulmo>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, May 20, 2020 at 11:59:08AM +0200, Thierry Reding wrote:
> On Wed, May 20, 2020 at 04:52:23PM +0800, Dinghao Liu wrote:
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > it returns an error code. Thus a pairing decrement is needed on
> 
> s/even it/even when it/
> 
> Might also be a good idea to use a different subject prefix because I
> was almost not going to look at the other patch, taking this to be a
> replacement for it.

Amen.  This would be a good change to start using "PCI: tegra194" or
something for pcie-tegra194.c.  Or will there be tegra195, tegra 196,
etc added to this driver?

Also, please capitalize the first word and "PM" in the subjects:

  PCI: tegra194: Fix runtime PM imbalance on error

Bjorn
