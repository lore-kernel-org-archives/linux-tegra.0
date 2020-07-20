From: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: tegra: Add the GPU on Tegra194
Date: Mon, 20 Jul 2020 10:29:03 -0700
Message-ID: <de024331-cc7a-42ac-6b03-4ac8eb3af351@nvidia.com>
References: <20200716143341.545804-1-thierry.reding@gmail.com>
 <20200716143341.545804-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200716143341.545804-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Debarshi Dutta <ddutta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 7/16/2020 7:33 AM, Thierry Reding wrote:
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index 98c366ab4aab..14da0793be69 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1395,6 +1395,39 @@ sor3: sor@15bc0000 {
>   				nvidia,interface = <3>;
>   			};
>   		};
> +
> +		gpu@17000000 {
> +			compatible = "nvidia,gv11b";
> +			reg = <0x17000000 0x10000000>,
> +			      <0x18000000 0x10000000>;

Hi,

I noticed a typo here. The sizes of the resources have one zero too 
many. Should be 0x1000000.

Terje
