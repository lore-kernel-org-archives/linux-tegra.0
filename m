From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/5] clk: tegra: emc: Support multiple RAM codes
Date: Thu, 25 Apr 2019 13:54:59 -0700
Message-ID: <155622569977.15276.16514341758951287015@swboyd.mtv.corp.google.com>
References: <20190414192321.23294-1-digetx@gmail.com> <20190414192321.23294-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414192321.23294-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-04-14 12:23:18)
> The timings parser doesn't append timings, but instead it parses only
> the first timing and hence doesn't store all of the timings when
> device-tree has timings for multiple RAM codes. In a result EMC scaling
> doesn't work if timings are missing.
>=20
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-next
