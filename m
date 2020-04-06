From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 13:55:12 -0700
Message-ID: <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
 <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
 <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/6/20 1:53 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 06.04.2020 23:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/6/20 1:45 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> +static int chan_capture_kthread_start(void *data)
>>>> +{
>>>> +     struct tegra_vi_channel *chan =3D data;
>>>> +     struct tegra_channel_buffer *buf;
>>>> +     int err =3D 0;
>>>> +     int caps_inflight;
>>>> +
>>>> +     set_freezable();
>>>> +
>>>> +     while (1) {
>>>> +             try_to_freeze();
>>>> +
>>>> +             wait_event_interruptible(chan->start_wait,
>>>> +                                      !list_empty(&chan->capture) ||
>>>> +                                      kthread_should_stop());
>>>> +             /*
>>>> +              * Frame start and MW_ACK_DONE syncpoint condition
>>>> FIFOs are
>>>> +              * of max depth 2. So make sure max 2 capture requests a=
re
>>>> +              * in process by the hardware at a time.
>>>> +              */
>>>> +             while (!(kthread_should_stop() ||
>>>> list_empty(&chan->capture))) {
>>>> +                     caps_inflight =3D chan->capture_reqs -
>>>> chan->sequence;
>>>> +                     /*
>>>> +                      * Source is not streaming if error is non-zero.
>>>> +                      * So, do not dequeue buffers on capture error
>>>> or when
>>>> +                      * syncpoint requests in FIFO are full.
>>>> +                      */
>>>> +                     if (err || caps_inflight >=3D SYNCPT_FIFO_DEPTH)
>>>> +                             break;
>>> Am I understanding correctly that this thread will take 100% CPU,
>>> spinning here, if more than 2 frame-captures queued?
>> on more than 2 frames captures, it breaks thread and on next wakeup it
>> continues
> The wait_event() won't wait if condition is true.
condition is checked when waitqueue is woken up
