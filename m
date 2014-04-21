From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Oops on Tegra30 with CPU Process: 1
Date: Mon, 21 Apr 2014 11:13:33 -0600
Message-ID: <535551BD.5000207@wwwdotorg.org>
References: <53440884.7010304@ziswiler.com> <534C3422.1050004@wwwdotorg.org> <534C427E.5030404@wwwdotorg.org> <53545792.30709@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53545792.30709-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/20/2014 05:26 PM, Marcel Ziswiler wrote:
> On 04/14/2014 10:18 PM, Stephen Warren wrote:
>> On 04/14/2014 01:16 PM, Stephen Warren wrote:
>>> On 04/08/2014 08:32 AM, Marcel Ziswiler wrote:
>>>> Hi there
>>>>
>>>> I have the following Toradex Colibri T30 modules with different ATE prog
>>>> versions, Tegra30 SKUs as well as CPU process numbers:
>>>>
>>>> Colibri T30 V1.1B (working)
>>>>
>>>> [    0.000000] fuse_speedo_calib: ATE prog ver 3.6
>>>> [    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
>>>> [    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 2 Core
>>>> Process: 0
>>>>
>>>> Colibri T30 V1.1C (below crash)
>>>>
>>>> [    0.000000] fuse_speedo_calib: ATE prog ver 3.7
>>>> [    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
>>>> [    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 1 Core
>>>> Process: 0
...
>> Uggh. I just realized that 1.0V on VDD_CPU (which is what mainline
>> U-Boot and the kernel set up) is enough to run the CPU at 1.0GHz. I
>> thought U-Boot programmed the CPU clock to that rate, but according to
>> U-Boot's arch/arm/cpu/arm720t/tegra-common/cpu.c tegra_pll_x_table[], it
>> actually runs the CPUs at 1.4GHz. In order to solve that problem, you'll
>> want to try either:
...
>> 2) Adjusting the code that programs VDD_CPU, both in:
>>
>> 2a) U-Boot's TPS65911_VDDCTRL_OP_DATA value in
>> arch/arm/cpu/arm720t/tegra30/cpu.c.
>>
>> That value should be:
>>
>> # CPU Process 2:
>> (0x2a00 | TPS65911_VDDCTRL_OP_REG)
>>
>> # CPU Process 1:
>> (0x2c00 | TPS65911_VDDCTRL_OP_REG)
>>
>> 2b) The kernel's regulator configuration in DT; whatever the Colibri
>> equivalent of the following from arch/arm/boot/dts/tegra30-cardhu.dtsi:
>>
>> vddctrl_reg: vddctrl {
>>     regulator-name = "vdd_cpu,vdd_sys";
>>     regulator-min-microvolt = <1000000>;
>>     regulator-max-microvolt = <1000000>;
>>     regulator-always-on;
>> };
>>
>> Both regulator-min/max-microvolt should be 1.125V (1125000) for CPU
>> process 2, and 1.15V (1150000) for CPU process 1.
> 
> At least approach 2b) indeed makes em fly again. Rock solid without any
> more crashes (;-p).

Great. Thanks for the confirmation.

It might be slightly better to apply the fix to U-Boot in addition to
the kernel DT, since that way the correct voltage will be applied for
the entire run-time of the main CPUs, rather than only starting at some
point during the kernel boot.

Evidently from your practical test results, the correct voltage only
appears to matter once user-space boots up and the CPU load gets higher
(and likely when multiple CPUs are doing real work). However, it seems
at least theoretically possible that even U-Boot might trigger the
problem, and hence should probably set up the regulators correctly.
