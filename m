From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 7/9] clk: tegra: Fix double-free in tegra_clk_init()
Date: Tue, 7 Jan 2020 12:39:14 +0000
Message-ID: <8dcca34c74c341cfb86ed8b2a914953e@HQMAIL105.nvidia.com>
References: <20200106010423.5890-8-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106010423.5890-8-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 06 Jan 2020 04:04:21 +0300, Dmitry Osipenko wrote:
> It's unlikely to happen in practice ever, but makes static checkers happy.
> 
> Fixes: 535f296d47de ("clk: tegra: Add suspend and resume support on Tegra210")
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Tested-by: Thierry Reding <treding@nvidia.com>
