From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [v2 1/1] ARM: dt: tegra{20,30}.dtsi: Rename "MC" to "Memory
 Controller"
Date: Wed, 16 May 2012 19:15:40 +0200
Message-ID: <20120516.201540.1972877673672045065.hdoyu@nvidia.com>
References: <1337151226-7266-1-git-send-email-hdoyu@nvidia.com><1337172241-28677-1-git-send-email-hdoyu@nvidia.com><4FB3CC87.4030505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FB3CC87.4030505-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote @ Wed, 16 May 2012 17:49:27 +0200:

> On 05/16/2012 06:44 AM, Hiroshi DOYU wrote:
> > Use a more plain english name.
> 
> It's probably too late taking this cosmetic change for 3.5.
> 
> There is also an "emc" node that probably should be renamed to
> memory-controller too. In that case, since there will be two
> memory-controller nodes, you'll need to add the unit address
> ("@xxxxxxxx") back on the end of both the node names.
> 
> Can I get a patch series that does all that and updates the binding
> documentation for both MC and EMC? Probably separate patches for MC and EMC.

Sure. How should we deal with "emc" for emc-table in seaboard?

$% grep -n emc arch/arm/boot/dts/*
arch/arm/boot/dts/prima2-cb.dts:87:                             compatible = "sirf,prima2-memc";
arch/arm/boot/dts/tegra20.dtsi:180:     emc {
arch/arm/boot/dts/tegra20.dtsi:181:             compatible = "nvidia,tegra20-emc";
arch/arm/boot/dts/tegra-seaboard.dts:337:       emc {
arch/arm/boot/dts/tegra-seaboard.dts:338:               emc-table@190000 {
arch/arm/boot/dts/tegra-seaboard.dts:340:                       compatible = "nvidia,tegra20-emc-table";
arch/arm/boot/dts/tegra-seaboard.dts:342:                       nvidia,emc-registers = <0x0000000c 0x00000026
arch/arm/boot/dts/tegra-seaboard.dts:356:               emc-table@380000 {
arch/arm/boot/dts/tegra-seaboard.dts:358:                       compatible = "nvidia,tegra20-emc-table";
arch/arm/boot/dts/tegra-seaboard.dts:360:                       nvidia,emc-registers = <0x00000017 0x0000004b
