From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Fix bypassing of PLLs
Date: Mon, 23 Nov 2015 12:36:33 +0000
Message-ID: <56530851.8020206@nvidia.com>
References: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
 <20151120171527.GL32672@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151120171527.GL32672-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 20/11/15 17:15, Stephen Boyd wrote:
> On 11/20, Jon Hunter wrote:
>> The _clk_disable_pll() function will attempt to place a PLL into bypass
>> if the TEGRA_PLL_BYPASS is specified for the PLL and then disable the PLL
>> by clearing the enable bit. To place the PLL into bypass, the bypass bit
>> needs to be set and not cleared. Fix this by setting the bypass bit and
>> not clearing it.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
> 
> Fixes tag? It looks like this has been wrong from the beginning
> of time.

Yes good point.

Thierry, I see you have put this in the -next branch for tegra. Do you
want to add the following?

Fixes: 8f8f484bf355 ("clk: tegra: add Tegra specific clocks")

Jon
