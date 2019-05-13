From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V6 02/15] PCI/PME: Export pcie_pme_disable_msi() &
 pcie_pme_no_msi() APIs
Date: Mon, 13 May 2019 00:25:39 -0700
Message-ID: <20190513072539.GA27708@infradead.org>
References: <20190513050626.14991-1-vidyas@nvidia.com>
 <20190513050626.14991-3-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190513050626.14991-3-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Mon, May 13, 2019 at 10:36:13AM +0530, Vidya Sagar wrote:
> Export pcie_pme_disable_msi() & pcie_pme_no_msi() APIs to enable drivers
> using these APIs be able to build as loadable modules.

But this is a global setting.  If you root port is broken you need
a per-rootport quirk instead.
