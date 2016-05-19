From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Thu, 19 May 2016 13:20:02 -0400
Message-ID: <be290567-3111-40cb-f118-ddc3d65deec5@nvidia.com>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 5/3/2016 11:45 AM, Rhyland Klein wrote:
> Enable the ChromeOS Embedded Controller, its I2C tunnel driver, and
> the BA27XXX battery driver. These are all used on the Tegra210 Smaug
> platform.
> 
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>

Has anyone had a chance to review this yet?

-rhyland

> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 53f7ded14efb..043fab2d2c53 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -174,6 +174,7 @@ CONFIG_I2C_QUP=y
>  CONFIG_I2C_TEGRA=y
>  CONFIG_I2C_UNIPHIER_F=y
>  CONFIG_I2C_RCAR=y
> +CONFIG_I2C_CROS_EC_TUNNEL=y
>  CONFIG_SPI=y
>  CONFIG_SPI_PL022=y
>  CONFIG_SPI_QUP=y
> @@ -188,6 +189,7 @@ CONFIG_GPIO_PL061=y
>  CONFIG_GPIO_RCAR=y
>  CONFIG_GPIO_XGENE=y
>  CONFIG_POWER_RESET_MSM=y
> +CONFIG_BATTERY_BQ27XXX=y
>  CONFIG_POWER_RESET_XGENE=y
>  CONFIG_POWER_RESET_SYSCON=y
>  CONFIG_SENSORS_LM90=m
> @@ -199,6 +201,8 @@ CONFIG_MFD_SPMI_PMIC=y
>  CONFIG_MFD_SEC_CORE=y
>  CONFIG_MFD_HI655X_PMIC=y
>  CONFIG_REGULATOR=y
> +CONFIG_MFD_CROS_EC=y
> +CONFIG_MFD_CROS_EC_I2C=y
>  CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_REGULATOR_HI655X=y
>  CONFIG_REGULATOR_QCOM_SMD_RPM=y
> 


-- 
nvpublic
