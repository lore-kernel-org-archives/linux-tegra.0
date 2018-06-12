From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1] clk: tegra: emc: Avoid out-of-bounds bug
Date: Tue, 12 Jun 2018 00:46:03 -0700
Message-ID: <152878956397.16708.14349666570210193783@swboyd.mtv.corp.google.com>
References: <20180605121232.7121-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180605121232.7121-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Mikko Perttunen <cyndis@kapsi.fi>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2018-06-05 05:12:32)
> Apparently there was an attempt to avoid out-of-bounds accesses when there
> is only one memory timing available, but there is a typo in the code that
> neglects that attempt.
> =

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Fixes: tag?
