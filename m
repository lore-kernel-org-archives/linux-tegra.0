From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] soc: Add support for Parked bits for
 Tegra210
Date: Thu, 7 Apr 2016 16:51:08 -0400
Message-ID: <5706C83C.1090300@nvidia.com>
References: <1460060143-25086-1-git-send-email-rklein@nvidia.com>
 <5706C475.7010102@wwwdotorg.org> <5706C634.80605@nvidia.com>
 <5706C7D3.9030407@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5706C7D3.9030407-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 4/7/2016 4:49 PM, Stephen Warren wrote:
> On 04/07/2016 02:42 PM, Rhyland Klein wrote:
>> On 4/7/2016 4:35 PM, Stephen Warren wrote:
>>> On 04/07/2016 02:15 PM, Rhyland Klein wrote:
>>>> Tegra210 has a parked bit for each pin. Add code to express
>>>> this by updating the kernel driver MACROs to add in parked_*
>>>> fields so that the kernel can handle them as it sees fit.
>>>
>>> I'd expect that wrapped around 74 characters. Our internal git
>>> auto-review thing's 50-character limit is a bit odd (I think it's only
>>> meant to apply to the synopsis not the full description but is either
>>> buggy or just doesn't make that clear).
>>
>> I'll fix the wrapping.
>>
>>>
>>>> diff --git a/configs/tegra114.soc b/configs/tegra114.soc
>>>
>>>> +soc_pins_have_parked = False
>>>>    soc_drv_reg_base = 0x868
>>>>    soc_einput_b = 5
>>>>    soc_odrain_b = 6
>>>> +soc_parked_bank = 0
>>>> +soc_parked_bit = 0
>>>
>>> For SoCs with soc_pins_have_parked == False, can we simply omit the
>>> bank/bit values from the config file?
>>
>> I tried that originally, but I don't think I can. The reason is that
>> tegra_pmx_soc_parser uses a predefined array of attributes (copy_attrs)
>> and if the entry isn't in that, then it won't be populated and can't be
>> accessed later to fill in the values for say T210. If the entry IS in
>> the copy_attrs, then the script will fail if there isn't an entry in the
>> config file. Its unfortunate, and maybe someone more familiar with the
>> scripts might know of a way to get around this, something I haven't
>> found yet.
> 
> Oh yes, you're right; the parsing is all in one pass so we can't check 
> for the "have" attribute first and then conditionally act upon it to 
> copy the _b attributes.
> 
> But now you made me look at the code, I noticed that I think the new 
> Boolean value should be named soc_pins_all_have_parked, and the new 
> entry in copy_attrs should be sorted next to the existing 
> soc_pins_all_have_* entries:-) (That's because the _b value applies to 
> all pins, and is defined once at the SoC level, rather than potentially 
> having a different value per pin).

Sure I can rename that. Makes sense.

-rhyland



-- 
nvpublic
