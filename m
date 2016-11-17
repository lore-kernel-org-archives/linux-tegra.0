From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 8/9] arm64: tegra: Enable PSCI on P3310
Date: Thu, 17 Nov 2016 17:21:34 +0000
Message-ID: <786f354d-a1f2-f2c6-fde7-7b1af3df756c@arm.com>
References: <20161117171131.20062-1-thierry.reding@gmail.com>
 <20161117171131.20062-8-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161117171131.20062-8-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 17/11/16 17:11, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The P3310 processor module comes ships with a firmware that implements
> PSCI 1.0. Enable and use it to bring up all CPUs.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 36 ++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> index 807af7b68761..2c158c6809a5 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> @@ -26,7 +26,43 @@
>  		status = "okay";
>  	};
>
> +	cpus {
> +		cpu@0 {
> +			enable-method = "psci";
> +		};
> +
> +		cpu@1 {
> +			enable-method = "psci";
> +		};
> +
> +		cpu@2 {
> +			enable-method = "psci";
> +		};
> +
> +		cpu@3 {
> +			enable-method = "psci";
> +		};
> +
> +		cpu@4 {
> +			enable-method = "psci";
> +		};
> +
> +		cpu@5 {
> +			enable-method = "psci";
> +		};
> +	};
> +
>  	bpmp {
>  		status = "okay";
>  	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		status = "okay";
> +		method = "smc";

[...]

> +
> +		cpu_off = <0x84000002>;
> +		cpu_on = <0xc4000003>;
> +		cpu_suspend = <0xc4000001>;

These are applicable only for "arm,psci"(i.e. PSCI v0.1), so you need to
drop them.

-- 
Regards,
Sudeep
