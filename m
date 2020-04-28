From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1 3/5] media: tegra-video: Move PM runtime handle to
 streaming
Date: Tue, 28 Apr 2020 18:15:38 +0300
Message-ID: <ce31e273-f424-f13e-5cd6-0db2589a2a10@gmail.com>
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
 <1588047650-29402-4-git-send-email-skomatineni@nvidia.com>
 <631390cb-9aff-0e3f-6c39-81d6c565987e@gmail.com>
 <3ef69413-a606-b475-f530-d5534760b73b@nvidia.com>
 <2b334095-fadb-bf0a-f7a8-62fc798c2bd2@gmail.com>
 <18a7b095-7f0f-7819-c786-7e011cfd14ed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <18a7b095-7f0f-7819-c786-7e011cfd14ed@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

28.04.2020 18:08, Sowjanya Komatineni пишет:
> 
> On 4/28/20 7:59 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 28.04.2020 17:51, Sowjanya Komatineni пишет:
>>> On 4/28/20 6:59 AM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 28.04.2020 07:20, Sowjanya Komatineni пишет:
>>>>> diff --git a/drivers/staging/media/tegra-video/csi.c
>>>>> b/drivers/staging/media/tegra-video/csi.c
>>>>> index b3dd0c3..29ccdae 100644
>>>>> --- a/drivers/staging/media/tegra-video/csi.c
>>>>> +++ b/drivers/staging/media/tegra-video/csi.c
>>>>> @@ -272,8 +272,25 @@ static int tegra_csi_s_stream(struct v4l2_subdev
>>>>> *subdev, int enable)
>>>>>         struct tegra_vi_channel *chan =
>>>>> v4l2_get_subdev_hostdata(subdev);
>>>>>         struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>>>>>         struct tegra_csi *csi = csi_chan->csi;
>>>>> +     int ret;
>>>>> +
>>>>> +     if (enable && atomic_add_return(1, &csi->clk_refcnt) == 1) {
>>>>> +             ret = pm_runtime_get_sync(csi->dev);
>>>>> +             if (ret < 0) {
>>>>> +                     dev_err(csi->dev,
>>>>> +                             "failed to get runtime PM: %d\n", ret);
>>>>> +                     pm_runtime_put_noidle(csi->dev);

Why this pm_runtime_put_noidle() is needed? This should be wrong, please
remove it.

>>>>> +                     atomic_dec(&csi->clk_refcnt);
>>>>> +                     return ret;
>>>>> +             }
>>>>> +     }
>>>>> +
>>>>> +     ret = csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
>>>>>
>>>>> -     return csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
>>>>> +     if ((ret < 0 || !enable) &&
>>>>> atomic_dec_and_test(&csi->clk_refcnt))
>>>>> +             pm_runtime_put_sync(csi->dev);
>>>> Runtime PM maintains its own refcount, why these
>>>> clk_refcnt/power_on_refcnt are needed?
>>> Streaming is per channel and we can't turn power/clocks off while other
>>> channels may still be running.
>>>
>> All channels use the same CSI device. You should remove the custom
>> refcounting.
>>
>> BTW, next time you'll really need to do refcounting, use the generic
>> kref.
> 
> Before channel stream we enable power/clocks and after streaming we stop.
> 
> So without refcount, on stream stop of any of the channel RPM put turns
> power/clock but other channels will still be streaming.
> 

Runtime PM uses its own refcounting. Please consult the RPM code and
documentation.

https://elixir.bootlin.com/linux/v5.7-rc3/source/include/linux/pm_runtime.h#L78
https://elixir.bootlin.com/linux/v5.7-rc3/source/drivers/base/power/runtime.c#L1079
