From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] media: staging: tegra-vde: fix runtime pm imbalance on
 error
Date: Wed, 20 May 2020 13:15:44 +0300
Message-ID: <2b5d64f5-825f-c081-5d03-02655c2d9491@gmail.com>
References: <20200520095148.10995-1-dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200520095148.10995-1-dinghao.liu@zju.edu.cn>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

20.05.2020 12:51, Dinghao Liu пишет:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> index d3e63512a765..dd134a3a15c7 100644
> --- a/drivers/staging/media/tegra-vde/vde.c
> +++ b/drivers/staging/media/tegra-vde/vde.c
> @@ -777,7 +777,7 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
>  
>  	ret = pm_runtime_get_sync(dev);
>  	if (ret < 0)
> -		goto unlock;
> +		goto put_runtime_pm;
>  
>  	/*
>  	 * We rely on the VDE registers reset value, otherwise VDE
> 

Hello Dinghao,

Thank you for the patch. I sent out a similar patch a week ago [1].

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20200514210847.9269-2-digetx@gmail.com/

The pm_runtime_put_noidle() should have the same effect as yours
variant, although my variant won't change the last_busy RPM time, which
I think is a bit more appropriate behavior.
