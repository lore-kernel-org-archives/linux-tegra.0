From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator tps65911
Date: Sat, 9 Jun 2012 00:52:03 +0530
Message-ID: <4FD250DB.2090207@nvidia.com>
References: <1337691917-15040-1-git-send-email-ldewangan@nvidia.com> <1337691917-15040-2-git-send-email-ldewangan@nvidia.com> <4FBBC192.7030900@wwwdotorg.org> <4FBBC830.2060802@nvidia.com> <4FBBCA8F.3050903@wwwdotorg.org> <4FBBD33C.8020802@nvidia.com> <4FBBDA97.6000006@wwwdotorg.org> <4FBBDE06.5080806@nvidia.com> <4FC916AC.4060804@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FC916AC.4060804-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday 02 June 2012 12:53 AM, Stephen Warren wrote:
>
> We could either augment struct of_regulator_match with an integer ID
> field for each regulator (which would perhaps make it slightly painful
> to write the nodes and keep the IDs matched up), or add a new property
> to each regulator provider node e.g. regulator-id which contained the
> name that the regulator driver knows the regulator as (which would match
> struct of_regulator_match.name), since the existing regulator-name
> property is used for semantically different purposes.
>
> That would result in:
>
>> tps65911: tps65911@2d {
>> 	compatible = "ti,tps65911";
>> 	reg =<0x2d>;
>>
>> 	#gpio-cells =<2>;
>> 	gpio-controller;
>>
>> 	regulators {
>> 		#address-cells =<1>;
>> 		#size-cells =<0>;
>>
>> 		vdd1_reg: regulator@0 {
>> 			reg =<0>;
>> 			regulator-id = "vdd1"; /* Internal name */
>> 			regulator-name = "vdd_1v2_gen"; /* Signal on schematic */
> ...
>> 		};
>>
>> 		vdd2_reg: regulator@1 {
>> 			reg =<1>;
>> 			regulator-id = "vdd2";
>> 			regulator-name = "vdd_1v5_gen";
> ...


So is it fine to go on the above binding?
In this case we need to find the match_regulator based on regulator-id 
rather than by name.
