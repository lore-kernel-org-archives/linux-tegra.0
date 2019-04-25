From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 2/2] clk: tegra124: Remove lock-enable bit from PLLM
Date: Thu, 25 Apr 2019 08:17:39 -0700
Message-ID: <155620545907.15276.14629311287072608722@swboyd.mtv.corp.google.com>
References: <20190411214835.19947-1-digetx@gmail.com> <20190411214835.19947-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411214835.19947-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-04-11 14:48:35)
> According to the Tegra124 TRM documentation, PLLM_MISC2 register doesn't
> have the lock-enable bit as well as any other PLLM-related register. Hence
> PLLM re-locking can't be initiated by software. The incorrect bit setting
> should have been harmless since that bit is undefined according to TRM.
>=20
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-next
