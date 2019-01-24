From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 3/6] arm64: dts: tegra210: fix timer node
Date: Thu, 24 Jan 2019 11:16:12 +0000
Message-ID: <867b5168-e3cb-6423-b3d2-c075d1701c88@nvidia.com>
References: <20190107032810.13522-1-josephl@nvidia.com>
 <20190107032810.13522-4-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190107032810.13522-4-josephl@nvidia.com>
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
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 07/01/2019 03:28, Joseph Lo wrote:
> Fix timer node to make it work with Tegra210 timer driver. And backward
> compatible with the Tegra watchdog driver.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index b5858b5ea052..143bd103c923 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -384,14 +384,12 @@
>  	};
>  
>  	timer@60005000 {
> -		compatible = "nvidia,tegra210-timer", "nvidia,tegra20-timer";
> +		compatible = "nvidia,tegra210-timer", "nvidia,tegra30-timer";
>  		reg = <0x0 0x60005000 0x0 0x400>;
> -		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&tegra_car TEGRA210_CLK_TIMER>;
>  		clock-names = "timer";
>  	};

Hmmm ... I can't say I understand this. So now the timer devices are
compatible with two different drivers?

Begs the question why did we not just extend the existing tegra20-timer
rather than adding a new one?

Also you did not explain why we make them compatible with the watchdog
driver? We have other watchdogs timer and so why do we need to make them
compatible?

Cheers
Jon

-- 
nvpublic
