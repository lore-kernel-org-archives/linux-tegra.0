From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 19/20] clk: tegra210: add support for Tegra210 clocks
Date: Wed, 6 May 2015 13:21:06 -0400
Message-ID: <554A4D82.80307@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com> <1430757460-9478-20-git-send-email-rklein@nvidia.com> <20150506145113.GH22098@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150506145113.GH22098-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 5/6/2015 10:51 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, May 04, 2015 at 12:37:39PM -0400, Rhyland Klein wrote:
> [...]
>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> [...]
>> +static struct div_nmp plld_nmp = {
>> +	.divm_shift = 0,
>> +	.divm_width = 8,
>> +	.divn_shift = 11,
>> +	.divn_width = 8,
>> +	.divp_shift = 20,
>> +	.divp_width = 3,
>> +};
> 
> I think we need to add the SDM shift and width fields here:
> 
> 	.sdm_shift = 0,
> 	.sdm_width = 16,
> 
> Otherwise pll_d can't take advantage of the fractional divider.
> 
Actually, sdm_shift/width aren't used. I originally added them to handle
SDM data, but eventually I switched to using a reg/mask combo. So this
isn't needed.

-rhyland


-- 
nvpublic
