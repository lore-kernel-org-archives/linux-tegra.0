From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 3/4] clk: tegra20: Turn EMC clock gate into divider
Date: Fri, 01 Jun 2018 23:37:28 -0700
Message-ID: <152792144851.225090.7409061495035612435@swboyd.mtv.corp.google.com>
References: <20180530150646.19030-1-digetx@gmail.com>
 <20180530150646.19030-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180530150646.19030-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2018-05-30 08:06:45)
> Kernel should never gate the EMC clock as it causes immediate lockup, so
> removing clk-gate functionality doesn't affect anything. Turning EMC clk
> gate into divider allows to implement glitch-less EMC scaling, avoiding
> reparenting to a backup clock.
> =

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Looks ok to me, but I'm waiting for someone from Tegra side to ack it or
review it.
