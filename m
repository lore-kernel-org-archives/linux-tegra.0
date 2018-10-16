From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: tegra: probe deferral error reporting
Date: Tue, 16 Oct 2018 15:30:08 -0700
Message-ID: <153972900814.5275.3822404544995929863@swboyd.mtv.corp.google.com>
References: <20180814091805.1363-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814091805.1363-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Stefan Agner <stefan@agner.ch>, Peter Geis <pgwipeout@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Marcel Ziswiler (2018-08-14 02:18:05)
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> =

> Actually report the error code from devm_regulator_get() which may as
> well just be a probe deferral.
> =

> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> =

> ---

Applied to clk-next
