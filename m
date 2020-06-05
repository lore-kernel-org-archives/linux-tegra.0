From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] media: staging: tegra-vde: add missing
 pm_runtime_put_autosuspend
Date: Fri, 5 Jun 2020 07:00:47 +0100
Message-ID: <7061eb81-c00c-9978-5e4b-f9896c0ffd5e@nvidia.com>
References: <20200602054841.15746-1-navid.emamdoost@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200602054841.15746-1-navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: emamd001-OJFnDUYgAso@public.gmane.org, wu000273-OJFnDUYgAso@public.gmane.org, kjlu-OJFnDUYgAso@public.gmane.org, smccaman-OJFnDUYgAso@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 02/06/2020 06:48, Navid Emamdoost wrote:
> Call to pm_runtime_get_sync increments counter even in case of
> failure leading to incorrect ref count.
> Call pm_runtime_put_autosuspend if pm_runtime_get_sync fails.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> index d3e63512a765..52cdd4a91e93 100644
> --- a/drivers/staging/media/tegra-vde/vde.c
> +++ b/drivers/staging/media/tegra-vde/vde.c
> @@ -776,8 +776,10 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
>  		goto release_dpb_frames;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_autosuspend(dev);
>  		goto unlock;
> +	}
>  
>  	/*
>  	 * We rely on the VDE registers reset value, otherwise VDE

Please use the put in the error path.

Jon

-- 
nvpublic
