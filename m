From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: Add high speed UARTs to Jetson TK1 device
 tree
Date: Thu, 21 Jan 2016 01:10:20 +0100
Message-ID: <56A021EC.7010409@ramses-pyramidenbau.de>
References: <1453209155-6213-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <1453209155-6213-3-git-send-email-ralf@ramses-pyramidenbau.de>
 <56A01499.9060509@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56A01499.9060509-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

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
I'll be more verbose with commenting in the next round
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
Ack
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
Just checked it, and yes, you're absolutely right. I used the L4T device
tree as reference. Can't tell you why, but it appears that they
activated all uarts.
This is a short excerpt of Nvidias official DT:

            serial@70006000 {
                    compatible = "nvidia,tegra114-hsuart";
                    status = "okay";
            };

            serial@70006040 {
                    compatible = "nvidia,tegra114-hsuart";
                    status = "okay";
            };

            serial@70006200 {
                    compatible = "nvidia,tegra114-hsuart";
                    status = "okay";
            };

        serial@70006300 {
            compatible = "nvidia,tegra20-uart", "nvidia,tegra114-hsuart";
            console-port;
            sqa-automation-port;
            status = "okay";
        };


This is a short excerpt of /proc/iomem of a Jetson TK1 running latest
stock L4T linux:

    70006000-7000603f : /serial@70006000
    70006040-7000607f : /serial@70006040
    70006200-7000623f : /serial@70006200
    70006300-7000631f : serial

Let me doublecheck that again - in fact only two of three high speed
UARTs are actually exposed to the expansion header. (besides the strange
fact, that nvidia seems to have all uarts enabled...)

According to [1]:
uart1 - expansion connector
uart2 - expansion connector
uart3 - ???
uart4 - DB9 RS232 connector

I'll check this in a few days again. Thanks for review, Stephen!

Ralf

[1]
http://developer.download.nvidia.com/embedded/jetson/TK1/2014-03-24/JetsonTK1_ModuleSpecification_PM375_V1.0.pdf

-- 
Ralf Ramsauer
GPG: 0x8F10049B
