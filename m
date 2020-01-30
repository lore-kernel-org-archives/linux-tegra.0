From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/9] ASoC: tegra: add Tegra210 based AHUB driver
Date: Thu, 30 Jan 2020 20:09:41 +0300
Message-ID: <bd802f93-dd03-f39d-86e1-39f8571bbbb0@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1580380422-3431-6-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

30.01.2020 13:33, Sameer Pujar пишет:
...
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      ahub->soc_data->cmpnt_drv,
> +					      ahub->soc_data->dai_drv,
> +					      ahub->soc_data->num_dais);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to register component, err: %d\n",
> +			ret);
> +		return ret;
> +	}
In the the patch #4 ("ASoC: tegra: add Tegra210 based I2S driver") I see
the following:

	ret = devm_snd_soc_register_component(dev, &tegra210_i2s_cmpnt,
					tegra210_i2s_dais,
					ARRAY_SIZE(tegra210_i2s_dais));
	if (ret != 0) {
		dev_err(dev, "can't register I2S component, err: %d\n", ret);
		return ret;
	}

Please be consistent in regards to errors checking. The correct variant
should be: if (ret != 0). Usually error codes are a negative value, but
it is much safer to check whether value isn't 0 in all cases where
positive value isn't expected to happen.

I'd also recommend to rename all "ret" variables to "err" everywhere in
the code where returned value is used only for errors checking. This
will make code more explicit, and hence, easier to read and follow.

So, it will be nicer to write it as:

	err = devm_snd_soc_register_component(&pdev->dev,
					ahub->soc_data->cmpnt_drv,
					ahub->soc_data->dai_drv,
					ahub->soc_data->num_dais);
	if (err) {
		dev_err(&pdev->dev, "failed to register component: %d\n", err);
		return err;
	}
