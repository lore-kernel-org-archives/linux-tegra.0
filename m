From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 1/2] clk: tegra: Fix PLLM programming on Tegra124+ when PMC overrides divider
Date: Thu, 25 Apr 2019 08:17:32 -0700
Message-ID: <155620545264.15276.2161212955972224165@swboyd.mtv.corp.google.com>
References: <20190411214835.19947-1-digetx@gmail.com> <20190411214835.19947-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411214835.19947-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-04-11 14:48:34)
> There are wrongly set parenthesis in the code that are resulting in a
> wrong configuration being programmed for PLLM. The original fix was made
> by Danny Huang in the downstream kernel. The patch was tested on Nyan Big
> Tegra124 chromebook, PLLM rate changing works correctly now and system
> doesn't lock up after changing the PLLM rate due to EMC scaling.
>=20
> Cc: <stable@vger.kernel.org>
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-next
