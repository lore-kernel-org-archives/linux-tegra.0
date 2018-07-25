From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v6 3/4] clk: tegra: Add sdmmc mux divider clock
Date: Wed, 25 Jul 2018 14:28:18 -0700
Message-ID: <153255409888.48062.18427465027530245711@swboyd.mtv.corp.google.com>
References: <1531396382-5579-1-git-send-email-avienamo@nvidia.com>
 <1531396382-5579-4-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531396382-5579-4-git-send-email-avienamo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, Aapo Vienamo <avienamo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Quoting Aapo Vienamo (2018-07-12 04:53:01)
> From: Peter De-Schrijver <pdeschrijver@nvidia.com>
> =

> Add a clock type to model the sdmmc switch divider clocks which have paths
> to source clocks bypassing the divider (Low Jitter paths). These
> are handled by selecting the lj path when the divider is 1 (ie the
> rate is the parent rate), otherwise the normal path with divider
> will be selected. Otherwise this clock behaves as a normal peripheral
> clock.
> =

> Signed-off-by: Peter De-Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---

Applied to clk-next
