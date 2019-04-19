From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RESEND] clk: tegra: Don't enable already enabled PLLs
Date: Fri, 19 Apr 2019 15:19:32 -0700
Message-ID: <155571237296.15276.7432257601401549388@swboyd.mtv.corp.google.com>
References: <20190419114226.8066-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190419114226.8066-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-04-19 04:42:26)
> Initially Common Clock Framework isn't aware of the clock-enable status,
> this results in enabling of clocks that were enabled by bootloader. This
> is not a big deal for a regular clock-gates, but for PLL's it may have
> some unpleasant consequences. Thus re-enabling PLLX (the main CPU parent
> clock) may result in extra long period of PLL re-locking.
>=20
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-next
