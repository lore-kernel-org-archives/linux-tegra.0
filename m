From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator tps65911
Date: Wed, 23 May 2012 00:12:14 +0530
Message-ID: <4FBBDE06.5080806@nvidia.com>
References: <1337691917-15040-1-git-send-email-ldewangan@nvidia.com> <1337691917-15040-2-git-send-email-ldewangan@nvidia.com> <4FBBC192.7030900@wwwdotorg.org> <4FBBC830.2060802@nvidia.com> <4FBBCA8F.3050903@wwwdotorg.org> <4FBBD33C.8020802@nvidia.com> <4FBBDA97.6000006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FBBDA97.6000006-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 22 May 2012 11:57 PM, Stephen Warren wrote:
> On 05/22/2012 11:56 AM, Laxman Dewangan wrote:
>> On Tuesday 22 May 2012 10:49 PM, Stephen Warren wrote:
>>> On 05/22/2012 11:09 AM, Laxman Dewangan wrote:
>>>> On Tuesday 22 May 2012 10:10 PM, Stephen Warren wrote:
>>>>> On 05/22/2012 07:05 AM, Laxman Dewangan wrote:
>>>>>> Add device info for the PMIC device tps65911 in tegra-cardhu
>>>>>> dts file. This device supports the multiple regulator rails,
>>>>>> gpio, interrupts.
> ...
>>>>> Nitpicky, but the labels might be more logical as reg_vdd1 rather than
>>>>> vdd1_reg, but not a big deal.
>>>>>
>>>>> So, please replace the line above with:
>>>>>
>>>>>       reg_vdd1: regulator@0 {
>>>>>           reg =<0>;
>>>> Why do we really require the reg at all?
>>>> I dont think any usage of doing this.
> Oh, perhaps you meant the reg property not "reg_" in the label name?
>
> It is required because the parent node has #address-cells and
> #size-cells and because the node name itself has a unit address ("@nnn").
>

But we can not put
     reg_vdd1:regulator@0 {
         ::::::::::::::
     }


due to their dt binding with their node names.
In this case still do we need  reg=<0> and #address-cells and #size-cells?
