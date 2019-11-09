From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/5] clk: tegra: Move SOR0 implementation to Tegra124
Date: Fri, 08 Nov 2019 16:39:22 -0800
Message-ID: <20191109003922.CD2502084D@mail.kernel.org>
References: <20191016125919.1773898-1-thierry.reding@gmail.com>
 <20191016125919.1773898-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191016125919.1773898-3-thierry.reding@gmail.com>
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

Quoting Thierry Reding (2019-10-16 05:59:16)
> From: Thierry Reding <treding@nvidia.com>
> 
> The SOR0 clock on Tegra210 is very different from the SOR0 clock found
> on Tegra124. Move the Tegra124 implementation to the Tegra124 driver so
> that a custom implementation can be provided on Tegra210 without
> clashing with the existing clock.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
