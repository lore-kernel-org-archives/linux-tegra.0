From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 4/5] clk: tegra: emc: Replace BUG() with WARN_ONCE()
Date: Thu, 25 Apr 2019 13:55:26 -0700
Message-ID: <155622572639.15276.9842920673361020856@swboyd.mtv.corp.google.com>
References: <20190414192321.23294-1-digetx@gmail.com> <20190414192321.23294-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414192321.23294-5-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-04-14 12:23:20)
> There is no justification for the BUG() in this code.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-next
