From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 1/2] clk: tegra: divider: Fix missing check for enable-bit on rate's recalculation
Date: Wed, 17 Jul 2019 13:08:20 -0700
Message-ID: <20190717200821.A77A120818@mail.kernel.org>
References: <20190715173527.5719-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715173527.5719-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-07-15 10:35:26)
> Unset "enable" bit means that divider is in bypass mode, hence it doesn't
> have any effect in that case.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Any Fixes tags for these patches?
