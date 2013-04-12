From: Jay Agarwal <jagarwal@nvidia.com>
Subject: RE: [PATCH 2/3] ARM: dts: tegra: Correct PCIe entry
Date: Fri, 12 Apr 2013 20:33:20 +0530
Message-ID: <C79B248886DD134989C8FF6B096A91AB91B36FB2FE@BGMAIL01.nvidia.com>
References: <1365435688-4179-1-git-send-email-jagarwal@nvidia.com>
 <1365435688-4179-2-git-send-email-jagarwal@nvidia.com>
 <51630BF4.6000605@wwwdotorg.org>
 <20130409083050.GQ3572@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130409083050.GQ3572@tbergstrom-lnx.Nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Krishna Thota <kthota@nvidia.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "olof@lixom.net" <olof@lixom.net>, Laxman Dewangan <ldewangan@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "mturquette@linaro.org" <mturquette@linaro.org>, Juha Tukkinen <jtukkinen@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

> On Mon, Apr 08, 2013 at 08:27:00PM +0200, Stephen Warren wrote:
> > On 04/08/2013 09:41 AM, Jay Agarwal wrote:
> > > Signed-off-by: Jay Agarwal <jagarwal@nvidia.com>
> >
> > Your s-o-b line should be below the patch description, not above it.
> > Please see Documentation/SubmittingPatches.
> >
> > I also don't see a --- line between the patch description and diffstat.
> > How are you generating these patch emails? Please see our internal
> > wiki, or other git documentation.
> >
> > > diff --git a/arch/arm/boot/dts/tegra30.dtsi
> > > b/arch/arm/boot/dts/tegra30.dtsi
> >
> > > -		clock-names = "pex", "afi", "pcie_xclk", "pll_e", "cml";
> > > +		clock-names = "pex", "afi", "pcie_xclk", "pll_e", "cml0";
> >
> > Can you please explain more about this change?
> >
> > I see the Tegra clock driver provides both a "cml0" and a "cml1" clock.
> > Are both of those used for PCIe?
> >
> 
> cml0 is used for pcie and cml1 is used for sata.
> 
[>] Yes correct.
