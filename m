From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v1 3/5] media: tegra-video: Move PM runtime handle to
 streaming
Date: Tue, 28 Apr 2020 16:59:30 +0300
Message-ID: <631390cb-9aff-0e3f-6c39-81d6c565987e@gmail.com>
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
 <1588047650-29402-4-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1588047650-29402-4-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

28.04.2020 07:20, Sowjanya Komatineni пишет:
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
> index b3dd0c3..29ccdae 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -272,8 +272,25 @@ static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
>  	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
>  	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>  	struct tegra_csi *csi = csi_chan->csi;
> +	int ret;
> +
> +	if (enable && atomic_add_return(1, &csi->clk_refcnt) == 1) {
> +		ret = pm_runtime_get_sync(csi->dev);
> +		if (ret < 0) {
> +			dev_err(csi->dev,
> +				"failed to get runtime PM: %d\n", ret);
> +			pm_runtime_put_noidle(csi->dev);
> +			atomic_dec(&csi->clk_refcnt);
> +			return ret;
> +		}
> +	}
> +
> +	ret = csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
>  
> -	return csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
> +	if ((ret < 0 || !enable) && atomic_dec_and_test(&csi->clk_refcnt))
> +		pm_runtime_put_sync(csi->dev);

Runtime PM maintains its own refcount, why these
clk_refcnt/power_on_refcnt are needed?
