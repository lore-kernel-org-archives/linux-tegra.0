From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v7 6/9] media: tegra: Add Tegra210 Video input driver
Date: Wed, 15 Apr 2020 17:22:26 +0300
Message-ID: <4118112f-f865-5460-6319-d71271fd78d1@gmail.com>
References: <1586919463-30542-1-git-send-email-skomatineni@nvidia.com>
 <1586919463-30542-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1586919463-30542-7-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

15.04.2020 05:57, Sowjanya Komatineni пишет:
> +static int tegra_csi_remove(struct platform_device *pdev)
> +{
> +	struct tegra_csi *csi = platform_get_drvdata(pdev);
> +	int err;
> +
> +	err = host1x_client_unregister(&csi->client);
> +	if (err < 0) {
> +		dev_err(csi->dev,
> +			"failed to unregister host1x client: %d\n", err);
> +		return err;
> +	}
> +
> +	pm_runtime_disable(csi->dev);
> +	kfree(csi);

IIRC, the driver removal is invoked on the unbinding. Hence, I'm not
sure how moving away from the resource-managed API helps here. Could you
please explain in a more details?

Have you tried to test this driver under KASAN? I suspect that you just
masked the problem, instead of fixing it.
