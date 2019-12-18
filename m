From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 01/19] dt-bindings: clock: tegra: Change CLK_M_DIV to
 OSC_DIV clocks
Date: Wed, 18 Dec 2019 15:19:04 -0600
Message-ID: <20191218211904.GA5303@bogus>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
 <1576613046-17159-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1576613046-17159-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 17 Dec 2019 12:03:48 -0800, Sowjanya Komatineni wrote:
> Tegra has no CLK_M_DIV2 and CLK_M_DIV4 clocks and instead it has
> OSC_DIV2 and OSC_DIV4 clocks from OSC pads.
> 
> This patch changes CLK_M_DIV2 and CLK_M_DIV4 clock ids to OSC_DIV2
> and OSC_DIV4 clock ids for Tegra30 through Tegra210.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra114-car.h        | 4 ++--
>  include/dt-bindings/clock/tegra124-car-common.h | 4 ++--
>  include/dt-bindings/clock/tegra210-car.h        | 4 ++--
>  include/dt-bindings/clock/tegra30-car.h         | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
