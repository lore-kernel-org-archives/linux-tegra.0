From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator tps65911
Date: Fri, 01 Jun 2012 13:23:24 -0600
Message-ID: <4FC916AC.4060804@wwwdotorg.org>
References: <1337691917-15040-1-git-send-email-ldewangan@nvidia.com> <1337691917-15040-2-git-send-email-ldewangan@nvidia.com> <4FBBC192.7030900@wwwdotorg.org> <4FBBC830.2060802@nvidia.com> <4FBBCA8F.3050903@wwwdotorg.org> <4FBBD33C.8020802@nvidia.com> <4FBBDA97.6000006@wwwdotorg.org> <4FBBDE06.5080806@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FBBDE06.5080806-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/22/2012 12:42 PM, Laxman Dewangan wrote:
> On Tuesday 22 May 2012 11:57 PM, Stephen Warren wrote:
>> On 05/22/2012 11:56 AM, Laxman Dewangan wrote:
>>> On Tuesday 22 May 2012 10:49 PM, Stephen Warren wrote:
>>>> On 05/22/2012 11:09 AM, Laxman Dewangan wrote:
>>>>> On Tuesday 22 May 2012 10:10 PM, Stephen Warren wrote:
>>>>>> On 05/22/2012 07:05 AM, Laxman Dewangan wrote:
>>>>>>> Add device info for the PMIC device tps65911 in tegra-cardhu
>>>>>>> dts file. This device supports the multiple regulator rails,
>>>>>>> gpio, interrupts.
>> ...
>>>>>> Nitpicky, but the labels might be more logical as reg_vdd1 rather
>>>>>> than
>>>>>> vdd1_reg, but not a big deal.
>>>>>>
>>>>>> So, please replace the line above with:
>>>>>>
>>>>>>       reg_vdd1: regulator@0 {
>>>>>>           reg =<0>;
>>>>> Why do we really require the reg at all?
>>>>> I dont think any usage of doing this.
>> Oh, perhaps you meant the reg property not "reg_" in the label name?
>>
>> It is required because the parent node has #address-cells and
>> #size-cells and because the node name itself has a unit address ("@nnn").
>>
> 
> But we can not put
>     reg_vdd1:regulator@0 {
>         ::::::::::::::
>     }
> 
> 
> due to their dt binding with their node names.

I spoke to Olof about this on IRC, and he also tended to agree that the
regulator node names should not be used directly.

However, Mark warned that changing this would be a bit painful because
there are already users of the existing scheme. It looks like that's
only tps65910 (which we haven't started using yet), db8500, and ab8500,
so probably not that big a deal.

We could probably amend of_regulator_match() to work in a
backwards-compatible fashion; to look for some name property in each
child node first, and then fall back to using the node name if that
resulted in no matches. That would allow db8500/ab8500 to be converted
at leisure.

We could either augment struct of_regulator_match with an integer ID
field for each regulator (which would perhaps make it slightly painful
to write the nodes and keep the IDs matched up), or add a new property
to each regulator provider node e.g. regulator-id which contained the
name that the regulator driver knows the regulator as (which would match
struct of_regulator_match.name), since the existing regulator-name
property is used for semantically different purposes.

That would result in:

> tps65911: tps65911@2d {
> 	compatible = "ti,tps65911";
> 	reg = <0x2d>;
> 
> 	#gpio-cells = <2>;
> 	gpio-controller;
> 
> 	regulators {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		vdd1_reg: regulator@0 {
> 			reg = <0>;
> 			regulator-id = "vdd1"; /* Internal name */
> 			regulator-name = "vdd_1v2_gen"; /* Signal on schematic */
...
> 		};
> 
> 		vdd2_reg: regulator@1 {
> 			reg = <1>;
> 			regulator-id = "vdd2";
> 			regulator-name = "vdd_1v5_gen";
...
