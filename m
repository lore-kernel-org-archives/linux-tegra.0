From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v4 00/10] memory: tegra: Introduce Tegra30 EMC driver
Date: Mon, 17 Jun 2019 11:21:43 +0300
Message-ID: <20190617082143.GM29894@pdeschrijver-desktop.Nvidia.com>
References: <20190616233551.6838-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190616233551.6838-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 17, 2019 at 02:35:41AM +0300, Dmitry Osipenko wrote:
> Hello,
> 
> This series introduces driver for the External Memory Controller (EMC)
> found on Tegra30 chips, it controls the external DRAM on the board. The
> purpose of this driver is to program memory timing for external memory on
> the EMC clock rate change. The driver was tested using the ACTMON devfreq
> driver that performs memory frequency scaling based on memory-usage load.

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
