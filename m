From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v10 01/15] clk: tegra20/30: Add custom EMC clock implementation
Date: Tue, 10 Sep 2019 03:33:04 -0700
Message-ID: <20190910103305.B4E1B20872@mail.kernel.org>
References: <20190811210043.20122-1-digetx@gmail.com> <20190811210043.20122-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811210043.20122-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-08-11 14:00:29)
> A proper External Memory Controller clock rounding and parent selection
> functionality is required by the EMC drivers, it is not available using
> the generic clock implementation because only the Memory Controller driver
> is aware of what clock rates are actually available for a particular
> device. EMC drivers will have to register a Tegra-specific CLK-API
> callback which will perform rounding of a requested rate. EMC clock users
> won't be able to request EMC clock by getting -EPROBE_DEFER until EMC
> driver is probed and the callback is set up.
>=20
> The functionality is somewhat similar to the clk-emc.c which serves
> Tegra124+ SoCs. The later HW generations support more parent clock sources
> and the HW configuration / integration with the EMC drivers differs a tad
> from the older gens, hence it's not really worth to try to squash
> everything into a single source file.
>=20
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
