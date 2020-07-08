From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2] clk: tegra: pll: Improve PLLM enable-state detection
Date: Wed, 8 Jul 2020 10:49:47 +0300
Message-ID: <e9579336-cb9f-c266-cc6f-5ea877539db2@gmail.com>
References: <20200708074628.18173-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200708074628.18173-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.07.2020 10:46, Dmitry Osipenko пишет:
> -	return val & PLL_BASE_ENABLE ? 1 : 0;
> +	return val & PLL_BASE_ENABLE;

This was unintended change that caught my eve only after sending out the
email, woops :) Please let me make a v3 shortly.
