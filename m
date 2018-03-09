From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/3] clk: tegra: Mark HCLK, SCLK and EMC as critical
Date: Fri, 09 Mar 2018 09:33:06 -0800
Message-ID: <152061678678.13890.15810434310624804730@swboyd.mtv.corp.google.com>
References: <699ce67980d71fd315085ea9785ee6213e0772cb.1515589507.git.digetx@gmail.com>
 <cbf3e9ff-f7e1-32c2-546d-85fd198c2a3b@gmail.com>
 <1487f4a9-d924-3366-c86a-f1bd33ebb1bf@gmail.com> <20180308144437.GJ3529@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308144437.GJ3529@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2018-03-08 06:44:37)
> On Thu, Mar 01, 2018 at 04:33:29PM +0300, Dmitry Osipenko wrote:
> > On 15.01.2018 13:56, Dmitry Osipenko wrote:
> > > On 10.01.2018 16:59, Dmitry Osipenko wrote:
> > >> Machine dies if HCLK, SCLK or EMC is disabled. Hence mark these clocks
> > >> as critical.
> > >>
> > >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > >> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > >> ---
> > >>
> > >> Change log:
> > >> v2:     Fixed accidentally missed marking EMC as critical on Tegra30 and
> > >>         Tegra124. Switched to a use of common EMC gate definition on Tegra20
> > >>         and Tegra30.
> > >>
> > >> v3:     Dropped marking PLL_P outputs as critical, because seems they are
> > >>         not so critical. Although, I still haven't got a definitive answer
> > >>         about what exact HW functions are affected by the fixed-clocks.
> > >>         Anyway it should be cleaner to correct the actual drivers.
> > > 
> > > Stephen / Michael, would it be possible to schedule these patches for 4.16? My
> > > T20 and T30 devices aren't working without the 'critical clocks' patch. Things
> > > happen to work with the opensource u-boot, but not with the proprietary
> > > bootloader. It's probably not a big deal that out-of-tree devices are broken,
> > > although would be nice to have one problem less.
> > 
> > Guys, is there anything I could do to get these patches in linux-next?
> 
> I've picked these up into the for-4.17/clk branch in the Tegra tree. I
> already have that branch for the MBIST patches which are a dependency
> for the for-4.17/soc branch.
> 
> Stephen, Mike, let me know if you have any objections to carrying these
> in the Tegra tree.
> 

Are you going to send us a PR at some point?
