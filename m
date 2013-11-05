From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Tue, 5 Nov 2013 17:05:15 +0800
Message-ID: <5278B4CB.9050305@nvidia.com>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com>
 <20131031162029.GF2493@sirena.org.uk> <527737C5.5080901@nvidia.com>
 <20131104161828.GK2493@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131104161828.GK2493-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/05/2013 12:18 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Mon, Nov 04, 2013 at 01:59:33PM +0800, Wei Ni wrote:
> 
>> I didn't find the generic DT init code, do you mean to add it in the
>> customize_machine() in arch/arm/kernel/setup.c ? But it isn't only for
>> DT systems.
> 
> We can do it as part of parsing the DT or deciding to parse the DT.

I checked the kernel codes, it seems the different arch uses different
way to parse DT, and I think these codes are related with DT, it's not
better to add such regulator full constraints codes.

> 
>> How about to add it in the regulator subsystem? I mean we can add
>> following codes in the regulator_init() routine in driver/regulator/core.c:
>> +#ifdef CONFIG_OF
>> +regulator_has_full_constraints();
>> +#endif
> 
> No, that's not good - we can have DT enabled but boot on a non-DT board.

I found in regulator_init_complete(void), there has following codes:
"
/*
 * Since DT doesn't provide an idiomatic mechanism for
 * enabling full constraints and since it's much more natural
 * with DT to provide them just assume that a DT enabled
 * system has full constraints.
 */
if (of_have_populated_dt())
                has_full_constraints = true;
"
According to the comment, this is what we want. Since this routine is
called by late_initcall, it's later than some device probing, so it will
cause the device can't get the dummy regulator.
I think we can move them to the regulator_init() routine, then we can
fix this issue.

Thanks.
Wei.

> 
> * Unknown Key
> * 0x7EA229BD
> 
