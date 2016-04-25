From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: cros_ec: Enable cros-ec driver for arm64
Date: Mon, 25 Apr 2016 11:50:56 +0100
Message-ID: <20160425105056.GD20365@dell>
References: <1460662671-13221-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460662671-13221-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Simon Glass <sjg@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 14 Apr 2016, Rhyland Klein wrote:

> The cros-ec driver should also be enabled for arm64 platforms as ther=
e
> are platforms, like the tegra210-smaug which make use of the ChromeOS
> Embedded Controller.
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/mfd/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index eea61e349e26..1d63c5fb3f3c 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -134,7 +134,7 @@ config MFD_CROS_EC
>  	select MFD_CORE
>  	select CHROME_PLATFORMS
>  	select CROS_EC_PROTO
> -	depends on X86 || ARM || COMPILE_TEST
> +	depends on X86 || ARM || ARM64 || COMPILE_TEST
>  	help
>  	  If you say Y here you get support for the ChromeOS Embedded
>  	  Controller (EC) providing keyboard, battery and power services.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
