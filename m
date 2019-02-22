From: Bo Yan <byan@nvidia.com>
Subject: Re: [PATCH V3] arm64: tegra: add topology data for Tegra194 cpu
Date: Thu, 21 Feb 2019 16:52:21 -0800
Message-ID: <c70c91f6-b719-cb86-2fe1-e6231c089ce9@nvidia.com>
References: <20190213081252.GA647@ulmo>
 <1550075622-1072-1-git-send-email-byan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550075622-1072-1-git-send-email-byan@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The patch V3 adopted changes suggested by Thierry.


On 2/13/19 8:33 AM, Bo Yan wrote:
> The xavier CPU architecture includes 8 CPU cores organized in
> 4 clusters. Add cpu-map data for topology initialization, this
> fixes the topology information in
> /sys/devices/system/cpu/cpu[n]/topology
> 
> Signed-off-by: Bo Yan <byan@nvidia.com>
> ---
> V3: Replaced phandles with full path to CPU node
> V2: remove cache nodes, add topology data only
> 
>   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 42 ++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index 6dfa1ca..708d20c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -870,6 +870,48 @@
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&{/cpus/cpu@0}>;
> +				};
> +
> +				core1 {
> +					cpu = <&{/cpus/cpu@1}>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&{/cpus/cpu@2}>;
> +				};
> +
> +				core1 {
> +					cpu = <&{/cpus/cpu@3}>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu = <&{/cpus/cpu@4}>;
> +				};
> +
> +				core1 {
> +					cpu = <&{/cpus/cpu@5}>;
> +				};
> +			};
> +
> +			cluster3 {
> +				core0 {
> +					cpu = <&{/cpus/cpu@6}>;
> +				};
> +
> +				core1 {
> +					cpu = <&{/cpus/cpu@7}>;
> +				};
> +			};
> +		};
> +
>   		cpu@0 {
>   			compatible = "nvidia,tegra194-carmel", "arm,armv8";
>   			device_type = "cpu";
> 
