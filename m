From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt: bindings: tegra20-emc: Document interrupt
 property
Date: Mon, 11 Jun 2018 12:26:46 -0600
Message-ID: <20180611182646.GA16835@rob-hp-laptop>
References: <20180603223654.23324-1-digetx@gmail.com>
 <20180603223654.23324-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180603223654.23324-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 04, 2018 at 01:36:50AM +0300, Dmitry Osipenko wrote:
> EMC has a dedicated interrupt that is used to notify about completion of
> HW operations. Document the interrupt property.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt        | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
