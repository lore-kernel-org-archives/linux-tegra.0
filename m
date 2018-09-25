From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 28/37] ARM: tegra: colibri_t20: simplify model and
 compatible properties
Date: Tue, 25 Sep 2018 14:03:13 -0500
Message-ID: <20180925185028.GA25151@bogus>
References: <20180902100906.25792-1-marcel@ziswiler.com>
 <20180902100906.25792-29-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180902100906.25792-29-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

On Sun,  2 Sep 2018 12:08:57 +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Simplify model and compatible by dropping the 256/512 MB from the model
> and -512 from the compatible properties to be more in-line with all our
> other device trees.
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
> Changes in v2:
> - Also reflect this change in the Iris device tree.
> - Also reflect this change in the device tree bindings documentation.
> 
>  Documentation/devicetree/bindings/arm/tegra.txt | 2 +-
>  arch/arm/boot/dts/tegra20-colibri-iris.dts      | 4 ++--
>  arch/arm/boot/dts/tegra20-colibri.dtsi          | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
