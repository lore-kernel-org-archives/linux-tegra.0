From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 01/15] dt-bindings: arm: tegra: Remove duplicated
 Tegra30+ MC binding
Date: Thu, 1 Mar 2018 15:53:09 -0600
Message-ID: <20180301215309.v6gk77j4trwkpn7j@rob-hp-laptop>
References: <cover.1519141896.git.digetx@gmail.com>
 <0d1b4a840954796f319621e481ec1a90baee98cc.1519141896.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0d1b4a840954796f319621e481ec1a90baee98cc.1519141896.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 20, 2018 at 07:25:14PM +0300, Dmitry Osipenko wrote:
> There are two bindings for the same Memory Controller. One of the bindings
> became obsolete long time ago and probably was left unnoticed, remove it
> for consistency.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/arm/tegra/nvidia,tegra30-mc.txt           | 18 ------------------
>  1 file changed, 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-mc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
