From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1] clk: tegra: Mark Memory Controller clock as critical
Date: Sun, 08 Jul 2018 17:09:41 -0700
Message-ID: <153109498169.143105.9808940703939118816@swboyd.mtv.corp.google.com>
References: <20180603224805.495-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180603224805.495-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2018-06-03 15:48:05)
> Memory Controller should be always-on. Currently the sibling EMC clock is
> marked as critical, let's mark MC clock too for consistency.
> =

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-next
