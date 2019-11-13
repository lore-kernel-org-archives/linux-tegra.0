From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH -next] clk: tegra: Use match_string() helper to simplify the code
Date: Wed, 13 Nov 2019 15:04:20 -0800
Message-ID: <20191113230422.48A04206E3@mail.kernel.org>
References: <20191109034226.21044-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191109034226.21044-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jonathanh@nvidia.com, mturquette@baylibre.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, thierry.reding@gmail.com
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

Quoting YueHaibing (2019-11-08 19:42:26)
> match_string() returns the array index of a matching string.
> Use it instead of the open-coded implementation.
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next
