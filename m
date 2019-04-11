From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH -next] clk: tegra: Make tegra_clk_super_mux_ops static
Date: Thu, 11 Apr 2019 11:45:52 -0700
Message-ID: <155500835238.20095.14738602496154666995@swboyd.mtv.corp.google.com>
References: <20190319153504.23072-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319153504.23072-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jonathanh@nvidia.com, mturquette@baylibre.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

Quoting Yue Haibing (2019-03-19 08:35:04)
> From: YueHaibing <yuehaibing@huawei.com>
>=20
> Fix sparse warning:
>=20
> drivers/clk/tegra/clk-super.c:124:22:
>  warning: symbol 'tegra_clk_super_mux_ops' was not declared. Should it be=
 static?
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next
