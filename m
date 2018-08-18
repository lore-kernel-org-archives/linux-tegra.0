From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 14/14] ARM: tegra: Enable SMMU for VDE on Tegra124
Date: Sat, 18 Aug 2018 15:45:41 +0300
Message-ID: <13580502.EC82852oeo@dimapc>
References: <20180813145027.16346-1-thierry.reding@gmail.com>
 <20180813145027.16346-15-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180813145027.16346-15-thierry.reding@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Monday, 13 August 2018 17:50:27 MSK Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The video decode engine can use the SMMU to use buffers that are not
> physically contiguous in memory. This allows better memory usage for
> video decoding, since fragmentation may cause contiguous allocations
> to fail.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra124.dtsi
> b/arch/arm/boot/dts/tegra124.dtsi index 8fdca4723205..0713e0ed5fef 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -321,6 +321,8 @@
>  		resets = <&tegra_car 61>,
>  			 <&tegra_car 63>;
>  		reset-names = "vde", "bsev";
> +
> +		iommus = <&mc TEGRA_SWGROUP_VDE>;
>  	};
> 
>  	apbdma: dma@60020000 {

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

The same should be applied to Tegra30.
