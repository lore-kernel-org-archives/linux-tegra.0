From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 13:50:35 -0700
Message-ID: <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200bb96e-2d07-764f-9e14-55538dc742fd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/6/20 1:45 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
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
> Am I understanding correctly that this thread will take 100% CPU,
> spinning here, if more than 2 frame-captures queued?
on more than 2 frames captures, it breaks thread and on next wakeup it=20
continues
