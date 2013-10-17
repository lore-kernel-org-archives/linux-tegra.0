From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH v4 10/15] clk: tegra: move audio clk to common file
Date: Thu, 17 Oct 2013 16:44:41 -0700
Message-ID: <CAL1qeaFeUevACE_ETqV7Ytzi2mk5bPANzfEAQ0uLWmw=iGELTA@mail.gmail.com>
References: <1382013526-12800-1-git-send-email-pdeschrijver@nvidia.com>
	<1382013526-12800-11-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382013526-12800-11-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

> +static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {

Not really a big deal, but a lot of these clocks are not audio
related.  Maybe they should be added when the common infrastructure to
deal with them is added?

Thanks,
Andrew
