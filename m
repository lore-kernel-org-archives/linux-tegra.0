From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] ARM: tegra: Register host1x node with iommu binding on
 tegra124
Date: Tue, 11 Jul 2017 18:05:55 +0300
Message-ID: <1499785555.1340.15.camel@paulk.fr>
References: <20170709163614.6746-1-contact@paulk.fr>
 <1499763009.1340.11.camel@paulk.fr> <1499784841.1520.20.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1499784841.1520.20.camel@toradex.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Cc: "treding@nvidia.com" <treding@nvidia.com>, "mperttunen@nvidia.com" <mperttunen@nvidia.com>, "swarren@nvidia.com" <swarren@nvidia.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2017-07-11 at 14:54 +0000, Marcel Ziswiler wrote:
> On Tue, 2017-07-11 at 11:50 +0300, Paul Kocialkowski wrote:
> > On Sun, 2017-07-09 at 19:36 +0300, Paul Kocialkowski wrote:
> > > This registers the host1x node with the SMMU (as HC swgroup) to
> > > allow
> > > the host1x code to attach to it. It avoid failing the probe
> > > sequence,
> > > which resulted in the tegra drm driver not probing and thus
> > > nothing
> > > being displayed on-screen.
> > 
> > Fixes: 404bfb78daf3 ("gpu: host1x: Add IOMMU support")
> > 
> > > Signed-off-by: Paul Kocialkowski <contact-
> > > W9ppeneeCTY@public.gmane.org>
> 
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Tested-on: Apalis TK1, Jetson-TK1
> 
> > > ---
> > >  arch/arm/boot/dts/tegra124.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/tegra124.dtsi
> > > b/arch/arm/boot/dts/tegra124.dtsi
> > > index 187a36c6d0fc..b3b89befffeb 100644
> > > --- a/arch/arm/boot/dts/tegra124.dtsi
> > > +++ b/arch/arm/boot/dts/tegra124.dtsi
> > > @@ -85,6 +85,7 @@
> > >  		clocks = <&tegra_car TEGRA124_CLK_HOST1X>;
> > >  		resets = <&tegra_car 28>;
> > >  		reset-names = "host1x";
> > > +		iommus = <&mc TEGRA_SWGROUP_HC>;
> > >  
> > >  		#address-cells = <2>;
> > >  		#size-cells = <2>;
> 
> So I take it we still will need this one moving forward, correct?

Yes, this one actually enables the IOMMU while the other one handles the
failure to attach the IOMMU without brinding the whole drm driver down.

So it's best to actually make use of the feature!

> How about tegra30, I guess the same applies there, isn't it? Should I
> send a patch or are you guys doing that?

I don't have any tegra hardware aside of tegra124, so that's all I can
contribute to. I don't know if others have looked into the same type of
issue happening on either newer or older platforms.

Cheers,

-- 
Paul Kocialkowski,

developer of free digital technology and hardware support

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
