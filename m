From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 04/11] arm64: tegra: Enable I2C controllers on P3310
Date: Tue, 7 Mar 2017 10:38:39 +0000
Message-ID: <7b24fc3d-6b4f-7f26-4bff-4ffd4f38fb5d@nvidia.com>
References: <20170223173053.19701-1-thierry.reding@gmail.com>
 <20170223173053.19701-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170223173053.19701-4-thierry.reding@gmail.com>
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
> The P3310 processor modules use seven I2C controllers for various
> peripherals.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 40 +++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> index 3653d0dd5f4f..762f4756346c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> @@ -6,6 +6,14 @@
>  
>  	aliases {
>  		serial0 = &uarta;
> +		i2c0 = "/bpmp/i2c";
> +		i2c1 = "/i2c@3160000";
> +		i2c2 = "/i2c@c240000";
> +		i2c3 = "/i2c@3180000";
> +		i2c4 = "/i2c@3190000";
> +		i2c5 = "/i2c@31c0000";
> +		i2c6 = "/i2c@c250000";
> +		i2c7 = "/i2c@31e0000";

Does it matter that these aliases do not align with the TRM numbering? I
know that if we did it would create holes but I was not sure if that
would be clearer?

>  	};
>  
>  	chosen {
> @@ -22,10 +30,38 @@
>  		status = "okay";
>  	};
>  
> +	i2c@3160000 {
> +		status = "okay";
> +	};
> +
> +	i2c@3180000 {
> +		status = "okay";
> +	};
> +
> +	i2c@3190000 {
> +		status = "okay";
> +	};
> +
> +	i2c@31c0000 {
> +		status = "okay";
> +	};
> +
> +	i2c@31e0000 {
> +		status = "okay";
> +	};
> +
>  	hsp@3c00000 {
>  		status = "okay";
>  	};
>  
> +	i2c@c240000 {
> +		status = "okay";
> +	};
> +
> +	i2c@c250000 {
> +		status = "okay";
> +	};
> +
>  	pmc@c360000 {
>  		nvidia,invert-interrupt;
>  	};
> @@ -57,7 +93,9 @@
>  	};
>  
>  	bpmp {
> -		status = "okay";
> +		i2c {
> +			status = "okay";
> +		};
>  	};
>  
>  	psci {
> 

Otherwise ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
