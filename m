From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 06/21] dt-bindings: tegra: Convert Tegra PMC bindings
 to YAML
Date: Mon, 13 Jan 2020 16:30:11 -0600
Message-ID: <20200113223011.GA18406@bogus>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <1578457515-3477-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1578457515-3477-7-git-send-email-skomatineni@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
Cc: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 7 Jan 2020 20:25:00 -0800, Sowjanya Komatineni wrote:
> This patch converts text based Tegra PMC bindings document to YAML
> schema for performing dt validation.
> 
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 ------------------
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 340 +++++++++++++++++++++
>  2 files changed, 340 insertions(+), 300 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
