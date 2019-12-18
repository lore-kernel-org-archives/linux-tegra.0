From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 07/19] dt-bindings: soc: tegra-pmc: Add id for Tegra
 PMC 32KHz blink clock
Date: Wed, 18 Dec 2019 15:30:44 -0600
Message-ID: <20191218213044.GA20965@bogus>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
 <1576613046-17159-8-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1576613046-17159-8-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 17 Dec 2019 12:03:54 -0800, Sowjanya Komatineni wrote:
> Tegra PMC has blink functionality that allows 32KHz clock out to
> blink pin of the Tegra.
> 
> This patch adds id for this blink clock to use for enabling or
> disabling blink output through device tree.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  include/dt-bindings/soc/tegra-pmc.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
