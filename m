From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 00/14] Fixes for Tegra clocks
Date: Thu, 27 Jul 2017 11:54:06 -0700
Message-ID: <20170727185406.GN2146@codeaurora.org>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
 <20170726013746.GM2146@codeaurora.org>
 <20170726082728.GD26726@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170726082728.GD26726-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/26, Peter De Schrijver wrote:
> On Tue, Jul 25, 2017 at 06:37:46PM -0700, Stephen Boyd wrote:
> > On 07/25, Peter De Schrijver wrote:
> > > A number of smaller fixes and simplifications for the Tegra clock
> > > implementation.
> > 
> > Any of these need fixes tags so they can be backported to stable
> > trees? Also, everyone is on To: line, so not sure who is supposed
> 
> I will have a look. For some of them a backport might be useful.
> 
> > to pick these up. Me? That's fine if so.
> > 
> 
> That would be the easiest I think.
> 

Ok. I'll wait for you to reply with tags unless you didn't find
any?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
