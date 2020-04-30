From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 30 Apr 2020 16:56:44 +0300
Message-ID: <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1588197606-32124-7-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

30.04.2020 01:00, Sowjanya Komatineni пишет:
> +static int chan_capture_kthread_finish(void *data)
> +{
> +	struct tegra_vi_channel *chan = data;
> +	struct tegra_channel_buffer *buf;
> +
> +	set_freezable();
> +
> +	while (1) {
> +		try_to_freeze();

I guess it won't be great to freeze in the middle of a capture process, so:
		if (list_empty(&chan->done))
			try_to_freeze();

> +		wait_event_interruptible(chan->done_wait,
> +					 !list_empty(&chan->done) ||
> +					 kthread_should_stop());
> +
> +		/* dequeue buffers and finish capture */
> +		buf = dequeue_buf_done(chan);
> +		while (buf) {
> +			tegra_channel_capture_done(chan, buf);
> +			buf = dequeue_buf_done(chan);
> +		}
> +
> +		if (kthread_should_stop())
> +			break;
> +	}
> +
> +	return 0;
> +}
