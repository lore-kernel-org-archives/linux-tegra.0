From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2 18/21] arm64: dts: tegra210-p2371-2180: enable DFLL
 clock
Date: Thu, 13 Dec 2018 13:11:45 +0000
Message-ID: <84fbfa0b-553e-72ee-23c6-e7772e75aaa8@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-19-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181213093438.29621-19-josephl@nvidia.com>
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


On 13/12/2018 09:34, Joseph Lo wrote:
> Enable DFLL clock for Jetson TX1 platform.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> *V2:
>  - remove non exist DT bindings
>  - update the PWM DT bindings accordingly
> ---
>  .../boot/dts/nvidia/tegra210-p2371-2180.dts   | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
> index 37e3c46e753f..99c016bfc601 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
> @@ -78,4 +78,25 @@
>  			};
>  		};
>  	};
> +
> +	clock@70110000 {
> +		status = "okay";
> +
> +		nvidia,cf = <6>;
> +		nvidia,ci = <0>;
> +		nvidia,cg = <2>;
> +		nvidia,droop-ctrl = <0x00000f00>;
> +		nvidia,force-mode = <1>;
> +		nvidia,sample-rate = <25000>;
> +
> +		nvidia,pwm-min-microvolts = <708000>;
> +		nvidia,pwm-period = <2500>; /* 2.5us */
> +		nvidia,pwm-to-pmic;
> +		nvidia,pwm-tristate-microvolts = <1000000>;
> +		nvidia,pwm-voltage-step-microvolts = <19200>;
> +
> +		pinctrl-names = "dvfs_pwm_enable", "dvfs_pwm_disable";
> +		pinctrl-0 = <&dvfs_pwm_active_state>;
> +		pinctrl-1 = <&dvfs_pwm_inactive_state>;
> +	};
>  };

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
