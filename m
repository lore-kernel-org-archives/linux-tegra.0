From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1] clk: tegra: Fix double-free in tegra_clk_init()
Date: Tue, 24 Dec 2019 00:01:10 -0800
Message-ID: <20191224080111.4DBA9206CB@mail.kernel.org>
References: <20191210020512.6088-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191210020512.6088-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-12-09 18:05:12)
> It's unlikely to happen in practice ever, but makes static checkers happy.
>=20
> Fixes: 535f296d47de ("clk: tegra: Add suspend and resume support on Tegra=
210")
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-fixes
