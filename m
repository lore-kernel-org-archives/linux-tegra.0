From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 30 Apr 2020 13:08:39 -0700
Message-ID: <bfd82642-9648-96f1-737d-4b9a869d34a3@nvidia.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <eadf3a5a-f305-4561-10e1-1b9241b9c5c2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <eadf3a5a-f305-4561-10e1-1b9241b9c5c2@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/30/20 1:06 PM, Dmitry Osipenko wrote:
> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +static int chan_capture_kthread_start(void *data)
>> +{
>> +	struct tegra_vi_channel *chan =3D data;
>> +	struct tegra_channel_buffer *buf;
>> +	int err =3D 0;
>> +
>> +	set_freezable();
>> +
>> +	while (1) {
>> +		try_to_freeze();
>> +
>> +		/*
>> +		 * Source is not streaming if error is non-zero.
>> +		 * So, do not dequeue buffers on error and let the thread sleep
>> +		 * till kthread stop signal is received.
>> +		 */
>> +		wait_event_interruptible(chan->start_wait,
>> +					 kthread_should_stop() ||
>> +					 (!list_empty(&chan->capture) &&
>> +					 !err));
> ...
>> +static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
>> +{
>> +	struct tegra_vi_channel *chan =3D vb2_get_drv_priv(vb->vb2_queue);
>> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
>> +	struct tegra_channel_buffer *buf =3D to_tegra_channel_buffer(vbuf);
>> +
>> +	/* put buffer into the capture queue */
>> +	spin_lock(&chan->start_lock);
>> +	list_add_tail(&buf->queue, &chan->capture);
>> +	spin_unlock(&chan->start_lock);
>> +
>> +	/* wait up kthread for capture */
>> +	wake_up_interruptible(&chan->start_wait);
>> +}
> The V4L doc says that buffers could be enqueued before streaming is
> started. I guess it should be a trouble here, shouldn't it?
>
> https://elixir.bootlin.com/linux/v5.7-rc3/source/include/media/videobuf2-=
core.h#L379

what trouble are you referring here?

I dont think so as we set min buffers needed as 2 always there will be 2=20
per-queued buffers.

But buffers from this queue will be dequeued only when ready to=20
processes in the capture thread
