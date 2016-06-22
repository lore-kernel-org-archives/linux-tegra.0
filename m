From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 10/11] clk: Show CRITICAL clks in clk_summary output
Date: Wed, 22 Jun 2016 11:31:08 -0400
Message-ID: <0db7c9c8-d934-acba-2dbf-c704372ee541@nvidia.com>
References: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
 <1464381494-27096-11-git-send-email-rklein@nvidia.com>
 <20160622122419.GC26943@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160622122419.GC26943-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 6/22/2016 8:24 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Fri, May 27, 2016 at 04:38:13PM -0400, Rhyland Klein wrote:
>> Add a '^' character to the beginning of clk entries that are for
>> CRITICAL clks.
>>
>> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/clk/clk.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 874c7dd8ef66..22dd0ca1e491 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -1948,8 +1948,9 @@ static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
>>  	if (!c)
>>  		return;
>>  
>> -	seq_printf(s, "%*s%-*s %11d %12d %11lu %10lu %-3d\n",
>> -		   level * 3 + 1, "",
>> +	seq_printf(s, "%s%*s%-*s %11d %12d %11lu %10lu %-3d\n",
>> +		   (c->flags & CLK_IS_CRITICAL ? "^" : ""),
>> +		   level * 3 + (c->flags & CLK_IS_CRITICAL ? 0 : 1), "",
> 
> Maybe output " " instead of "" for CLK_IS_CRITICAL, that way you can
> omit the second conditional.
> 
> I wonder if it might be easier to read if this flag was at the end of
> the line. There's also the fact that someone may have written a script
> that expects the clock name as the first word on the line and may get
> confused by this change. If you put it at the very end of the line the
> likelihood of upsetting scripts will be reduced.

Yah we can put the mark at the end of the line. I wasn't sure if there
was a strong motivation to avoid extending the the width of each line,
as sometimes people prefer to try to keep it close to 80 char as
possible. I think right now, it was close to that, but might be a little
over already. I can switch to that though, as it is less likely to break
any automatic parsing scripts.

-rhyland

-- 
nvpublic
