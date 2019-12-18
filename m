From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 19/19] ASoC: nau8825: change Tegra clk_out_2 provider
 from tegra_car to pmc
Date: Wed, 18 Dec 2019 15:32:45 -0600
Message-ID: <20191218213245.GA23867@bogus>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
 <1576613046-17159-20-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1576613046-17159-20-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 17 Dec 2019 12:04:06 -0800, Sowjanya Komatineni wrote:
> Tegra clk_out_1, clk_out_2, and clk_out_3 are part of PMC block and
> these clocks are moved from clock drvier to pmc driver with pmc as
> a provider for these clocks.
> 
> Update bindings document to use pmc as clock provider for clk_out_2 and
> change id to pmc clock id.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  Documentation/devicetree/bindings/sound/nau8825.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
