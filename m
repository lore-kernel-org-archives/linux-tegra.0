From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 10/11] clk: Show CRITICAL clks in clk_summary output
Date: Tue, 28 Jun 2016 10:40:29 -0700
Message-ID: <20160628174028.GC1521@codeaurora.org>
References: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
 <1464381494-27096-11-git-send-email-rklein@nvidia.com>
 <20160622122419.GC26943@ulmo.ba.sec>
 <0db7c9c8-d934-acba-2dbf-c704372ee541@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0db7c9c8-d934-acba-2dbf-c704372ee541@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On 06/22, Rhyland Klein wrote:
> On 6/22/2016 8:24 AM, Thierry Reding wrote:
> > 
> > Maybe output " " instead of "" for CLK_IS_CRITICAL, that way you can
> > omit the second conditional.
> > 
> > I wonder if it might be easier to read if this flag was at the end of
> > the line. There's also the fact that someone may have written a script
> > that expects the clock name as the first word on the line and may get
> > confused by this change. If you put it at the very end of the line the
> > likelihood of upsetting scripts will be reduced.
> 
> Yah we can put the mark at the end of the line. I wasn't sure if there
> was a strong motivation to avoid extending the the width of each line,
> as sometimes people prefer to try to keep it close to 80 char as
> possible. I think right now, it was close to that, but might be a little
> over already. I can switch to that though, as it is less likely to break
> any automatic parsing scripts.
> 

Nak. clk_summary is about taking a snapshot of the system state
for things that may be changing rapidly, like consumers (which
sounds fun to add!), rates, enable/prepare state. Flags are not
changing. If you want to add flag info into some summary then a
script should be able to augment clk_summary info (really should
use the clk_dump in this case though) with whatever flags can be
read through debugfs already.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
