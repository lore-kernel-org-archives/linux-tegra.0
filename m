From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 30 Apr 2020 13:09:57 -0700
Message-ID: <52b98347-4b78-f637-04f4-cc730ad336f3@nvidia.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <eadf3a5a-f305-4561-10e1-1b9241b9c5c2@gmail.com>
 <bfd82642-9648-96f1-737d-4b9a869d34a3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bfd82642-9648-96f1-737d-4b9a869d34a3-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/30/20 1:08 PM, Sowjanya Komatineni wrote:
>
> On 4/30/20 1:06 PM, Dmitry Osipenko wrote:
>> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> +static int chan_capture_kthread_start(void *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D data;
>>> +=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>> +=C2=A0=C2=A0=C2=A0 int err =3D 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 set_freezable();
>>> +
>>> +=C2=A0=C2=A0=C2=A0 while (1) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try_to_freeze();
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Source is not strea=
ming if error is non-zero.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * So, do not dequeue =
buffers on error and let the thread=20
>>> sleep
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * till kthread stop s=
ignal is received.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wait_event_interruptible(ch=
an->start_wait,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kthread_should_stop() |=
|
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (!list_empty(&chan->cap=
ture) &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !err));
>> ...
>>> +static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D vb2_get_drv_priv(=
vb->vb2_queue);
>>> +=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer=
(vb);
>>> +=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf =3D to_tegra_chann=
el_buffer(vbuf);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* put buffer into the capture queue */
>>> +=C2=A0=C2=A0=C2=A0 spin_lock(&chan->start_lock);
>>> +=C2=A0=C2=A0=C2=A0 list_add_tail(&buf->queue, &chan->capture);
>>> +=C2=A0=C2=A0=C2=A0 spin_unlock(&chan->start_lock);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* wait up kthread for capture */
>>> +=C2=A0=C2=A0=C2=A0 wake_up_interruptible(&chan->start_wait);
>>> +}
>> The V4L doc says that buffers could be enqueued before streaming is
>> started. I guess it should be a trouble here, shouldn't it?
>>
>> https://elixir.bootlin.com/linux/v5.7-rc3/source/include/media/videobuf2=
-core.h#L379=20
>>
>
> what trouble are you referring here?
>
> I dont think so as we set min buffers needed as 2 always there will be=20
> 2 per-queued buffers.
typo* pre-queued buffers before streaming start
>
> But buffers from this queue will be dequeued only when ready to=20
> processes in the capture thread
>
