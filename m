From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH RFT V2 1/8] clk: divider: add explicit big endian support
Date: Thu, 18 Apr 2019 11:00:21 +0200
Message-ID: <CAOiHx==vJ7ss3G8poddKpdDA_3U9bh9LtBaaFZ2EcxxGF4nNGA@mail.gmail.com>
References: <20190415101046.5872-1-jonas.gorski@gmail.com>
 <20190415101046.5872-2-jonas.gorski@gmail.com>
 <155554397723.15276.10863024281240089015@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <155554397723.15276.10863024281240089015@swboyd.mtv.corp.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Prashant Gaikwad <pgaikwad@nvidia.com>, Paul Mackerras <paulus@samba.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Michael Ellerman <mpe@ellerman.id.au>, linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 18 Apr 2019 at 01:32, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Jonas Gorski (2019-04-15 03:10:39)
> > @@ -370,7 +388,7 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
> >         if (divider->flags & CLK_DIVIDER_READ_ONLY) {
> >                 u32 val;
> >
> > -               val = clk_readl(divider->reg) >> divider->shift;
> > +               val = clk_div_readl(divider->reg) >> divider->shift;
>
> Good deal that kbuild running sparse found that this was supposed to be
> divider and not divider->reg. If you can fix that and remove the else in
> all the basic type readl wrappers then this series looks good to merge
> for me.

Yeah, I'm quite glad about that. I was first confused why I didn't
catch it in my test build, but then remembered only C++ complains
about implicit void* casts (IIRC). I have it already fixed locally and
did a sparse build myself, was just waiting for at least one non-bot
comment before resending the series.


Regards
Jonas
