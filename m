From: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: Add basic support for carma devkit
Date: Tue, 25 Jun 2013 15:47:38 +0000 (UTC)
Message-ID: <loom.20130625T165829-570@post.gmane.org>
References: <1371994685-4997-1-git-send-email-chris.desjardins@amscins.com> <51C87FA5.3000306@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren@...> writes:

> 
> On 06/23/2013 07:38 AM, Chris Desjardins wrote:
> 

> 
> > +	serial <at> 70006200 {
> > +		compatible = "ns16550";
> 
> You shouldn't need to set the compatible value for this node;
> tegra30.dtsi has already set it.

True, but it is set to "nvidia,tegra30-uart", "nvidia,tegra20-uart" which 
causes the nvidia high speed uart driver to be loaded, which sucks when you 
are debugging over serial (which is my normal mode of operation) and half 
way through the boot process your serial port goes away because the ns16550 
driver you were using was unloaded and the high speed uart driver was loaded 
instead... If it is all the same I would rather just keep the old reliable 
driver loaded on this port (it is the only exposed serial port on the carma 
devkit), and I suspect other developers will feel the same... 

> 
> > +		tps62361 {
> ...
> > +			regulator-min-microvolt = <500000>;
> > +			regulator-max-microvolt = <1500000>;
> ...
> > +		pmic: tps65911 <at> 2d {
> ...
> > +			regulators {
> > +				vdd1_reg: vdd1 {
> > +					regulator-name = "vddio_ddr_1v2";
> > +					regulator-min-microvolt = <1200000>;
> > +					regulator-max-microvolt = <1200000>;
> 
> Have you validated all these voltage levels, and *-supply properties
> against the schematic or other documentation for the board? I want to
> avoid accepting a DT file that sets up any of the voltages incorrectly,
> which could potentially cause damage to the board/components.

I have not, I will ask Seco if they can supply such documents or verify the 
settings themselves, but the documentation they supply does not include any 
information in this area. I can say that my board runs fine with these 
settings...


> > +	clocks {
> > +		compatible = "simple-bus";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		clk32k_in: clock {
> > +			compatible = "fixed-clock";
> > +			reg=<0>;
> > +			#clock-cells = <0>;
> > +			clock-frequency = <32768>;
> > +		};
> > +	};
> 
> That doesn't seem to be used anywhere.
> 

The clk32k_in is used in tegra30.dtsi...

> 
> Out of curiosity, do you have upstream U-Boot support for Carma, or are
> you using our binary bootloader, or a downstream U-Boot?
> 

The u-boot that was supplied by nvidia works fine for me, so I am just using 
it. It is old, but it works and I don't have any reason to fiddle with it, 
they also provided the source, so I can tweak it if necessary, but so far I 
haven't had to touch it.

Stand by for 2 updated patches. 

Thanks,
    Chris D.
