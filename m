From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 2/3] ARM: dts: tegra: Correct PCIe entry
Date: Tue, 9 Apr 2013 11:30:50 +0300
Message-ID: <20130409083050.GQ3572@tbergstrom-lnx.Nvidia.com>
References: <1365435688-4179-1-git-send-email-jagarwal@nvidia.com>
 <1365435688-4179-2-git-send-email-jagarwal@nvidia.com>
 <51630BF4.6000605@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51630BF4.6000605@wwwdotorg.org>
Sender: linux-pci-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Jay Agarwal <jagarwal@nvidia.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, Laxman Dewangan <ldewangan@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "olof@lixom.net" <olof@lixom.net>, Hiroshi Doyu <hdoyu@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "mturquette@linaro.org" <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Juha Tukkinen <jtukkinen@nvidia.com>, Krishna Thota <kthota@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 08, 2013 at 08:27:00PM +0200, Stephen Warren wrote:
> On 04/08/2013 09:41 AM, Jay Agarwal wrote:
> > Signed-off-by: Jay Agarwal <jagarwal@nvidia.com>
> 
> Your s-o-b line should be below the patch description, not above it.
> Please see Documentation/SubmittingPatches.
> 
> I also don't see a --- line between the patch description and diffstat.
> How are you generating these patch emails? Please see our internal wiki,
> or other git documentation.
> 
> > diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> 
> > -		clock-names = "pex", "afi", "pcie_xclk", "pll_e", "cml";
> > +		clock-names = "pex", "afi", "pcie_xclk", "pll_e", "cml0";
> 
> Can you please explain more about this change?
> 
> I see the Tegra clock driver provides both a "cml0" and a "cml1" clock.
> Are both of those used for PCIe?
> 

cml0 is used for pcie and cml1 is used for sata.

Cheers,

Peter.
