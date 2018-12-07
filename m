From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 15/19] arm64: dts: tegra210-p2597: add pinmux for
 PWM-based DFLL support
Date: Fri, 7 Dec 2018 14:55:33 +0000
Message-ID: <42aa5b73-cd1f-5a2f-249f-589bb1319fc0@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-16-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204092548.3038-16-josephl@nvidia.com>
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
> Add pinmux for PWM-based DFLL support.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> index 365726ddd418..db5dc0ad466d 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> @@ -1278,6 +1278,20 @@
>  				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
>  			};
>  		};
> +
> +		dvfs_pwm_active_state: dvfs_pwm_active {
> +			dvfs_pwm_pbb1 {
> +				nvidia,pins = "dvfs_pwm_pbb1";
> +				nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +			};
> +		};
> +
> +		dvfs_pwm_inactive_state: dvfs_pwm_inactive {
> +			dvfs_pwm_pbb1 {
> +				nvidia,pins = "dvfs_pwm_pbb1";
> +				nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +			};
> +		};
>  	};
>  
>  	pwm@7000a000 {
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
