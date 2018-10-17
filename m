From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 2/3] clk: tegra: Add more rates to Tegra30 PLLX
 frequency table
Date: Wed, 17 Oct 2018 09:59:02 +0100
Message-ID: <1c4e20b2-9929-b163-b371-b32596b6189a@nvidia.com>
References: <20180830192045.11017-1-digetx@gmail.com>
 <20180830192045.11017-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830192045.11017-3-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 30/08/2018 20:20, Dmitry Osipenko wrote:
> Add more predefined rates to the PLLX table, allowing to lower the rate
> down to 312MHz. This gives more variations of frequency selection to the
> CPUFREQ driver.

If these tables are pulled from some other NVIDIA kernel or a particular
document, I always like to see a reference to where these came from so
we can always refer back to them.

Cheers
Jon

-- 
nvpublic
