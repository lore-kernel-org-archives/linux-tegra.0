From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator tps65911
Date: Tue, 22 May 2012 11:19:11 -0600
Message-ID: <4FBBCA8F.3050903@wwwdotorg.org>
References: <1337691917-15040-1-git-send-email-ldewangan@nvidia.com> <1337691917-15040-2-git-send-email-ldewangan@nvidia.com> <4FBBC192.7030900@wwwdotorg.org> <4FBBC830.2060802@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FBBC830.2060802-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/22/2012 11:09 AM, Laxman Dewangan wrote:
> On Tuesday 22 May 2012 10:10 PM, Stephen Warren wrote:
>> On 05/22/2012 07:05 AM, Laxman Dewangan wrote:
>>> Add device info for the PMIC device tps65911 in tegra-cardhu
>>> dts file. This device supports the multiple regulator rails,
>>> gpio, interrupts.
>> FYI, patch 1 in this series looks fine. Some comments below though:
>>
>>> diff --git a/arch/arm/boot/dts/tegra-cardhu.dts
>>> b/arch/arm/boot/dts/tegra-cardhu.dts
>>> +        tps65911: tps65911@2d {
>>> +            compatible = "ti,tps65911";
>>> +            reg =<0x2d>;
>>> +
>>> +            #gpio-cells =<2>;
>>> +            gpio-controller;
>>> +
>>> +            regulators {
>>
>> Please add the following properties here:
>>
>>     #address-cells =<1>;
>>     #size-cells =<0>;
>>
>>> +                vdd1_reg: vdd1 {
>>
>> This node name should be "regulator", since nodes are generally named
>> after the class of object they represent. Since all the nodes will then
>> have the same name, you'll need to add a unit address ("@nnnn") to the
>> node name.
> 
> Nop, we can not do it. The node name should match with the name
> mentioned in driver otherwise the regulator node search will fail
> Following is the excerpt of the code:

Hmm. That seems wrong. I thought I had seen at least some regulator
bindings where these nodes included a name property so that the nodes
didn't need any particular name.

Olof, what are your thoughts here - do we need to fix the code so the
node names aren't relevant? IIRC, we have had to change some other
bindings due to the same issue.

...
>> Nitpicky, but the labels might be more logical as reg_vdd1 rather than
>> vdd1_reg, but not a big deal.
>>
>> So, please replace the line above with:
>>
>>     reg_vdd1: regulator@0 {
>>         reg =<0>;
>>
> 
> Why do we really require the reg at all?
> I dont think any usage of doing this.

I guess if these regulators are enabled at boot and always on, we don't
even need the labels for now; we could add labels later as/when drivers
begin to dynamically control the regulators.
