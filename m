From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 00/14] Fixes for Tegra clocks
Date: Wed, 26 Jul 2017 11:27:29 +0300
Message-ID: <20170726082728.GD26726@tbergstrom-lnx.Nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
 <20170726013746.GM2146@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170726013746.GM2146@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 25, 2017 at 06:37:46PM -0700, Stephen Boyd wrote:
> On 07/25, Peter De Schrijver wrote:
> > A number of smaller fixes and simplifications for the Tegra clock
> > implementation.
> 
> Any of these need fixes tags so they can be backported to stable
> trees? Also, everyone is on To: line, so not sure who is supposed

I will have a look. For some of them a backport might be useful.

> to pick these up. Me? That's fine if so.
> 

That would be the easiest I think.

Cheers,

Peter.

> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
