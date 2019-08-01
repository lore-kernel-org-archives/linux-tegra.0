From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v9 01/15] clk: tegra20/30: Add custom EMC clock
 implementation
Date: Thu, 1 Aug 2019 14:10:38 +0300
Message-ID: <ac9a29b2-d65e-9b20-ff47-c9e5eacae31b@gmail.com>
References: <20190730165618.10122-1-digetx@gmail.com>
 <20190730165618.10122-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730165618.10122-2-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.07.2019 19:56, Dmitry Osipenko пишет:
> A proper External Memory Controller clock rounding and parent selection
> functionality is required by the EMC drivers, it is not available using
> the generic clock implementation because only the Memory Controller driver
> is aware of what clock rates are actually available for a particular
> device. EMC drivers will have to register a Tegra-specific CLK-API
> callback which will perform rounding of a requested rate. EMC clock users
> won't be able to request EMC clock by getting -EPROBE_DEFER until EMC
> driver is probed and the callback is set up.
> 
> The functionality is somewhat similar to the clk-emc.c which serves
> Tegra124+ SoCs. The later HW generations support more parent clock sources
> and the HW configuration / integration with the EMC drivers differs a tad
> from the older gens, hence it's not really worth to try to squash
> everything into a single source file.
> 
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Hello Stephen and Michael,

The clk-driver changes are quite solid now, could you please take a look
at the relevant patches once again and give an ACK if everything is good
to you?
