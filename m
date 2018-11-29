From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ARM: tegra: Add VIC on Tegra124
Date: Thu, 29 Nov 2018 13:34:42 +0000
Message-ID: <a47ff2c3-e884-ed04-f64f-fe3b84778738@nvidia.com>
References: <20181123120403.16244-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181123120403.16244-1-thierry.reding@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 23/11/2018 12:04, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Video Image Compositor can be used to perform a variety of image
> operations. Add a device tree node for it, so that it can be exposed
> as a host1x channel to userspace.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
> index 183c5acafb22..b113e47b2b2a 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -140,6 +140,18 @@
>  			status = "disabled";
>  		};
>  
> +		vic@54340000 {
> +			compatible = "nvidia,tegra124-vic";
> +			reg = <0x0 0x54340000 0x0 0x00040000>;
> +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&tegra_car TEGRA124_CLK_VIC03>;
> +			clock-names = "vic";
> +			resets = <&tegra_car 178>;
> +			reset-names = "vic";
> +
> +			iommus = <&mc TEGRA_SWGROUP_VIC>;
> +		};
> +
>  		sor@54540000 {
>  			compatible = "nvidia,tegra124-sor";
>  			reg = <0x0 0x54540000 0x0 0x00040000>;
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
