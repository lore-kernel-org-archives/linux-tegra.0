From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V6 02/15] PCI/PME: Export pcie_pme_disable_msi() &
 pcie_pme_no_msi() APIs
Date: Mon, 13 May 2019 23:02:27 -0700
Message-ID: <20190514060227.GA7625@infradead.org>
References: <20190513050626.14991-1-vidyas@nvidia.com>
 <20190513050626.14991-3-vidyas@nvidia.com>
 <20190513072539.GA27708@infradead.org>
 <3a8cea93-2aeb-e5e2-4d56-f0c6449073c3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <3a8cea93-2aeb-e5e2-4d56-f0c6449073c3@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, mperttunen@nvidia.com, mmaddireddy@nvidia.com, linux-pci@vger.kernel.org, catalin.marinas@arm.com, kthota@nvidia.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com, Christoph Hellwig <hch@infradead.org>, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, gustavo.pimentel@synopsys.com, jingoohan1@gmail.com, bhelgaas@google.com, kishon@ti.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Tue, May 14, 2019 at 09:00:19AM +0530, Vidya Sagar wrote:
> There is nothing broken in Tegra194 root port as such, rather,  this is more
> of software configuration choice and we are going with legacy interrupts than
> MSI interrupts (as Tegra194 doesn't support raising PME interrupts through MSI
> and please note that this doesn't mean root port is broken).

It seems odd at least and probably broken if it adverises MSI interrupts,
but than doesn't actually support them fully.

> Since Tegra194 has
> only Synopsys DesignWare core based host controllers and not any other hosts, I
> think it is fine to call this API in driver. Also, since this is a global setting,
> calling this APIs from anywhere (be it from quirk or from driver) would have the
> same effect, or did I miss anything here?

Maybe in your current particular case this is true, but in general
we see more and more systems with different kind of root ports, and
having a driver set a global variable due to its own hardwares quirk
defeats that.  So the right thing here is to replace the global
flag with a per-device one first before setting it for a driver.
