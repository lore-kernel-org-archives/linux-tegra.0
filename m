From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RFT V3 3/8] clk: gate: add explicit big endian support
Date: Thu, 18 Apr 2019 14:51:27 -0700
Message-ID: <155562428783.15276.13185872825192119324@swboyd.mtv.corp.google.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com>
 <20190418111211.10474-4-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190418111211.10474-4-jonas.gorski@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonas Gorski <jonas.gorski@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Paul Mackerras <paulus@samba.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Michael Ellerman <mpe@ellerman.id.au>, Thierry Reding <thierry.reding@gmail.com>, Anatolij Gustschin <agust@denx.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: linux-tegra@vger.kernel.org

Quoting Jonas Gorski (2019-04-18 04:12:06)
> Add a clock specific flag to switch register accesses to big endian, to
> allow runtime configuration of big endian gated clocks.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---

Applied to clk-next
