From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: tegra: bpmp: Don't crash when a clock fails to register
Date: Sun, 08 Jul 2018 16:56:35 -0700
Message-ID: <153109419548.143105.6202239165158958607@swboyd.mtv.corp.google.com>
References: <20180629143814.17950-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180629143814.17950-1-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jonathanh@nvidia.com, mturquette@baylibre.com, pdeschrijver@nvidia.com, thierry.reding@gmail.com
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, swarren@nvidia.com, vbhadram@nvidia.com, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Quoting Mikko Perttunen (2018-06-29 07:38:14)
> When registering clocks, we just skip any that fail to register
> (leaving a NULL hole in the clock table). However, our of_xlate
> function still tries to dereference each entry while looking for
> the clock with the requested id, causing a crash if any clocks
> failed to register. Add a check to of_xlate to skip any NULL
> clocks.
> =

> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---

Applied to clk-next
