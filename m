From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 5/5] clk: tegra: divider: Mark Memory Controller clock as read-only
Date: Thu, 25 Apr 2019 13:55:46 -0700
Message-ID: <155622574672.15276.11429351247283832155@swboyd.mtv.corp.google.com>
References: <20190414192321.23294-1-digetx@gmail.com> <20190414192321.23294-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414192321.23294-6-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-04-14 12:23:21)
> The Memory Controller (MC) clock rate can't be simply changed and nothing
> in kernel need to change the rate, hence let's make the clock read-only.
> This id also needed for the EMC driver because timing configuration may
> require the MC clock diver to be disabled, that is handled by the EMC
> clock / EMC driver integration and CLK framework shall not touch the
> MC divider configuration on the EMC clock rate change.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-next
