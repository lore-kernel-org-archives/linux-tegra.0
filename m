From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2 3/3] Documentation: DT bindings: Tegra AHB: note base
 address change
Date: Thu, 19 Mar 2015 17:55:04 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1503191706340.9480@utopia.booyaka.com>
References: <20150317083221.32662.14647.stgit@baseline> <20150317083221.32662.96822.stgit@baseline> <20150317103806.GU8656@n2100.arm.linux.org.uk> <alpine.DEB.2.02.1503191525450.9480@utopia.booyaka.com> <550AEE6B.5080301@wwwdotorg.org>
 <alpine.DEB.2.02.1503191601520.9480@utopia.booyaka.com> <550AFF52.6070503@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550AFF52.6070503-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 19 Mar 2015, Stephen Warren wrote:

> The binding document is supposed to say what value the reg property should
> have. 

If you look at other DT binding documentation in the kernel, this is 
generally not the case.  Consider these examples:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/i2c/i2c-omap.txt
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/i2c/i2c-exynos5.txt

For example, the bcm2835 I2C binding documentation only mentions one of 
the two I2C controllers apparently available on the system:

$ fgrep -r i2c arch/arm/boot/dts/ | fgrep bcm2835 | fgrep \@
arch/arm/boot/dts/bcm2835.dtsi:		i2c0: i2c@20205000 {
arch/arm/boot/dts/bcm2835.dtsi:		i2c1: i2c@7e804000 {
$

The Exynos documentation contains only one address of many I2C controllers 
on the various SoCs:

$ fgrep -r i2c arch/arm/boot/dts/ | fgrep exynos | fgrep \@
...
arch/arm/boot/dts/exynos4415.dtsi:		i2c_0: i2c@13860000 {
arch/arm/boot/dts/exynos4415.dtsi:		i2c_1: i2c@13870000 {
arch/arm/boot/dts/exynos4415.dtsi:		i2c_2: i2c@13880000 {
arch/arm/boot/dts/exynos4415.dtsi:		i2c_3: i2c@13890000 {
arch/arm/boot/dts/exynos4415.dtsi:		i2c_4: i2c@138A0000 {
arch/arm/boot/dts/exynos4415.dtsi:		i2c_5: i2c@138B0000 {
arch/arm/boot/dts/exynos4415.dtsi:		i2c_6: i2c@138C0000 {
arch/arm/boot/dts/exynos4415.dtsi:		i2c_7: i2c@138D0000 {
arch/arm/boot/dts/exynos5250.dtsi:	i2c_0: i2c@12C60000 {
arch/arm/boot/dts/exynos5250.dtsi:	i2c_1: i2c@12C70000 {
arch/arm/boot/dts/exynos5250.dtsi:	i2c_2: i2c@12C80000 {
arch/arm/boot/dts/exynos5250.dtsi:	i2c_3: i2c@12C90000 {
arch/arm/boot/dts/exynos5250.dtsi:	i2c_4: i2c@12CA0000 {
arch/arm/boot/dts/exynos5250.dtsi:	i2c_5: i2c@12CB0000 {
arch/arm/boot/dts/exynos5250.dtsi:	i2c_6: i2c@12CC0000 {
arch/arm/boot/dts/exynos5250.dtsi:	i2c_7: i2c@12CD0000 {
arch/arm/boot/dts/exynos5250.dtsi:	i2c_8: i2c@12CE0000 {
arch/arm/boot/dts/exynos5250.dtsi:	i2c_9: i2c@121D0000 {
arch/arm/boot/dts/exynos5420.dtsi:	i2c_0: i2c@12C60000 {
arch/arm/boot/dts/exynos5420.dtsi:	i2c_1: i2c@12C70000 {
arch/arm/boot/dts/exynos5420.dtsi:	i2c_2: i2c@12C80000 {
arch/arm/boot/dts/exynos5420.dtsi:	i2c_3: i2c@12C90000 {
arch/arm/boot/dts/exynos5420.dtsi:	hsi2c_4: i2c@12CA0000 {
arch/arm/boot/dts/exynos5420.dtsi:	hsi2c_5: i2c@12CB0000 {
arch/arm/boot/dts/exynos5420.dtsi:	hsi2c_6: i2c@12CC0000 {
arch/arm/boot/dts/exynos5420.dtsi:	hsi2c_7: i2c@12CD0000 {
arch/arm/boot/dts/exynos5420.dtsi:	hsi2c_8: i2c@12E00000 {
arch/arm/boot/dts/exynos5420.dtsi:	hsi2c_9: i2c@12E10000 {
arch/arm/boot/dts/exynos5420.dtsi:	hsi2c_10: i2c@12E20000 {
arch/arm/boot/dts/exynos5440.dtsi:	i2c@F0000 {
arch/arm/boot/dts/exynos5440.dtsi:	i2c@10000 {
...
$

And there are many other integration details that would need to be 
specified in the documentation using the approach that you advocate - for 
example, interrupt and DMA IDs, etc.

> If we require some unusual offset in the reg property (i.e. something
> other than what the HW documentation describes as the module base address),
> that ought to be documented. We do have this situation for this module at
> present, although the documentation unfortunately doesn't explicitly call this
> out even though the example alludes to it.
>
> I do think we should at least fix the example so it isn't confusing and
> inconsistent with expected practice. We could either switch the example to
> Tegra210 so we only provide the best example going forward, or have separate
> examples for Tegra20/210 to highlight the difference.
> 
> We should also add documentation that Chips before Tegra210 (or 
> Tegra132?) *require* the extra offset. Any code or DT written to the 
> existing (admittedly slightly implicit) binding needs to continue to 
> work, so we should document this unusual requirement, even if we enhance 
> the Linux driver to accept either mode of operation.

After the two driver patches (after rmk's requested changes) are applied, 
no unusual offset will be required, but if the legacy offset is specified, 
it will be transparently handled.

As I see it, there are three possible cases:

1. the legacy, incorrect base address is used, in which case everything 
will still work but there will be a warning;

2. the correct base address (from a hardware SoC integration point of 
view) is used, in which case everything will work with no warnings,

3. a novel, completely incorrect base address is used, in which case the 
IP block won't work at all and the driver will fail completely

After the patches, the driver now handles the first two cases.  If you 
would like the DT binding documentation practice changed to attempt to 
address the third case, by requiring DT binding documentation to contain 
lists of the correct IP integration data for every possible chip that 
contains that IP block, as you mention above, such a change would be a 
major delta from existing kernel practice, so would certainly mandate 
submitting a patch for the common DT binding documentation file at

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/submitting-patches.txt

> Other OSs and old versions of Linux will still need the exception for 
> older SoCs.

How about this: I will send a patch for the DT binding documentation to 
note that versions of Linux prior to v4.1 (unless Torvalds runs another 
poll) require the four-byte-offset base address.  Is that sufficient to 
address your concerns with this series?


- Paul
