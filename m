From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 22:48:00 +0300
Message-ID: <0809c1ae-57c9-508e-2959-724acc4ae068@gmail.com>
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
> +static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
> +				       struct tegra_channel_buffer *buf)
> +{
> +	int err = 0;
> +	u32 thresh, value, frame_start, mw_ack_done;
> +	int bytes_per_line = chan->format.bytesperline;
> +
> +	/* program buffer address by using surface 0 */
> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_MSB,
> +		     (u64)buf->addr >> 32);
> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_LSB, buf->addr);
> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_STRIDE, bytes_per_line);
> +
> +	/*
> +	 * Tegra VI block interacts with host1x syncpt for synchronizing
> +	 * programmed condition of capture state and hardware operation.
> +	 * Frame start and Memory write acknowledge syncpts has their own
> +	 * FIFO of depth 2.
> +	 *
> +	 * Syncpoint trigger conditions set through VI_INCR_SYNCPT register
> +	 * are added to HW syncpt FIFO and when the HW triggers, syncpt
> +	 * condition is removed from the FIFO and counter at syncpoint index
> +	 * will be incremented by the hardware and software can wait for
> +	 * counter to reach threshold to synchronize capturing frame with the
> +	 * hardware capture events.
> +	 */
> +
> +	/* increase channel syncpoint threshold for FRAME_START */
> +	thresh = host1x_syncpt_incr_max(chan->frame_start_sp, 1);
> +
> +	/* Program FRAME_START trigger condition syncpt request */
> +	frame_start = VI_CSI_PP_FRAME_START(chan->portno);
> +	value = VI_CFG_VI_INCR_SYNCPT_COND(frame_start) |
> +		host1x_syncpt_id(chan->frame_start_sp);
> +	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
> +
> +	/* increase channel syncpoint threshold for MW_ACK_DONE */
> +	buf->mw_ack_sp_thresh = host1x_syncpt_incr_max(chan->mw_ack_sp, 1);
> +
> +	/* Program MW_ACK_DONE trigger condition syncpt request */
> +	mw_ack_done = VI_CSI_MW_ACK_DONE(chan->portno);
> +	value = VI_CFG_VI_INCR_SYNCPT_COND(mw_ack_done) |
> +		host1x_syncpt_id(chan->mw_ack_sp);
> +	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
> +
> +	/* enable single shot capture */
> +	vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT, SINGLE_SHOT_CAPTURE);
> +	chan->capture_reqs++;
> +
> +	/* wait for syncpt counter to reach frame start event threshold */
> +	err = host1x_syncpt_wait(chan->frame_start_sp, thresh,
> +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);

What is the point of waiting for the frame-start? Why just not to wait
for the frame-end?
