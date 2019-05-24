From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/4] dt-binding: Tegra194 pinctrl support
Date: Fri, 24 May 2019 15:19:08 -0500
Message-ID: <20190524201908.GA13368@bogus>
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: linus.walleij@linaro.org, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, pdeschrijver@nvidia.com, josephl@nvidia.com, smangipudi@nvidia.com, ldewangan@nvidia.com, vidyas@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Thu, May 16, 2019 at 05:23:11PM +0530, Krishna Yarlagadda wrote:
> Add binding doc for Tegra 194 pinctrl driver
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
> Changes in V3:
> remove optional fields not supported by pins published here
> 
>  .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    | 107 +++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt

Reviewed-by: Rob Herring <robh@kernel.org>
