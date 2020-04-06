From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 23:56:28 +0300
Message-ID: <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
 <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
 <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
 <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

06.04.2020 23:55, Sowjanya Komatineni пишет:
> 
> On 4/6/20 1:53 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 06.04.2020 23:50, Sowjanya Komatineni пишет:
>>> On 4/6/20 1:45 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 04.04.2020 04:25, Sowjanya Komatineni пишет:
>>>>> +static int chan_capture_kthread_start(void *data)
>>>>> +{
>>>>> +     struct tegra_vi_channel *chan = data;
>>>>> +     struct tegra_channel_buffer *buf;
>>>>> +     int err = 0;
>>>>> +     int caps_inflight;
>>>>> +
>>>>> +     set_freezable();
>>>>> +
>>>>> +     while (1) {
>>>>> +             try_to_freeze();
>>>>> +
>>>>> +             wait_event_interruptible(chan->start_wait,
>>>>> +                                      !list_empty(&chan->capture) ||
>>>>> +                                      kthread_should_stop());
>>>>> +             /*
>>>>> +              * Frame start and MW_ACK_DONE syncpoint condition
>>>>> FIFOs are
>>>>> +              * of max depth 2. So make sure max 2 capture
>>>>> requests are
>>>>> +              * in process by the hardware at a time.
>>>>> +              */
>>>>> +             while (!(kthread_should_stop() ||
>>>>> list_empty(&chan->capture))) {
>>>>> +                     caps_inflight = chan->capture_reqs -
>>>>> chan->sequence;
>>>>> +                     /*
>>>>> +                      * Source is not streaming if error is non-zero.
>>>>> +                      * So, do not dequeue buffers on capture error
>>>>> or when
>>>>> +                      * syncpoint requests in FIFO are full.
>>>>> +                      */
>>>>> +                     if (err || caps_inflight >= SYNCPT_FIFO_DEPTH)
>>>>> +                             break;
>>>> Am I understanding correctly that this thread will take 100% CPU,
>>>> spinning here, if more than 2 frame-captures queued?
>>> on more than 2 frames captures, it breaks thread and on next wakeup it
>>> continues
>> The wait_event() won't wait if condition is true.
> condition is checked when waitqueue is woken up

https://elixir.bootlin.com/linux/v5.6.2/source/include/linux/wait.h#L462
