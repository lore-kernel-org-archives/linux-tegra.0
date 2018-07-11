From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v4 2/4] clk: tegra: refactor 7.1 div calculation
Date: Wed, 11 Jul 2018 14:17:54 +0300
Message-ID: <20180711111754.GC1636@tbergstrom-lnx.Nvidia.com>
References: <1531154338-3998-1-git-send-email-avienamo@nvidia.com>
 <1531154338-3998-3-git-send-email-avienamo@nvidia.com>
 <5805047f-4099-db34-0759-42e4a9e11629@nvidia.com>
 <20180711080022.GB1636@tbergstrom-lnx.Nvidia.com>
 <ef90eb24-e993-9cc1-ac09-5afedeceba75@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ef90eb24-e993-9cc1-ac09-5afedeceba75@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Aapo Vienamo <avienamo@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 11, 2018 at 09:42:20AM +0100, Jon Hunter wrote:
> 
> On 11/07/18 09:00, Peter De Schrijver wrote:
> > On Tue, Jul 10, 2018 at 05:17:05PM +0100, Jon Hunter wrote:
> >>
> >> On 09/07/18 17:38, Aapo Vienamo wrote:
> >>> From: Peter De Schrijver <pdeschrijver@nvidia.com>
> >>>
> >>> Move this to a separate file so it can be used to calculate the sdmmc
> >>> clock dividers.
> >>
> >> Sorry for not commenting sooner, but what is the motivation for moving
> >> this to its own file? I don't see why we need to do this in order to use
> >> elsewhere. Furthermore, the original file is quite aptly named 'clk-divider.c'
> >> and now we have a div71.c which seems quite specific.
> > 
> > How else would you do it?
> 
> Keep it in the same file?
> 

That seems odd. clk-divider.c is meant to implement a clock type, not
utility functions we happen to need in several types.

Peter.
