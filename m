From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 00/14] Fixes for Tegra clocks
Date: Wed, 23 Aug 2017 16:07:02 -0700
Message-ID: <20170823230702.GK21656@codeaurora.org>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
 <20170726013746.GM2146@codeaurora.org>
 <20170726082728.GD26726@tbergstrom-lnx.Nvidia.com>
 <20170727185406.GN2146@codeaurora.org>
 <20170817134803.GE6854@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170817134803.GE6854@ulmo>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08/17, Thierry Reding wrote:
> On Thu, Jul 27, 2017 at 11:54:06AM -0700, Stephen Boyd wrote:
> > On 07/26, Peter De Schrijver wrote:
> > > On Tue, Jul 25, 2017 at 06:37:46PM -0700, Stephen Boyd wrote:
> > > > On 07/25, Peter De Schrijver wrote:
> > > > > A number of smaller fixes and simplifications for the Tegra clock
> > > > > implementation.
> > > > 
> > > > Any of these need fixes tags so they can be backported to stable
> > > > trees? Also, everyone is on To: line, so not sure who is supposed
> > > 
> > > I will have a look. For some of them a backport might be useful.
> > > 
> > > > to pick these up. Me? That's fine if so.
> > > > 
> > > 
> > > That would be the easiest I think.
> > > 
> > 
> > Ok. I'll wait for you to reply with tags unless you didn't find
> > any?
> 
> I'm not aware of any bugs that these would fix, so I think we can apply
> these as-is.
> 

Ok. Applied them all to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
