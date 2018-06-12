From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] clk: tegra: emc: Avoid out-of-bounds bug
Date: Tue, 12 Jun 2018 14:06:51 +0300
Message-ID: <2271626.NalpgXIy8M@dimapc>
References: <20180605121232.7121-1-digetx@gmail.com> <152878956397.16708.14349666570210193783@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152878956397.16708.14349666570210193783@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Mikko Perttunen <cyndis@kapsi.fi>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tuesday, 12 June 2018 10:46:03 MSK Stephen Boyd wrote:
> Quoting Dmitry Osipenko (2018-06-05 05:12:32)
> 
> > Apparently there was an attempt to avoid out-of-bounds accesses when there
> > is only one memory timing available, but there is a typo in the code that
> > neglects that attempt.
> > 
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Fixes: tag?

This is kinda a minor fix for an issue that shouldn't happen because today 
AFAIK nothing on Tegra imposes the max/min clock rate constraints. There is no 
need to backport this patch.
