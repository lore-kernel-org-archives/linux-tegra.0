From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] tegra: dpaux: pinctrl proposal
Date: Wed, 20 May 2015 14:46:07 +0100
Message-ID: <555C901F.8090009@nvidia.com>
References: <1431963229-12867-1-git-send-email-jonathanh@nvidia.com> <20150519144654.GG26748@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150519144654.GG26748-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 19/05/15 15:46, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, May 18, 2015 at 04:33:49PM +0100, Jon Hunter wrote:
>> Background:
>> ==========
>> On tegra124 and tegra132 devices the pads used by the Display Port Auxiliary
>> (DPAUX) channel are multiplexed such that they can also be used by one of the
>> internal i2c controllers. Note that this is different from i2c-over-AUX
>> supported by the DPAUX controller. The register that configures these pads is
>> part of the DPAUX controllers register set and so requires the clock for the
>> DPAUX controller to be enabled to access the register as well as keeping the
>> SOR (serial output resource) power domain enabled.
>>
>> Currently, there is no pinctrl device for these pads and so cannot be easily
>> mapped to function as an i2c interface. Furthermore, when using the pads for
>> the DPAUX channel, the DPAUX driver (drivers/gpu/drm/tegra/dpaux.c) directly
>> writes the to appropriate register to setup the pads.
>>
>> There are some products based upon the tegra132 that use these pads for an
>> internal i2c controller and hence we want to support this configuration in the
>> kernel.
> 
> Good timing, I was going to (reluctantly) add this to my long TODO list.
> I generally like the proposal.

Ok, great.
 
>> Proposal:
>> ========
>> Add a DPAUX MFD device that consists of a DPAUX controller, for the Display
>> Port Auxiliary related functionality and a DPAUX pad controller, for handling
>> the pinctrl for the DPAUX pads. Both the DPAUX controller and DPAUX pad
>> controller need to access the DPAUX register set and therefore, by making the
>> MFD compatible with "simple-mfd" and "syscon", a regmap for the DPAUX registers
>> will be created to synchronise register accesses made by the drivers.
> 
> Can we not do without an MFD here? Not only would it break DT ABI, but
> it's also way more complicated than it needs to be in my opinion, we're
> only sharing a single register (or perhaps even two) after all. Keeping
> everything in a single DT node would also make the binding less awkward
> because the power domain doesn't apply to the pad controller part of
> DPAUX.
> 
> Can't the dpaux driver simply register the pinmux controller itself?

Do you think something that looks like the below?

+Example (tegra124 DPAUX):
+
+/ {
+       ...
+
+       host1x {
+               compatible = "nvidia,tegra124-host1x", "simple-bus";
+               ...
+
+               dpaux: dpaux@0,545c0000 {
+                       compatible = "nvidia,tegra124-dpaux",
+                       reg = <0x0 0x545c0000 0x0 0x40000>;
+                       interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+                       clocks = <&tegra_car TEGRA124_CLK_DPAUX>,
+                                <&tegra_car TEGRA124_CLK_PLL_DP>;
+                       clock-names = "dpaux", "parent";
+                       resets = <&tegra_car 181>;
+                       reset-names = "dpaux";
+                       pinctrl-0 = <&dpaux_state>;
+                       pinctrl-names = "default";
+                       status = "disabled";
+
+                       dpaux_padctl@0,545c0124 {
+                               compatible = "nvidia,tegra124-dpaux-padctl";
+
+                               dpaux_state: dpaux_state0 {
+                                       dpaux {
+                                               nvidia,function = "dpaux";
+                                       };
+                               };
+
+                               i2c_state: i2c_state0 {
+                                       i2c {
+                                               nvidia,function = "i2c";
+                                       };
+                               };
+                       };
+               };
+       };
+};

Cheers
Jon
