From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] clk: tegra: mark TEGRA210_CLK_DBGAPB as always on
Date: Wed, 8 Mar 2017 12:38:44 +0100
Message-ID: <CAMuHMdVRa3C4ikaoNDDU21NbRVcPTf0z6fPiJ1nF-VDd+3Dm0g@mail.gmail.com>
References: <1488295191-24038-1-git-send-email-pdeschrijver@nvidia.com>
 <4cf40c25-2ce9-737c-9ccb-06bc2cdb61d7@nvidia.com> <20170306083835.GF26640@tbergstrom-lnx.Nvidia.com>
 <6d4dd315-cab6-189d-f383-fb7523fc31bd@nvidia.com> <20170306142850.GJ26640@tbergstrom-lnx.Nvidia.com>
 <CAMuHMdWD5Pw4BfH7YMY5hnxGbib=8zqUrHrG+GHXquRjjSZ+gA@mail.gmail.com> <f1505f37-cf96-fe04-dfc1-1dd94e20e130@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f1505f37-cf96-fe04-dfc1-1dd94e20e130@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk <linux-clk@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

On Wed, Mar 8, 2017 at 11:13 AM, Jon Hunter <jonathanh@nvidia.com> wrote:
>> I had a similar issue with SH-Mobile AG5, where the power domain containing
>> the JTAG interface is powered down.
>
> This reminds me, does your patch assume that the DFD power domain is
> enabled? I am guessing that it needs to be for JTAG to work.

Yes. The pm-rmobile driver looks for "arm,coresight-etm3x" devices, and
marks the corresponding PM Domain as always-on, as long as the
Coresight code doesn't handle runtime PM.

For R-Mobile A1 and APE6 I already have added such device nodes, as any access
to a debug register hangs when the debug power domain is powered down.
For SH-Mobile AG5, I hadn't, as the debug power domain needs to be powered
for JTAG functionality only.

For the latter, perhaps we also need a command line parameter to change
a device status from "disabled" to "enabled"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
