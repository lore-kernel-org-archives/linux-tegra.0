From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 08/12] clk: tegra: move periph clocks to common file
Date: Tue, 24 Sep 2013 10:44:24 -0600
Message-ID: <5241C168.4060100@wwwdotorg.org>
References: <1379515331-19427-1-git-send-email-pdeschrijver@nvidia.com> <1379515331-19427-9-git-send-email-pdeschrijver@nvidia.com> <5240890F.6050807@wwwdotorg.org> <20130924082004.GJ30013@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130924082004.GJ30013-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/24/2013 02:20 AM, Peter De Schrijver wrote:
> On Mon, Sep 23, 2013 at 08:31:43PM +0200, Stephen Warren wrote:
>> On 09/18/2013 08:41 AM, Peter De Schrijver wrote:
>>> Introduce a new file for peripheral clocks common between several Tegra
>>> SoCs and move Tegra114 to this new infrastructure. Also PLLP and the PLLP_OUT
>>> clocks will be initialized here.
>>
>>> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
>>
>> Similarly here: don't the following differences exist between the SoCs:
>>
>> * At least the set of extant peripheral clocks, and perhaps some
>> parameters of those clocks.
> 
> That's what the tegra_clks is for. If the clock isn't in that table, it won't
> be registered.
> 
>> * The set of legal parents for some peripheral clocks (?)
> 
> If they differ for Tegra20 and Tegra30, we will need some extra clocks here,
> which will have a new ID and then only be defined in the tegra_clks for those
> SoCs. Alternatively they can stay in the SoC specific files.

I guess that would work.

However, I'd suggest simply leaving all the SoC-specific stuff in the
SoC-specific files until it actually becomes shared. Otherwise, you're
simply putting all the code into one big file, and parameterizing it to
get the correct SoC-specific clocks registered, when you could just keep
the SoC-specific code in the SoC-specific file/functions, and not need
any of the conditions.
