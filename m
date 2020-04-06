From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 23:37:00 +0300
Message-ID: <86bbcd55-fa13-5a35-e38b-c23745eafb87@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <782c8c4e-f5c2-d75e-0410-757172dd3090@gmail.com>
 <ac225ff3-8de8-256c-7f81-0225b4153540@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ac225ff3-8de8-256c-7f81-0225b4153540-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

06.04.2020 23:20, Sowjanya Komatineni пишет:
> 
> On 4/6/20 1:02 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 04.04.2020 04:25, Sowjanya Komatineni пишет:
>> ...
>>> +static int chan_capture_kthread_start(void *data)
>>> +{
>>> +     struct tegra_vi_channel *chan = data;
>>> +     struct tegra_channel_buffer *buf;
>>> +     int err = 0;
>>> +     int caps_inflight;
>>> +
>>> +     set_freezable();
>>> +
>>> +     while (1) {
>>> +             try_to_freeze();
>>> +
>>> +             wait_event_interruptible(chan->start_wait,
>>> +                                      !list_empty(&chan->capture) ||
>>> +                                      kthread_should_stop());
>> Is it really okay that list_empty() isn't protected with a lock?
>>
>> Why wait_event is "interruptible"?
> 
> To allow it to sleep until wakeup on thread it to avoid constant
> checking for condition even when no buffers are ready, basically to
> prevent blocking.

So the "interrupt" is for getting event about kthread_should_stop(),
correct?
