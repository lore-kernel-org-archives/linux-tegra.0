From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
 Tegra210
Date: Tue, 14 Apr 2020 19:40:55 +0300
Message-ID: <543bfc3b-2bb9-01d3-62da-89d1f0b18a5b@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-12-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20200409175238.3586487-12-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
> -	/* EMC training timer */

Guess this comment isn't really needed from the start, or should it be kept?

> +	timer_setup(&emc->refresh_timer, tegra210_emc_poll_refresh,
> +		    TIMER_DEFERRABLE);
> +	atomic_set(&emc->refresh_poll, 0);
> +	emc->refresh_poll_interval = 1000;
