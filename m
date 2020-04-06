From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 13:20:46 -0700
Message-ID: <ac225ff3-8de8-256c-7f81-0225b4153540@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <782c8c4e-f5c2-d75e-0410-757172dd3090@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <782c8c4e-f5c2-d75e-0410-757172dd3090@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/6/20 1:02 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +static int chan_capture_kthread_start(void *data)
>> +{
>> +     struct tegra_vi_channel *chan =3D data;
>> +     struct tegra_channel_buffer *buf;
>> +     int err =3D 0;
>> +     int caps_inflight;
>> +
>> +     set_freezable();
>> +
>> +     while (1) {
>> +             try_to_freeze();
>> +
>> +             wait_event_interruptible(chan->start_wait,
>> +                                      !list_empty(&chan->capture) ||
>> +                                      kthread_should_stop());
> Is it really okay that list_empty() isn't protected with a lock?
>
> Why wait_event is "interruptible"?

To allow it to sleep until wakeup on thread it to avoid constant=20
checking for condition even when no buffers are ready, basically to=20
prevent blocking.

>
>> +             /*
>> +              * Frame start and MW_ACK_DONE syncpoint condition FIFOs a=
re
>> +              * of max depth 2. So make sure max 2 capture requests are
>> +              * in process by the hardware at a time.
>> +              */
>> +             while (!(kthread_should_stop() || list_empty(&chan->captur=
e))) {
>> +                     caps_inflight =3D chan->capture_reqs - chan->seque=
nce;
>> +                     /*
>> +                      * Source is not streaming if error is non-zero.
>> +                      * So, do not dequeue buffers on capture error or =
when
>> +                      * syncpoint requests in FIFO are full.
>> +                      */
>> +                     if (err || caps_inflight >=3D SYNCPT_FIFO_DEPTH)
>> +                             break;
>> +
>> +                     /* dequeue the buffer and start capture */
>> +                     spin_lock(&chan->start_lock);
>> +                     if (list_empty(&chan->capture))
>> +                             break;
>> +                     buf =3D list_entry(chan->capture.next,
>> +                                      struct tegra_channel_buffer, queu=
e);
> list_first_entry()
>
>> +                     list_del_init(&buf->queue);
>> +                     spin_unlock(&chan->start_lock);
>> +
>> +                     err =3D tegra_channel_capture_frame(chan, buf);
>> +                     if (err)
>> +                             vb2_queue_error(&chan->queue);
>> +             }
>> +
>> +             if (kthread_should_stop())
>> +                     break;
>> +     }
>> +
>> +     return 0;
>> +}
