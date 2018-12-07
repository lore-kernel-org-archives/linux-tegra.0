From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 14/19] arm64: dts: tegra210: add CPU clocks
Date: Fri, 7 Dec 2018 14:54:50 +0000
Message-ID: <5835991a-50aa-1fd2-f9c5-53238a38c993@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-15-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204092548.3038-15-josephl@nvidia.com>
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
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> Add CPU clocks for Tegra210.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index a6db62157442..e2baf52fe1af 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -1304,6 +1304,12 @@
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a57";
>  			reg = <0>;
> +			clocks = <&tegra_car TEGRA210_CLK_CCLK_G>,
> +				 <&tegra_car TEGRA210_CLK_PLL_X>,
> +				 <&tegra_car TEGRA210_CLK_PLL_P_OUT4>,
> +				 <&dfll>;
> +			clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
> +			clock-latency = <300000>;
>  		};
>  
>  		cpu@1 {
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
