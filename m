From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/5] clk: tegra: Remove last remains of
 TEGRA210_CLK_SOR1_SRC
Date: Fri, 08 Nov 2019 16:39:26 -0800
Message-ID: <20191109003927.6B2522084D@mail.kernel.org>
References: <20191016125919.1773898-1-thierry.reding@gmail.com>
 <20191016125919.1773898-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191016125919.1773898-2-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2019-10-16 05:59:15)
> From: Thierry Reding <treding@nvidia.com>
> 
> Later SoC generations implement this clock as SOR1_OUT. For consistency,
> the Tegra210 implementation was adapted to match the same name in commit
> 4d1dc4018573 ("dt-bindings: clock: tegra: Add sor1_out clock").
> 
> Clean up the remaining pieces by adopting the new name for the internal
> identifiers and remove the old alias. Note that since both SOR1_SRC and
> SOR1_OUT were referring to the same device tree clock ID, this does not
> break device tree ABI.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
