From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH RESEND V2] ARM64: config: Enable MAX77620 pinctrl/gpio/rtc
 for Tegra210 P2180
Date: Wed, 22 Jun 2016 10:20:17 +0100
Message-ID: <576A5851.1070106@nvidia.com>
References: <1466143556-31849-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1466143556-31849-1-git-send-email-ldewangan@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laxman Dewangan <ldewangan@nvidia.com>, catalin.marinas@arm.com, will.deacon@arm.com, treding@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 17/06/16 07:05, Laxman Dewangan wrote:
> NVIDIA's Tegra210 Jetson platform (P2180) uses the MAX77620 as PMIC.
> Enable GPIO, Pincontrol and RTC driver for this device.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> Changes from V1:
> - MFD and regulator is already enabled, enabling remaining driver.
> 
> Resending to linux-tegra group also.
> 
> 
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 9af9ba5..90a6705 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -186,6 +186,7 @@ CONFIG_SPI_QUP=y
>  CONFIG_SPI_SPIDEV=m
>  CONFIG_SPMI=y
>  CONFIG_PINCTRL_SINGLE=y
> +CONFIG_PINCTRL_MAX77620=y
>  CONFIG_PINCTRL_MSM8916=y
>  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>  CONFIG_GPIO_SYSFS=y
> @@ -194,6 +195,7 @@ CONFIG_GPIO_PL061=y
>  CONFIG_GPIO_RCAR=y
>  CONFIG_GPIO_XGENE=y
>  CONFIG_GPIO_PCA953X=m
> +CONFIG_GPIO_MAX77620=y
>  CONFIG_POWER_RESET_MSM=y
>  CONFIG_POWER_RESET_XGENE=y
>  CONFIG_POWER_RESET_SYSCON=y
> @@ -274,6 +276,7 @@ CONFIG_LEDS_TRIGGERS=y
>  CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>  CONFIG_LEDS_TRIGGER_CPU=y
>  CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_MAX77686=y
>  CONFIG_RTC_DRV_S5M=y
>  CONFIG_RTC_DRV_DS3232=y
>  CONFIG_RTC_DRV_EFI=y

We need this for Tegra210 Smaug as well.

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
