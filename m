From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 23:02:40 +0300
Message-ID: <782c8c4e-f5c2-d75e-0410-757172dd3090@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.04.2020 04:25, Sowjanya Komatineni пишет:
...
> +static int chan_capture_kthread_start(void *data)
> +{
> +	struct tegra_vi_channel *chan = data;
> +	struct tegra_channel_buffer *buf;
> +	int err = 0;
> +	int caps_inflight;
> +
> +	set_freezable();
> +
> +	while (1) {
> +		try_to_freeze();
> +
> +		wait_event_interruptible(chan->start_wait,
> +					 !list_empty(&chan->capture) ||
> +					 kthread_should_stop());

Is it really okay that list_empty() isn't protected with a lock?

Why wait_event is "interruptible"?

> +		/*
> +		 * Frame start and MW_ACK_DONE syncpoint condition FIFOs are
> +		 * of max depth 2. So make sure max 2 capture requests are
> +		 * in process by the hardware at a time.
> +		 */
> +		while (!(kthread_should_stop() || list_empty(&chan->capture))) {
> +			caps_inflight = chan->capture_reqs - chan->sequence;
> +			/*
> +			 * Source is not streaming if error is non-zero.
> +			 * So, do not dequeue buffers on capture error or when
> +			 * syncpoint requests in FIFO are full.
> +			 */
> +			if (err || caps_inflight >= SYNCPT_FIFO_DEPTH)
> +				break;
> +
> +			/* dequeue the buffer and start capture */
> +			spin_lock(&chan->start_lock);
> +			if (list_empty(&chan->capture))
> +				break;
> +			buf = list_entry(chan->capture.next,
> +					 struct tegra_channel_buffer, queue);

list_first_entry()

> +			list_del_init(&buf->queue);
> +			spin_unlock(&chan->start_lock);
> +
> +			err = tegra_channel_capture_frame(chan, buf);
> +			if (err)
> +				vb2_queue_error(&chan->queue);
> +		}
> +
> +		if (kthread_should_stop())
> +			break;
> +	}
> +
> +	return 0;
> +}
