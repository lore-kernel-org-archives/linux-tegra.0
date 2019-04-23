From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RFT V3 1/8] clk: divider: add explicit big endian support
Date: Tue, 23 Apr 2019 10:40:06 -0700
Message-ID: <155604120699.15276.12116926593244975174@swboyd.mtv.corp.google.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com>
 <20190418111211.10474-2-jonas.gorski@gmail.com>
 <CAMuHMdX7E8fR+2s-gPgGLKUCdW_--YUDW7w+op3BDurgACFEmA@mail.gmail.com>
 <CAOiHx=mjhzG-i8H5R0A+Mu3mcBXTNEaaBhC8rwCQPMWArDA+1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOiHx=mjhzG-i8H5R0A+Mu3mcBXTNEaaBhC8rwCQPMWArDA+1A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Jonas Gorski <jonas.gorski@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Sascha Hauer <s.hauer@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Michael Ellerman <mpe@ellerman.id.au>, Fabio Estevam <festevam@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Michal Simek <michal.simek@xilinx.com>, Shawn Guo <shawnguo@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Michael Turquette <mturquette@baylibre.com>, Paul Mackerras <paulus@samba.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-tegra <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-clk <linux-clk@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infrade>
List-Id: linux-tegra@vger.kernel.org

Quoting Jonas Gorski (2019-04-23 03:39:59)
> No purpose at all, it's an uncaught artifact from rebasing ._.
> 
> Stephen, which one is your preferred way of fixing that?
> 
> a) a new V4 patchset without this line
> b) a follow up patch that removes it
> c) just removing the line yourself

I'll go for c and fix up things. Thanks for the catch Geert!
