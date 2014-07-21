From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/6] clk: tegra: make tegra_clocks_apply_init_table arch_initcall
Date: Mon, 21 Jul 2014 15:43:08 -0600
Message-ID: <53CD896C.3030605@wwwdotorg.org>
References: <1405437890-6468-1-git-send-email-pdeschrijver@nvidia.com> <1405437890-6468-3-git-send-email-pdeschrijver@nvidia.com> <20140716071932.GB7978@ulmo> <20140716082740.GK23218@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140716082740.GK23218-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/16/2014 02:27 AM, Peter De Schrijver wrote:
> On Wed, Jul 16, 2014 at 09:19:33AM +0200, Thierry Reding wrote:
>> * PGP Signed by an unknown key
>>
>> On Tue, Jul 15, 2014 at 06:24:32PM +0300, Peter De Schrijver wrote:
>> [...]
>>> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
>>> index d081732..65cde4e 100644
>>> --- a/drivers/clk/tegra/clk.c
>>> +++ b/drivers/clk/tegra/clk.c
>>> @@ -290,10 +290,13 @@ struct clk ** __init tegra_lookup_dt_id(int clk_id,
>>>  
>>>  tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
>>>  
>>> -void __init tegra_clocks_apply_init_table(void)
>>> +static int __init tegra_clocks_apply_init_table(void)
>>>  {
>>>  	if (!tegra_clk_apply_init_table)
>>> -		return;
>>> +		return 0;
>>
>> Shouldn't this be an error? Or perhaps WARN()? To make sure this gets
> 
> An arch_initcall will be called for every ARM platform I think? In case
> this gets called on a non-Tegra platform, tegra_clk_apply_init_table will not
> be set and therefore a silent return 0; seems the most appropriate thing to do
> to me?

This is one reason that doing all the initialization from separate
initcalls sucks. Much better to have a single top-level initialization
function that calls exactly what is needed, only what is needed, and
only runs on the correct SoCs.

But failing that, I guess you need to say something like
of_is_compatible(root node, "nvidia Tegra"), but of course the
definition of "nvidia Tegra" is an ever-growing list of possible values
that needs to be used from each separate initcall...
