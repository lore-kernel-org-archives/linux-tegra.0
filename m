From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 2/2] ARM: tegra: initial add of Colibri T30
Date: Wed, 14 May 2014 18:16:16 +0200
Message-ID: <107aeb48982529858267cb85c792b35e@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: thierry.reding@gmail.com, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, marcel@ziswiler.com
List-Id: linux-tegra@vger.kernel.org

Am 2014-05-13 21:49, schrieb Stephen Warren:
> On 05/13/2014 11:27 AM, stefan@agner.ch wrote:
>> +	/* SPI1: Colibri SSP */
>> +	spi@7000d400 {
>> +		status = "okay";
>> +		spi-max-frequency = <25000000>;
>> +		can0: can@0 {
>> +			compatible = "microchip,mcp2515";
>> +			reg = <0>;
>> +			clocks = <&clk16m>;
>> +			interrupt-parent = <&gpio>;
>> +			interrupts = <TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
>> +			spi-max-frequency = <10000000>;
> 
> So this chip doesn't get confused by a faster clock frequency when its
> chip-select line isn't asserted? I would have expected spi-max-frequency
> for the bus to be the minimum value that any device on the bus would
> tolerate.

And from the other mail:
> I'm not convinced about this. The clock signal still reaches all the
> chips, and hence still reaches some logic inside those chips. If the
> setup/hold timings aren't met (for internal parts of the chip's SPI
> state machine), then presumably all bets are off re: performance of the
> chip, irrespective of whether the CS line happens to gate how much of
> the chip actually does anything.

SPI is by default not a multi-master Bus, hence the slaves only have to
listen when the CS is asserted. I talked with our hardware expert, and
he told me that he would expect that the whole input stage (input
driver) is in reset/off logic when the CS line is not asserted. IMHO,
this makes sense, this would also save power. At least he would expect
that the communication state machine is resetted on CS assertion, so
that it doesn't matter what happend before. 

Wikipedia also states something similar. 

But, since SPI is no real standard, devices which work differently and
claim to communicate through SPI could exist :-)

I have had not seen issues with this device when using faster clocks for
other devices on the same bus.

>> +	panel: panel {
>> +		compatible = "edt,et057090dhu", "simple-panel";
> 
> The panel-simple driver doesn't seem to know about that EDT panel. How
> will it work out the display timings?

I will send a patch adding our two default panels.

Will send a second revision soon.
