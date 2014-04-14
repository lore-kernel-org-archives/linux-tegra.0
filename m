From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Oops on Tegra30 with CPU Process: 1
Date: Mon, 14 Apr 2014 14:18:06 -0600
Message-ID: <534C427E.5030404@wwwdotorg.org>
References: <53440884.7010304@ziswiler.com> <534C3422.1050004@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <534C3422.1050004-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/14/2014 01:16 PM, Stephen Warren wrote:
> On 04/08/2014 08:32 AM, Marcel Ziswiler wrote:
>> Hi there
>>
>> I have the following Toradex Colibri T30 modules with different ATE prog
>> versions, Tegra30 SKUs as well as CPU process numbers:
>>
>> Colibri T30 V1.1B (working)
>>
>> [    0.000000] fuse_speedo_calib: ATE prog ver 3.6
>> [    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
>> [    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 2 Core Process: 0
>>
>> Colibri T30 V1.1C (below crash)
>>
>> [    0.000000] fuse_speedo_calib: ATE prog ver 3.7
>> [    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
>> [    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 1 Core Process: 0
> 
> I /think/ that if you run the following command in U-Boot before booting
> the kernel:
> 
> i2c mw 0x60 3 0x46
> 
> ... that may solve the problem (assuming the kernel doesn't explicitly
> reprogram the regulator for VDD CORE during boot).
> 
> (you might need to adjust "3" to match whatever I2C bus the TPS62631 is
> attached to; "i2c dev N; i2c probe" for various N might help find it).
> 
> That command changes the TPS62361's regulator output from 1.16V (HW
> default I believe) to 1.2V, which I believe is the necessary minimum
> voltage for a 1.0V VDD_CPU, which is what at least mainline U-Boot sets up.

Uggh. I just realized that 1.0V on VDD_CPU (which is what mainline
U-Boot and the kernel set up) is enough to run the CPU at 1.0GHz. I
thought U-Boot programmed the CPU clock to that rate, but according to
U-Boot's arch/arm/cpu/arm720t/tegra-common/cpu.c tegra_pll_x_table[], it
actually runs the CPUs at 1.4GHz. In order to solve that problem, you'll
want to try either:

1) Running the CPUs at 1.0GHz instead of 1.4GHz, by modifying
arch/arm/cpu/arm720t/tegra-common/cpu.c tegra_pll_x_table[]'s PLL values.

It's probably safest to try this first, since this approach requires
adjusting the fewest voltage regulators. That said, I just made up
(calculated) the following values without testing most of them (the
entry for a 12MHz works for me), so who knows if the VCO values are in
range or the cpcon values are optimal...

/*
 * T30: 1.4 GHz
 *
 * Register   Field  Bits   Width
 * ------------------------------
 * PLLX_BASE  p      22:20    3
 * PLLX_BASE  n      17: 8   10
 * PLLX_BASE  m       4: 0    5
 * PLLX_MISC  cpcon  11: 8    4
 */
{
        { .n = 666, .m =  8, .p = 0, .cpcon = 8 }, /* OSC: 13.0 MHz */
        { .n = 416, .m =  8, .p = 0, .cpcon = 4 }, /* OSC: 19.2 MHz */
        { .n = 500, .m =  6, .p = 0, .cpcon = 8 }, /* OSC: 12.0 MHz */
        { .n = 500, .m = 13, .p = 0, .cpcon = 8 }, /* OSC: 26.0 MHz */
},

or:

2) Adjusting the code that programs VDD_CPU, both in:

2a) U-Boot's TPS65911_VDDCTRL_OP_DATA value in
arch/arm/cpu/arm720t/tegra30/cpu.c.

That value should be:

# CPU Process 2:
(0x2a00 | TPS65911_VDDCTRL_OP_REG)

# CPU Process 1:
(0x2c00 | TPS65911_VDDCTRL_OP_REG)

2b) The kernel's regulator configuration in DT; whatever the Colibri
equivalent of the following from arch/arm/boot/dts/tegra30-cardhu.dtsi:

vddctrl_reg: vddctrl {
	regulator-name = "vdd_cpu,vdd_sys";
	regulator-min-microvolt = <1000000>;
	regulator-max-microvolt = <1000000>;
	regulator-always-on;
};

Both regulator-min/max-microvolt should be 1.125V (1125000) for CPU
process 2, and 1.15V (1150000) for CPU process 1.
