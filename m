From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 30 Apr 2020 23:06:15 +0300
Message-ID: <eadf3a5a-f305-4561-10e1-1b9241b9c5c2@gmail.com>
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
> +		/*
> +		 * Source is not streaming if error is non-zero.
> +		 * So, do not dequeue buffers on error and let the thread sleep
> +		 * till kthread stop signal is received.
> +		 */
> +		wait_event_interruptible(chan->start_wait,
> +					 kthread_should_stop() ||
> +					 (!list_empty(&chan->capture) &&
> +					 !err));

...
> +static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
> +{
> +	struct tegra_vi_channel *chan = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct tegra_channel_buffer *buf = to_tegra_channel_buffer(vbuf);
> +
> +	/* put buffer into the capture queue */
> +	spin_lock(&chan->start_lock);
> +	list_add_tail(&buf->queue, &chan->capture);
> +	spin_unlock(&chan->start_lock);
> +
> +	/* wait up kthread for capture */
> +	wake_up_interruptible(&chan->start_wait);
> +}

The V4L doc says that buffers could be enqueued before streaming is
started. I guess it should be a trouble here, shouldn't it?

https://elixir.bootlin.com/linux/v5.7-rc3/source/include/media/videobuf2-core.h#L379
