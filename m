From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH] staging: tegra-video: fix V4L2 dependency
Date: Thu, 28 May 2020 15:16:55 -0700
Message-ID: <18bd4587-2dd9-dfae-110d-7dfa0378c84d@nvidia.com>
References: <20200527221327.3339232-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200527221327.3339232-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 5/27/20 3:13 PM, Arnd Bergmann wrote:
> Rather than using a dependency on VIDEO_V4L2, this driver uses
> "select", which fails when other dependencies are missing:
>
> WARNING: unmet direct dependencies detected for VIDEO_V4L2
>    Depends on [n]: MEDIA_SUPPORT [=y] && (I2C [=y] || I2C [=y]=n) && VIDEO_DEV [=n]
>    Selected by [y]:
>    - VIDEO_TEGRA [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && TEGRA_HOST1X [=y]
> (plus an endless stream of link errors for other drivers that
> depend on VIDEO_V4L2 but are now lacking their dependencies)
>
> Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/staging/media/tegra-video/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/staging/media/tegra-video/Kconfig
> index 3f03b5b39e6c..f6c61ec74386 100644
> --- a/drivers/staging/media/tegra-video/Kconfig
> +++ b/drivers/staging/media/tegra-video/Kconfig
> @@ -2,7 +2,7 @@
>   config VIDEO_TEGRA
>   	tristate "NVIDIA Tegra VI driver"
>   	depends on TEGRA_HOST1X
> -	select VIDEO_V4L2
> +	depends on VIDEO_V4L2
>   	select MEDIA_CONTROLLER
>   	select VIDEOBUF2_DMA_CONTIG
>   	help
Acked-by: Sowjanya Komatineni <skomatineni@nvidia.com>
