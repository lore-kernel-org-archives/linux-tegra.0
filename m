From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 10/11] clk: Show CRITICAL clks in clk_summary output
Date: Thu, 30 Jun 2016 16:13:53 -0400
Message-ID: <9d520158-ecb7-566b-38f6-8ab01a12ff39@nvidia.com>
References: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
 <1464381494-27096-11-git-send-email-rklein@nvidia.com>
 <20160622122419.GC26943@ulmo.ba.sec>
 <0db7c9c8-d934-acba-2dbf-c704372ee541@nvidia.com>
 <20160628174028.GC1521@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160628174028.GC1521-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 6/28/2016 1:40 PM, Stephen Boyd wrote:
> On 06/22, Rhyland Klein wrote:
>> On 6/22/2016 8:24 AM, Thierry Reding wrote:
>>>
>>> Maybe output " " instead of "" for CLK_IS_CRITICAL, that way you can
>>> omit the second conditional.
>>>
>>> I wonder if it might be easier to read if this flag was at the end of
>>> the line. There's also the fact that someone may have written a script
>>> that expects the clock name as the first word on the line and may get
>>> confused by this change. If you put it at the very end of the line the
>>> likelihood of upsetting scripts will be reduced.
>>
>> Yah we can put the mark at the end of the line. I wasn't sure if there
>> was a strong motivation to avoid extending the the width of each line,
>> as sometimes people prefer to try to keep it close to 80 char as
>> possible. I think right now, it was close to that, but might be a little
>> over already. I can switch to that though, as it is less likely to break
>> any automatic parsing scripts.
>>
> 
> Nak. clk_summary is about taking a snapshot of the system state
> for things that may be changing rapidly, like consumers (which
> sounds fun to add!), rates, enable/prepare state. Flags are not
> changing. If you want to add flag info into some summary then a
> script should be able to augment clk_summary info (really should
> use the clk_dump in this case though) with whatever flags can be
> read through debugfs already.
> 

That is fine with me. This was more of something I was using locally to
verify things and thought it might be useful in some manner upstream.
However, a script which read the clk_flags from debugfs for each clk
could do the same thing without changing the summary.

-rhyland

-- 
nvpublic
