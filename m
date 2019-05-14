From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V6 02/15] PCI/PME: Export pcie_pme_disable_msi() &
 pcie_pme_no_msi() APIs
Date: Tue, 14 May 2019 09:00:19 +0530
Message-ID: <3a8cea93-2aeb-e5e2-4d56-f0c6449073c3@nvidia.com>
References: <20190513050626.14991-1-vidyas@nvidia.com>
 <20190513050626.14991-3-vidyas@nvidia.com>
 <20190513072539.GA27708@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513072539.GA27708@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 5/13/2019 12:55 PM, Christoph Hellwig wrote:
> On Mon, May 13, 2019 at 10:36:13AM +0530, Vidya Sagar wrote:
>> Export pcie_pme_disable_msi() & pcie_pme_no_msi() APIs to enable drivers
>> using these APIs be able to build as loadable modules.
> 
> But this is a global setting.  If you root port is broken you need
> a per-rootport quirk instead.
> 
There is nothing broken in Tegra194 root port as such, rather,  this is more
of software configuration choice and we are going with legacy interrupts than
MSI interrupts (as Tegra194 doesn't support raising PME interrupts through MSI
and please note that this doesn't mean root port is broken). Since Tegra194 has
only Synopsys DesignWare core based host controllers and not any other hosts, I
think it is fine to call this API in driver. Also, since this is a global setting,
calling this APIs from anywhere (be it from quirk or from driver) would have the
same effect, or did I miss anything here?
