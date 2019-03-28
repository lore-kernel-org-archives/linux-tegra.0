From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [PATCH 10/10] arm64: Add Tegra194 PCIe driver to defconfig
Date: Thu, 28 Mar 2019 08:19:23 +0000
Message-ID: <20190328161138.1b37d232@xhacker.debian>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
 <1553613207-3988-11-git-send-email-vidyas@nvidia.com>
 <a0491042-2f24-4ba8-754b-ba3959b77d6f@nvidia.com>
 <44d7ff1d-c317-6ba2-86c0-981a6356ee9e@nvidia.com>
 <c5ca34fe-4290-d9b7-cda3-23b4a11ec5d8@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <c5ca34fe-4290-d9b7-cda3-23b4a11ec5d8@nvidia.com>
Content-Language: en-US
Content-ID: <2C9ADE63A27E1441B853A77492AD4DF5@namprd03.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "heiko@sntech.de" <heiko@sntech.de>, "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>, "tiwai@suse.de" <tiwai@suse.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "spujar@nvidia.com" <spujar@nvidia.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "kthota@nvidia.com" <kthota@nvidia.com>, "mperttunen@nvidia.com" <mperttunen@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "krzk@kernel.org" <krzk@kernel.org>, "kishon@ti.com" <kishon@ti.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 27 Mar 2019 12:26:49 +0000 Jon Hunter wrote:

> 
> 
> On 27/03/2019 10:12, Vidya Sagar wrote:
> > On 3/27/2019 3:38 PM, Jon Hunter wrote:  
> >>
> >> On 26/03/2019 15:13, Vidya Sagar wrote:  
> >>> Add PCIe host controller driver for DesignWare core based
> >>> PCIe controller IP present in Tegra194.
> >>>
> >>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> >>> ---
> >>>   arch/arm64/configs/defconfig | 1 +
> >>>   1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> >>> index 2d9c39033c1a..2ddea5c4e87d 100644
> >>> --- a/arch/arm64/configs/defconfig
> >>> +++ b/arch/arm64/configs/defconfig
> >>> @@ -87,6 +87,7 @@ CONFIG_PCIE_QCOM=y
> >>>   CONFIG_PCIE_ARMADA_8K=y
> >>>   CONFIG_PCIE_KIRIN=y
> >>>   CONFIG_PCIE_HISI_STB=y
> >>> +CONFIG_PCIE_TEGRA194=y
> >>>   CONFIG_ARM64_VA_BITS_48=y
> >>>   CONFIG_SCHED_MC=y
> >>>   CONFIG_NUMA=y  
> >>
> >> Maybe building as a module is more appropriate here as I am not sure
> >> that anyone else will want this built-in and it is not critical to
> >> booting AFAIK.  
> > Since the DesignWare core framework doesn't yet have support for making
> > this
> > as a module, I added it as a built-in driver. I'll switch it to a module
> > once support is available.  
> 
> Ah I see. We often get reports/patches if a driver has a removal
> function but is defined in the Kconfig to only support being built-in.
> 
> Does the designware core just need to export some symbols to support it
> being a module? If so it maybe worth adding these as part of the series
> to see if it is acceptable, otherwise it might not get done and there is
> no point us supporting it as a module.

After https://lkml.org/lkml/2019/3/18/363

we could implement the "remove"

Thanks
