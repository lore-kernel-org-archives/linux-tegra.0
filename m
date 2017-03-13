From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH] clk: tegra: mark TEGRA210_CLK_DBGAPB as always on
Date: Mon, 13 Mar 2017 12:45:32 +0200
Message-ID: <20170313104532.GT26640@tbergstrom-lnx.Nvidia.com>
References: <1488295191-24038-1-git-send-email-pdeschrijver@nvidia.com>
 <4cf40c25-2ce9-737c-9ccb-06bc2cdb61d7@nvidia.com>
 <20170306083835.GF26640@tbergstrom-lnx.Nvidia.com>
 <6d4dd315-cab6-189d-f383-fb7523fc31bd@nvidia.com>
 <20170306142850.GJ26640@tbergstrom-lnx.Nvidia.com>
 <CAMuHMdWD5Pw4BfH7YMY5hnxGbib=8zqUrHrG+GHXquRjjSZ+gA@mail.gmail.com>
 <f1505f37-cf96-fe04-dfc1-1dd94e20e130@nvidia.com>
 <CAMuHMdVRa3C4ikaoNDDU21NbRVcPTf0z6fPiJ1nF-VDd+3Dm0g@mail.gmail.com>
 <313f1245-02aa-496c-3545-5029ece652af@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <313f1245-02aa-496c-3545-5029ece652af@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk <linux-clk@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 08, 2017 at 11:48:21AM +0000, Jon Hunter wrote:
> 
> On 08/03/17 11:38, Geert Uytterhoeven wrote:
> > Hi Jon,
> > 
> > On Wed, Mar 8, 2017 at 11:13 AM, Jon Hunter <jonathanh@nvidia.com> wrote:
> >>> I had a similar issue with SH-Mobile AG5, where the power domain containing
> >>> the JTAG interface is powered down.
> >>
> >> This reminds me, does your patch assume that the DFD power domain is
> >> enabled? I am guessing that it needs to be for JTAG to work.
> > 
> > Yes. The pm-rmobile driver looks for "arm,coresight-etm3x" devices, and
> > marks the corresponding PM Domain as always-on, as long as the
> > Coresight code doesn't handle runtime PM.
> 
> Sorry Geert, but I was asking Peter specifically about the power-domain
> on Tegra as I have a feeling we may have the same scenario ;-)

We don't have a specific power domain for DFD on Tegra210. It's part of the
non-powergateable core domain.

Cheers,

Peter.
