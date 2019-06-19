From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 3/4] arm64: tegra: Add ID EEPROM for Jetson TX1 module
Date: Wed, 19 Jun 2019 11:36:45 +0100
Message-ID: <ad6680d4-e9d7-f8f9-e7db-bb9e2845d9cd@nvidia.com>
References: <20190613165331.8689-1-thierry.reding@gmail.com>
 <20190613165331.8689-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190613165331.8689-3-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 13/06/2019 17:53, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> There is an ID EEPROM in the Jetson TX1 module that stores various bits
> of information to indentify the module. Add the device tree node so that
> operating systems can access this EEPROM.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> index 4dcd0d36189a..e8654061ce03 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> @@ -264,6 +264,19 @@
>  		};
>  	};
>  
> +	i2c@7000c500 {
> +		/* module ID EEPROM */
> +		eeprom@50 {
> +			compatible = "atmel,24c02";
> +			reg = <0x50>;
> +
> +			address-bits = <8>;
> +			page-size = <8>;
> +			size = <256>;
> +			read-only;
> +		};
> +	};
> +
>  	pmc@7000e400 {
>  		nvidia,invert-interrupt;
>  	};
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
