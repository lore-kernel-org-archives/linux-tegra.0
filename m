From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
Date: Fri, 24 Apr 2020 02:16:06 +0300
Message-ID: <7e473fa9-0409-d868-e818-2e7928a8acca@gmail.com>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

22.04.2020 09:18, Sowjanya Komatineni пишет:
> +static int chan_capture_kthread_start(void *data)
> +{
> +	struct tegra_vi_channel *chan = data;
> +	struct tegra_channel_buffer *buf;
> +	int err = 0;
> +
> +	set_freezable();
> +
> +	while (1) {
> +		try_to_freeze();
> +
> +		wait_event_interruptible(chan->start_wait,
> +					 !list_empty(&chan->capture) ||
> +					 kthread_should_stop());
> +
> +		if (kthread_should_stop())
> +			break;
> +
> +		/*
> +		 * Source is not streaming if error is non-zero.
> +		 * So, do not dequeue buffers on capture error.
> +		 */
> +		if (err)
> +			continue;

This will result in an endless loop, I suppose it wasn't the intention.
