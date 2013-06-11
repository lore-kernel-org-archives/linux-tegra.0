From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: tegra: T114: add DFLL DVCO reset control
Date: Tue, 11 Jun 2013 13:01:05 +0530
Message-ID: <51B6D239.5030905@nvidia.com>
References: <20130607121505.21868.72360.stgit@dusk.lan> <20130607121901.21868.65416.stgit@dusk.lan> <51B21105.1080301@wwwdotorg.org> <alpine.DEB.2.02.1306071703050.7753@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1306071703050.7753-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 07 June 2013 10:36 PM, Paul Walmsley wrote:
> Hi Stephen,
>
> On Fri, 7 Jun 2013, Stephen Warren wrote:
>
>> On 06/07/2013 06:19 AM, Paul Walmsley wrote:
>>> Add DFLL DVCO reset line control functions to the CAR IP block driv=
er.
>>>
>>> The DVCO present in the DFLL IP block has a separate reset line,
>>> exposed via the CAR IP block.  This reset line is asserted upon SoC
>>> reset.  Unless something (such as the DFLL driver) deasserts this
>>> line, the DVCO will not oscillate, although reads and writes to the
>>> DFLL IP block will complete.
>>>
>>> Thanks to Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> for identifying this an=
d
>>> saving hours of debugging time.
>>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>>>   void tegra114_clock_tune_cpu_trimmers_high(void);
>>>   void tegra114_clock_tune_cpu_trimmers_low(void);
>>>   void tegra114_clock_tune_cpu_trimmers_init(void);
>>> +void tegra114_clock_assert_dfll_dvco_reset(void);
>>> +void tegra114_clock_deassert_dfll_dvco_reset(void);
>> Where/what is the code that will call these new APIs? If it's going =
to
>> be something in drivers/clk, that seems fine.
> That's correct - they'll be used by the DFLL clocksource code, which =
will
> live in drivers/clk/tegra.  You've seen the patches already ;-)

Why not implement these APIs in DFLL clock driver itself and pass RST=20
address register to driver?

>> The reset assert/de-assert functions at least might be worth exposin=
g
>> using the new generic module reset API. I believe Prashant Gaikwad i=
s
>> working on converting the Tegra clock driver to be a module reset
>> provider, hence removing the existing custom
>> tegra_periph_reset_{de,}assert() APIs.
> OK, will take a look to see if this can be done without getting in th=
e way
> of Prashant's work.  I'd na=EFvely assume that it might be best to co=
nvert
> these as part of his series - that way we won't duplicate effort.
>
> Prashant, what stage are you at in the conversion?  If you're close t=
o
> completion, maybe we can just add this functionality in with your pat=
ches?
>

You can continue with this patch. I do not see any need to add this=20
reset control to generic reset module.

> - Paul
