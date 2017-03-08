From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 08/11] arm64: tegra: Enable current monitors on P3310
Date: Wed, 8 Mar 2017 11:52:58 +0000
Message-ID: <7fcedcdb-8841-3afa-c5f3-0581a5350b21@nvidia.com>
References: <20170223173053.19701-1-thierry.reding@gmail.com>
 <20170223173053.19701-8-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170223173053.19701-8-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 23/02/17 17:30, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The P3310 processor module contains two current monitors that can be
> used to determine the current flow across various parts of the board
> design.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> index b18e166527d8..a1cb6b35314e 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> @@ -56,6 +56,16 @@
>  
>  	i2c@3160000 {
>  		status = "okay";
> +
> +		power-monitor@40 {
> +			compatible = "ti,ina3221";
> +			reg = <0x40>;
> +		};
> +
> +		power-monitor@41 {
> +			compatible = "ti,ina3221";
> +			reg = <0x41>;
> +		};
>  	};
>  
>  	i2c@3180000 {
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
