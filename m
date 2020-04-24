From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 23 Apr 2020 18:08:27 -0700
Message-ID: <8f01724e-95d4-e6d8-9e2d-bce4b8dd0177@nvidia.com>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
 <7e473fa9-0409-d868-e818-2e7928a8acca@gmail.com>
 <a83bfc89-35de-85b5-fe5f-71e62456f5e9@nvidia.com>
 <3691c4b5-1ecc-2ad3-23ed-72ef6b8d25fa@nvidia.com>
 <fce6dfbb-0b8d-319b-2d6f-976953a3c36c@gmail.com>
 <a2672be9-93c1-8363-6c0e-6d43c2bd59bc@nvidia.com>
 <492dafac-42aa-3caf-4d32-ba0e434b19c3@gmail.com>
 <39402a49-f39f-256c-31e7-afaa25d55664@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <39402a49-f39f-256c-31e7-afaa25d55664-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/23/20 5:51 PM, Sowjanya Komatineni wrote:
>
> On 4/23/20 5:42 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 24.04.2020 02:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 4/23/20 4:25 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 24.04.2020 02:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 4/23/20 4:19 PM, Sowjanya Komatineni wrote:
>>>>>> On 4/23/20 4:16 PM, Dmitry Osipenko wrote:
>>>>>>> External email: Use caution opening links or attachments
>>>>>>>
>>>>>>>
>>>>>>> 22.04.2020 09:18, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>> +static int chan_capture_kthread_start(void *data)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D data;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int err =3D 0;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 set_freezable();
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 while (1) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 try_to_freeze();
>>>>>>>> +
>>>>>>>> + wait_event_interruptible(chan->start_wait,
>>>>>>>> + !list_empty(&chan->capture) ||
>>>>>>>> + kthread_should_stop());
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (kthread_should_stop())
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /*
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * Source is not streaming if error is non-zero.
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * So, do not dequeue buffers on capture error.
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (err)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>>>>>>> This will result in an endless loop, I suppose it wasn't the
>>>>>>> intention.
>>>>>> no it will not. on error we report vb2_queue_error which will do
>>>>>> streaming stop request.
>>>>>>
>>>>>> So thread will be stopped on streaming stop request thru kthread=20
>>>>>> stop
>>>>>> signal
>>>>> To be clear on error it reports vb2 queue error and waits for stop
>>>>> streaming to happen
>>>> If thread should exit on error, then it should do it on the actual
>>>> error. Otherwise it looks very error-prone.
>>> When v4l2 drivers indicate fatal error through vb2_queue_error, queue
>>> error flag=C2=A0 is set and wakes up all processes waiting on queue alo=
ng
>>> with polling reporting=C2=A0 EPOLLERR and also reporting error for queu=
ing
>>> and dequeuing buffers. Stream stop will surely happen which stops the
>>> thread.
>> This doesn't explain what is the point of continuing to loop instead of
>> exiting immediately on error.
>
> We are using 2 threads and when capture start error happens, we can=20
> stop capture_start thread immediately but capture_finish thread will=20
> still run for any outstanding buffers.
>
> So, as it makes no diff stopping both threads during stream stop which=20
> will definitely happen on error and when we don't dequeue buffers
>
Also there will be an issue if we break on error immediately during=20
stop_streaming -> kthread_stop()

As stop streaming can happen any time, we do kthread_stop and in case of=20
error if we stop thread and on stop streaming kthread_stop might crash=20
as kthread_stop can only be called on running thread
