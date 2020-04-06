From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 23:54:46 +0300
Message-ID: <7361d00d-9cfe-3e4a-6199-524d37d53bd0@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <782c8c4e-f5c2-d75e-0410-757172dd3090@gmail.com>
 <ac225ff3-8de8-256c-7f81-0225b4153540@nvidia.com>
 <86bbcd55-fa13-5a35-e38b-c23745eafb87@gmail.com>
 <2839b1ee-dedc-d0ee-e484-32729a82a6ea@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2839b1ee-dedc-d0ee-e484-32729a82a6ea@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

06.04.2020 23:38, Sowjanya Komatineni пишет:
> 
> On 4/6/20 1:37 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 06.04.2020 23:20, Sowjanya Komatineni пишет:
>>> On 4/6/20 1:02 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 04.04.2020 04:25, Sowjanya Komatineni пишет:
>>>> ...
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
>>>> Is it really okay that list_empty() isn't protected with a lock?
>>>>
>>>> Why wait_event is "interruptible"?
>>> To allow it to sleep until wakeup on thread it to avoid constant
>>> checking for condition even when no buffers are ready, basically to
>>> prevent blocking.
>> So the "interrupt" is for getting event about kthread_should_stop(),
>> correct?
> also to prevent blocking and to let is sleep and wakeup based on wait
> queue to evaluate condition to proceed with the task
>>

This looks suspicious, the comment to wait_event_interruptible() says
that it will return ERESTARTSYS if signal is recieved..

Does this mean that I can send signal from userspace to wake it up?

The "interruptible" part looks wrong to me.
