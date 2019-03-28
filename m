From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [PATCH 01/10] PCI: save pci_bus pointer in pcie_port structure
Date: Thu, 28 Mar 2019 07:18:03 +0000
Message-ID: <20190328151008.5e563e3a@xhacker.debian>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
 <1553613207-3988-2-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1553613207-3988-2-git-send-email-vidyas@nvidia.com>
Content-Language: en-US
Content-ID: <CA2DA71B664C7E4E8AB50B328815B78A@namprd03.prod.outlook.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "heiko@sntech.de" <heiko@sntech.de>, "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>, "tiwai@suse.de" <tiwai@suse.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "spujar@nvidia.com" <spujar@nvidia.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "kthota@nvidia.com" <kthota@nvidia.com>, "mperttunen@nvidia.com" <mperttunen@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "krzk@kernel.org" <krzk@kernel.org>, "kishon@ti.com" <kishon@ti.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, linux-pc
List-Id: linux-tegra@vger.kernel.org

On Tue, 26 Mar 2019 20:43:18 +0530Vidya Sagar wrote:

> 
> save pci_bus pointer created by PCIe sub-system's
> pci_scan_root_bus_bridge() to be used by host controller drivers for post
> processing. Tegra host controller driver needs it for the following
> reasons
> - to derive pci_host_bridge structure from pci_bus which is used to
> configure iATU's outbound regions for different windows accesses
> - to traverse and configure downstream hierarchy. One such case is,
> configuring all immediate downstream devices to D0 state before transiting
> link to L2 state. Saving pci_bus pointer seems the best method compared to
> deriving it by other means.

hmm, I submitted similar patch for another purpose last month, 

https://patchwork.kernel.org/patch/10830029/

then v3 weeks ago

https://lkml.org/lkml/2019/3/18/375

And get Acks from Gustavo. But it seems that it isn't merged to dwc next
branch in Lorenzo's tree

Maybe Lorenzo have some idea of handling this case.

Thanks
