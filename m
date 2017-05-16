From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v2] drm/tegra: Correct idr_alloc() minimum id
Date: Tue, 16 May 2017 11:11:00 +0300
Message-ID: <bc098362-1861-8f93-f00a-f51e67b61a37@kapsi.fi>
References: <20170514204734.22130-1-digetx@gmail.com>
 <20170514204734.22130-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170514204734.22130-4-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 14.05.2017 23:47, Dmitry Osipenko wrote:
> The client ID 0 is reserved by the host1x/cdma to mark the timeout timer
> work as already been scheduled and context ID is used as the clients one.
> This fixes spurious CDMA timeouts.
>
> Fixes: bdd2f9cd10eb ("drm/tegra: Don't leak kernel pointer to userspace")
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>
> v2: Changed the commit description, now explains the cause of CDMA timeouts.
>
>  drivers/gpu/drm/tegra/drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index c5844a065681..489cb32453f7 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -548,7 +548,7 @@ static int tegra_client_open(struct tegra_drm_file *fpriv,
>  	if (err < 0)
>  		return err;
>
> -	err = idr_alloc(&fpriv->contexts, context, 0, 0, GFP_KERNEL);
> +	err = idr_alloc(&fpriv->contexts, context, 1, 0, GFP_KERNEL);
>  	if (err < 0) {
>  		client->ops->close_channel(context);
>  		return err;
>
