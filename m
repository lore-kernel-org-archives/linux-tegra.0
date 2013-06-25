From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: Add basic support for carma devkit
Date: Tue, 25 Jun 2013 10:06:50 -0600
Message-ID: <51C9C01A.70506@wwwdotorg.org>
References: <1371994685-4997-1-git-send-email-chris.desjardins@amscins.com> <51C87FA5.3000306@wwwdotorg.org> <loom.20130625T165829-570@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <loom.20130625T165829-570-eS7Uydv5nfjZ+VzJOa5vwg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/25/2013 09:47 AM, Chris Desjardins wrote:
> Stephen Warren <swarren@...> writes:
> 
>>
>> On 06/23/2013 07:38 AM, Chris Desjardins wrote:
>>
> 
>>
>>> +	serial <at> 70006200 {
>>> +		compatible = "ns16550";
>>
>> You shouldn't need to set the compatible value for this node;
>> tegra30.dtsi has already set it.
> 
> True, but it is set to "nvidia,tegra30-uart", "nvidia,tegra20-uart" which 
> causes the nvidia high speed uart driver to be loaded, which sucks when you 

That compatible value ends up selecting the regular serial driver. Any
board that wants the HSUART driver needs to override the compatible
value to "nvidia,tegra30-hsuart", "nvidia,tegra20-hsuart" instead (which
IIRC none do at present).

So, to be consistent with all other Tegra boards, I still believe this
compatible value should be removed.

(And as an aside, selecting "ns16550" here is going to make the UART
driver not know that it's dealing with a Tegra port, and hence not apply
the Tegra-specific WARs/quirks it needs to, which will likely make the
port unreliable in some circumstances.)

>>> +		tps62361 {
>> ...
>>> +			regulator-min-microvolt = <500000>;
>>> +			regulator-max-microvolt = <1500000>;
>> ...
>>> +		pmic: tps65911 <at> 2d {
>> ...
>>> +			regulators {
>>> +				vdd1_reg: vdd1 {
>>> +					regulator-name = "vddio_ddr_1v2";
>>> +					regulator-min-microvolt = <1200000>;
>>> +					regulator-max-microvolt = <1200000>;
>>
>> Have you validated all these voltage levels, and *-supply properties
>> against the schematic or other documentation for the board? I want to
>> avoid accepting a DT file that sets up any of the voltages incorrectly,
>> which could potentially cause damage to the board/components.
> 
> I have not, I will ask Seco if they can supply such documents or verify the 
> settings themselves, but the documentation they supply does not include any 
> information in this area. I can say that my board runs fine with these 
> settings...

That may appear to happen even if the settings aren't all correct.
Perhaps you can validate the values against whatever downstream kernel
Seco supplies; matching that would be enough.

>>> +	clocks {
>>> +		compatible = "simple-bus";
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +
>>> +		clk32k_in: clock {
>>> +			compatible = "fixed-clock";
>>> +			reg=<0>;
>>> +			#clock-cells = <0>;
>>> +			clock-frequency = <32768>;
>>> +		};
>>> +	};
>>
>> That doesn't seem to be used anywhere.
> 
> The clk32k_in is used in tegra30.dtsi...

Yes, indeed.
