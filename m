From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: tegra-super: Fix sparse warnings for functions
 not declared as static
Date: Mon, 7 Dec 2015 12:51:17 -0500
Message-ID: <5665C715.7030608@nvidia.com>
References: <1449248665-22343-1-git-send-email-jonathanh@nvidia.com>
 <1449248665-22343-3-git-send-email-jonathanh@nvidia.com>
 <5665AB15.80602@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5665AB15.80602-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/7/2015 10:51 AM, Rhyland Klein wrote:
> On 12/4/2015 12:04 PM, Jon Hunter wrote:
>> Sparse reports the following warnings for structures and functions that
>> should be declared static:
>>
>> drivers/clk/tegra/clk-tegra-super-gen4.c:70:35: warning: symbol
>>  'tegra_super_gen_info_gen4' was not declared. Should it be static?
>> drivers/clk/tegra/clk-tegra-super-gen4.c:96:35: warning: symbol
>>  'tegra_super_gen_info_gen5' was not declared. Should it be static?
>> drivers/clk/tegra/clk-tegra-super-gen4.c:174:13: warning: symbol
>>  'tegra_super_clk_init' was not declared. Should it be static?
>>
>> Fix this by making the above static.
>>
>> Fixes: 88467d220119 ("clk: tegra: Add Super Gen5 Logic")
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/clk/tegra/clk-tegra-super-gen4.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
> ...
> 
> Acked-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 

Actually, Don't you need to change the function declarations in
drivers/clk/tegra/clk.h for tegra_super_clk_gen[4|5]_init otherwise you
will get mismatches with one being declared static and the other not?

-rhyland

-- 
nvpublic
