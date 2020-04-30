From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 30 Apr 2020 16:43:10 +0300
Message-ID: <5d559a5a-ac84-f128-ccea-270974560b58@gmail.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.04.2020 01:00, Sowjanya Komatineni пишет:
> +void tegra_channel_release_buffers(struct tegra_vi_channel *chan,
> +				   enum vb2_buffer_state state)
> +{
> +	struct tegra_channel_buffer *buf, *nbuf;
> +
> +	spin_lock(&chan->start_lock);
> +	list_for_each_entry_safe(buf, nbuf, &chan->capture, queue) {
> +		vb2_buffer_done(&buf->buf.vb2_buf, state);
> +		list_del(&buf->queue);
> +	}
> +

I'd remove this blank line to make lock/unlock block more human-readable.

> +	spin_unlock(&chan->start_lock);
> +
> +	spin_lock(&chan->done_lock);
> +	list_for_each_entry_safe(buf, nbuf, &chan->done, queue) {
> +		vb2_buffer_done(&buf->buf.vb2_buf, state);
> +		list_del(&buf->queue);
> +	}
> +

And thins line too.

> +	spin_unlock(&chan->done_lock);
> +}
