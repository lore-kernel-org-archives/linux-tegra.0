From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Jetson TK1: Additional SPI chip selects
Date: Fri, 7 Oct 2016 12:33:38 -0600
Message-ID: <9625cc1a-c723-516d-9eb6-b7ec383e323c@wwwdotorg.org>
References: <c35c4309-9432-a9a9-0677-3c2b18202e4f@ramses-pyramidenbau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c35c4309-9432-a9a9-0677-3c2b18202e4f-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tobias Kottwitz <tobias.kottwitz-3hJwHgKweOl99bV2EpccEXqWYbMAw+HU@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/07/2016 07:25 AM, Ralf Ramsauer wrote:
> Hi,
>
> I'm running a Jetson TK1 on mainline Linux. To enable userspace SPI, I
> modified the device-tree by:
>
>  /* Expansion TS_SPI_* */
>  spi@7000d400 {
>  	status = "okay";
> + 	spidev@0 {
> +		compatible = "spidev";
> +		reg = <0>;
> +		spi-max-frequency = <25000000>;
> +	};
>  };
>
> This works fine. Is it possible to use arbitrary GPIOs as additional
> chip-selects?
>
> What would I have to do If I'd like to add PU0 or PU1 (sysfs
> gpio160/161) as chip-selects?

According to Documentation/devicetree/bindings/spi/spi-bus.txt, there 
are standard properties you can use for GPIO chip-select signals, and it 
looks like the SPI core code handles this itself. However, judging by a 
quick look at the Tegra SPI driver, it doesn't fully support that since 
it always attempts to program the HW chip-selects. If you make the HW CS 
logic in the driver conditional, and add the DT properties mentioned in 
spi-bus.txt, it should work.
