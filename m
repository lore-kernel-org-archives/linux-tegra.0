From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: Add high speed UARTs to Jetson TK1 device
 tree
Date: Wed, 20 Jan 2016 16:13:29 -0700
Message-ID: <56A01499.9060509@wwwdotorg.org>
References: <1453209155-6213-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <1453209155-6213-3-git-send-email-ralf@ramses-pyramidenbau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453209155-6213-3-git-send-email-ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/19/2016 06:12 AM, Ralf Ramsauer wrote:
> This patch enables the APB DMA high speed UARTs of the Jetson TK1.

> diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts

> +	/* First high speed UART */
> +	serial@0,70006000 {
> +		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
> +		status = "okay";
> +	};

It would be nice if the comment described the HW connectivity, i.e. 
which signals the UART was connected to on the board, just like the 
comments for other IO controllers already enabled in the DT file. I'd 
suggest replacing the comment above with:

/* Expansion BR_UART1_RXD/_TXD */

> +	/* Second high speed UART */
> +	serial@0,70006040 {
> +		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
> +		status = "okay";
> +	};

... and that commetn with:

/* Expansion UART2_RXD/_TXD/_RTS/_CTS */

> +
> +	/* Third high speed UART */
> +	serial@0,70006200 {
> +		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
> +		status = "okay";
> +	};

That UART doesn't seem to be used at all according to the schematics and 
pinmux spreadsheet. Do you have any reference to the contrary aside from 
the L4T DT file? I believe it shouldn't be enabled.
