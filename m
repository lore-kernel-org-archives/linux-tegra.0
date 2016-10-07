From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: Jetson TK1: Additional SPI chip selects
Date: Sat, 8 Oct 2016 01:33:15 +0200
Message-ID: <ee70aa88-05c2-dbdf-37bc-5f033427239b@ramses-pyramidenbau.de>
References: <c35c4309-9432-a9a9-0677-3c2b18202e4f@ramses-pyramidenbau.de>
 <9625cc1a-c723-516d-9eb6-b7ec383e323c@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9625cc1a-c723-516d-9eb6-b7ec383e323c-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tobias Kottwitz <tobias.kottwitz-3hJwHgKweOl99bV2EpccEXqWYbMAw+HU@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On 10/07/2016 08:33 PM, Stephen Warren wrote:
> On 10/07/2016 07:25 AM, Ralf Ramsauer wrote:
>> Hi,
>>
>> I'm running a Jetson TK1 on mainline Linux. To enable userspace SPI, I
>> modified the device-tree by:
>>
>>  /* Expansion TS_SPI_* */
>>  spi@7000d400 {
>>      status = "okay";
>> +     spidev@0 {
>> +        compatible = "spidev";
>> +        reg = <0>;
>> +        spi-max-frequency = <25000000>;
>> +    };
>>  };
>>
>> This works fine. Is it possible to use arbitrary GPIOs as additional
>> chip-selects?
>>
>> What would I have to do If I'd like to add PU0 or PU1 (sysfs
>> gpio160/161) as chip-selects?
> 
> According to Documentation/devicetree/bindings/spi/spi-bus.txt, there
> are standard properties you can use for GPIO chip-select signals, and it
> looks like the SPI core code handles this itself. However, judging by a
Yes, I already followed those instructions and it didn't work. Other CSs
seem to be ignored, without any warnings while the native CS line still
keeps working. That's why I came up with this post. Adding a line to the
DT like

cs-gpios = <0>, <&gpio TEGRA_GPIO(X, Y) GPIO_ACTIVE_LOW>;

should actually (at least syntactically and semantically) be fine for an
additional CS, right?
> quick look at the Tegra SPI driver, it doesn't fully support that since
> it always attempts to program the HW chip-selects. If you make the HW CS
> logic in the driver conditional, and add the DT properties mentioned in
> spi-bus.txt, it should work.
Oh no, doesn't sound good. Actually I didn't want to touch driver
code... Well, I'll have a look into other drivers that already support
it and compare it to the tegra driver.

  Ralf
