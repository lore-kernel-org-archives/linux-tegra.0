From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator tps65911
Date: Tue, 22 May 2012 22:39:04 +0530
Message-ID: <4FBBC830.2060802@nvidia.com>
References: <1337691917-15040-1-git-send-email-ldewangan@nvidia.com> <1337691917-15040-2-git-send-email-ldewangan@nvidia.com> <4FBBC192.7030900@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FBBC192.7030900-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 22 May 2012 10:10 PM, Stephen Warren wrote:
> On 05/22/2012 07:05 AM, Laxman Dewangan wrote:
>> Add device info for the PMIC device tps65911 in tegra-cardhu
>> dts file. This device supports the multiple regulator rails,
>> gpio, interrupts.
> FYI, patch 1 in this series looks fine. Some comments below though:
>
>> diff --git a/arch/arm/boot/dts/tegra-cardhu.dts b/arch/arm/boot/dts/tegra-cardhu.dts
>> +		tps65911: tps65911@2d {
>> +			compatible = "ti,tps65911";
>> +			reg =<0x2d>;
>> +
>> +			#gpio-cells =<2>;
>> +			gpio-controller;
>> +
>> +			regulators {
> Please add the following properties here:
>
> 	#address-cells =<1>;
> 	#size-cells =<0>;
>
>> +				vdd1_reg: vdd1 {
> This node name should be "regulator", since nodes are generally named
> after the class of object they represent. Since all the nodes will then
> have the same name, you'll need to add a unit address ("@nnnn") to the
> node name.
>

Nop, we can not do it. The node name should match with the name 
mentioned in driver otherwise the regulator node search will fail
Following is the excerpt of the code:
int of_regulator_match(struct device *dev, struct device_node *node,
                        struct of_regulator_match *matches,
                        unsigned int num_matches)
{

         for (i = 0; i < num_matches; i++) {
                 struct of_regulator_match *match = &matches[i];
                 struct device_node *child;

                 child = of_find_node_by_name(node, match->name);
                 if (!child)
                         continue;

:::::::::::
}

static struct of_regulator_match tps65911_matches[] = {
         { .name = "vrtc",       .driver_data = (void *) 
&tps65911_regs[0] },
         { .name = "vio",        .driver_data = (void *) 
&tps65911_regs[1] },
         { .name = "vdd1",       .driver_data = (void *) 
&tps65911_regs[2] },
         { .name = "vdd2",       .driver_data = (void *) 
&tps65911_regs[3] },
         { .name = "vddctrl",    .driver_data = (void *) 
&tps65911_regs[4] },
         { .name = "ldo1",       .driver_data = (void *) 
&tps65911_regs[5] },
         { .name = "ldo2",       .driver_data = (void *) 
&tps65911_regs[6] },
  :::::::::::::::::::::::::::::::::::::
         { .name = "ldo8",       .driver_data = (void *) 
&tps65911_regs[12] },
};



So only we can do it as
     reg_vdd1: vdd1 {
                 reg = <0>;
             :::::::::
     };

     reg_vdd2: vdd2 {
             reg = < 1>;
             :::::::::::
     };

> Nitpicky, but the labels might be more logical as reg_vdd1 rather than
> vdd1_reg, but not a big deal.
>
> So, please replace the line above with:
>
> 	reg_vdd1: regulator@0 {
> 		reg =<0>;
>

Why do we really require the reg at all?
I dont think any usage of doing this.
