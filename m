From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 30 Apr 2020 16:34:50 +0300
Message-ID: <18d457dd-17cb-633e-cdec-e0abfe73b0b0@gmail.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.04.2020 01:00, Sowjanya Komatineni пишет:
> +static int tegra_csi_init(struct host1x_client *client)
> +{
> +	struct tegra_csi *csi = host1x_client_to_csi(client);
> +	struct tegra_video_device *vid = dev_get_drvdata(client->host);
> +	int ret;
> +
> +	INIT_LIST_HEAD(&csi->csi_chans);
> +
> +	ret = tegra_csi_tpg_channels_alloc(csi);
> +	if (ret < 0) {
> +		dev_err(csi->dev,
> +			"failed to allocate tpg channels: %d\n", ret);
> +		goto cleanup;
> +	}
> +
> +	ret = tegra_csi_channels_init(csi);
> +	if (ret < 0)
> +		goto cleanup;
> +
> +	vid->csi = csi;
> +
> +	return 0;
> +
> +cleanup:
> +	tegra_csi_channels_cleanup(csi);
> +	pm_runtime_put_sync(csi->dev);

This pm_runtime_put_sync() should be removed.

> +	return ret;
> +}
