From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH] clk: tegra: PLLE spread spectrum control
Date: Thu, 3 Oct 2013 18:35:19 +0300
Message-ID: <20131003153519.GT3973@tbergstrom-lnx.Nvidia.com>
References: <1380209654-25458-1-git-send-email-pdeschrijver@nvidia.com>
 <524B28EA.40702@wwwdotorg.org>
 <20131003105228.GK3973@tbergstrom-lnx.Nvidia.com>
 <524D8C0B.90707@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <524D8C0B.90707@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Mike Turquette <mturquette@linaro.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 03, 2013 at 05:23:55PM +0200, Stephen Warren wrote:
> On 10/03/2013 04:52 AM, Peter De Schrijver wrote:
> > On Tue, Oct 01, 2013 at 09:56:26PM +0200, Stephen Warren wrote:
> >> On 09/26/2013 09:34 AM, Peter De Schrijver wrote:
> >>> Add spread spectrum control for PLLE in Tegra114.
> >>
> >> It would be useful to have some description of the end-user-visible
> >> benefit of this change; why is it useful?
> > 
> > spread spectrum clocking is a technique to reduce EMI caused by the clock
> > signal by modulating the frequency with a low frequency signal. This should
> > reduce interference with eg. Wifi or cellular modems on the same board.
> 
> Great. The intent of my request was for that information to be included
> in the patch description.
> 

Mike,

Do you want a version 2 for this?

Cheers,

Peter.
