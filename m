From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: Disable XUSB support on Jetson TX2
Date: Wed, 8 May 2019 11:53:48 +0100
Message-ID: <cb8cb5e8-a4f3-4009-fd89-853040d6b2cd@nvidia.com>
References: <20190506164121.4507-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190506164121.4507-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bitan Biswas <bbiswas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 06/05/2019 17:41, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The recently introduced XUSB support for Jetson TX2 is causing boot, CPU
> hotplug and suspend/resume failures according to several reports.
> 
> Temporarily work around this by disabling the XUSB controller and XUSB
> pad controller nodes in device tree, while we figure out what's causing
> this.
> 
> Reported-by: Bitan Biswas <bbiswas@nvidia.com>
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> index 75ee6cf1e1b4..14d7fea82daf 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> @@ -59,7 +59,7 @@
>  	};
>  
>  	padctl@3520000 {
> -		status = "okay";
> +		status = "disabled";
>  
>  		avdd-pll-erefeut-supply = <&vdd_1v8_pll>;
>  		avdd-usb-supply = <&vdd_3v3_sys>;
> @@ -137,7 +137,7 @@
>  	};
>  
>  	usb@3530000 {
> -		status = "okay";
> +		status = "disabled";
>  
>  		phys = <&{/padctl@3520000/pads/usb2/lanes/usb2-0}>,
>  		       <&{/padctl@3520000/pads/usb2/lanes/usb2-1}>,
> 

Thanks.

Tested-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
