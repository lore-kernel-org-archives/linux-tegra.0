From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Wed, 13 Nov 2013 18:12:55 +0800
Message-ID: <528350A7.4060208@nvidia.com>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com>
 <20131031162029.GF2493@sirena.org.uk> <527737C5.5080901@nvidia.com>
 <20131104161828.GK2493@sirena.org.uk> <5278B4CB.9050305@nvidia.com>
 <20131106085100.GB11602@sirena.org.uk> <527A1C47.6050405@nvidia.com>
 <20131106110154.GG11602@sirena.org.uk> <5281C228.3000404@nvidia.com>
 <5282717C.3050502@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5282717C.3050502-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/13/2013 02:20 AM, Stephen Warren wrote:
> On 11/11/2013 10:52 PM, Wei Ni wrote:
>> On 11/06/2013 07:01 PM, Mark Brown wrote:
>>> * PGP Signed by an unknown key
>>>
>>> On Wed, Nov 06, 2013 at 06:39:03PM +0800, Wei Ni wrote:
>>>
>>>> I still can't find a good place to set full_constraints, could you
>>>> please show me some reference codes where we can set it?
>>>
>>> The places where we unflatten the device tree for example, or start
>>> instantiating devices from DT.
>>
>> Hi, Mark
>> Sorry, I really don't familiar with the DT, could you please take this
>> by youself?
> 
> I think if you want a feature implemented or a patch created, it's up to
> you to do so.
> 
> Isn't this as simple as moving the following code:

Yes, I had sent patch:
[PATCH v2] regulator: core: set full constraints in regulator_init
http://www.mail-archive.com/linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg13788.html .
It's same as you said, but Mark think it should be set in DT.
If we set it in DT, it will affect all DT system, and I still didn't
find a good place to set it.

So I think it's better to let Mark to handle it.

Thanks.
Wei.

> 
>> 	/*
>> 	 * Since DT doesn't provide an idiomatic mechanism for
>> 	 * enabling full constraints and since it's much more natural
>> 	 * with DT to provide them just assume that a DT enabled
>> 	 * system has full constraints.
>> 	 */
>> 	if (of_have_populated_dt())
>> 		has_full_constraints = true;
> 
> ... out of regulator_init_complete() and into regulator_init()?
> 
> The only issue you may have to watch out for is: When is
> regulator_init() called (i.e. when does core_initcall happen) relative
> to when driver probe()s can be called? If it's earlier, then
> core_initcall is early enough I suspect.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
