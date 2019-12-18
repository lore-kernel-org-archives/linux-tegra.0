From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 10/19] dt-bindings: clock: tegra: Remove pmc clock ids
 from clock dt-bindings
Date: Wed, 18 Dec 2019 15:32:09 -0600
Message-ID: <20191218213209.GA22981@bogus>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
 <1576613046-17159-11-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1576613046-17159-11-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 17 Dec 2019 12:03:57 -0800, Sowjanya Komatineni wrote:
> clk_out_1, clk_out_2, clk_out_3, blink are part of Tegra PMC block and
> these clocks are moved to Tegra PMC driver with pmc as clock provider
> and uses clock ids from dt-bindings/soc/tegra-pmc.h
> 
> So, this patch removes ids for these clocks from Tegra clock dt-bindings.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra114-car.h        | 14 +++++++-------
>  include/dt-bindings/clock/tegra124-car-common.h | 14 +++++++-------
>  include/dt-bindings/clock/tegra20-car.h         |  2 +-
>  include/dt-bindings/clock/tegra210-car.h        | 14 +++++++-------
>  include/dt-bindings/clock/tegra30-car.h         | 14 +++++++-------
>  5 files changed, 29 insertions(+), 29 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
