From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: Add high speed UARTs to Jetson TK1 device
 tree
Date: Tue, 26 Jan 2016 17:26:06 +0100
Message-ID: <56A79E1E.8040103@ramses-pyramidenbau.de>
References: <1453209155-6213-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <1453209155-6213-3-git-send-email-ralf@ramses-pyramidenbau.de>
 <56A01499.9060509@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56A01499.9060509-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

Now it's for sure: According to the TK1 schematics [1], uart3 is not
connected. Hence it makes no sense to enable it.
I'll prepare a next patch round.

Cheers
  Ralf

[1]
https://developer.nvidia.com/rdp/assets/jetson-tk1-datasheet-orcad-schematics
(warning, restricted access)

On 01/21/16 00:13, Stephen Warren wrote:
> On 01/19/2016 06:12 AM, Ralf Ramsauer wrote:
>> This patch enables the APB DMA high speed UARTs of the Jetson TK1.
>
>> diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
>> b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
>
>> +    /* First high speed UART */
>> +    serial@0,70006000 {
>> +        compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
>> +        status = "okay";
>> +    };
>
> It would be nice if the comment described the HW connectivity, i.e.
> which signals the UART was connected to on the board, just like the
> comments for other IO controllers already enabled in the DT file. I'd
> suggest replacing the comment above with:
>
> /* Expansion BR_UART1_RXD/_TXD */
>
>> +    /* Second high speed UART */
>> +    serial@0,70006040 {
>> +        compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
>> +        status = "okay";
>> +    };
>
> ... and that commetn with:
>
> /* Expansion UART2_RXD/_TXD/_RTS/_CTS */
>
>> +
>> +    /* Third high speed UART */
>> +    serial@0,70006200 {
>> +        compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
>> +        status = "okay";
>> +    };
>
> That UART doesn't seem to be used at all according to the schematics
> and pinmux spreadsheet. Do you have any reference to the contrary
> aside from the L4T DT file? I believe it shouldn't be enabled.
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Ralf Ramsauer
GPG: 0x8F10049B
