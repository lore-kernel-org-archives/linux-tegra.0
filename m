From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC PATCH v2 11/18] media: tegra-video: Add support for external
 sensor capture
Date: Tue, 7 Jul 2020 21:35:12 +0200
Message-ID: <af11cb24-57b2-7326-ca29-e168dcbb8006@xs4all.nl>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-12-git-send-email-skomatineni@nvidia.com>
 <50deca28-c198-703c-96e2-82c53f48cd65@xs4all.nl>
 <6ee18b4d-b63b-8053-1b7e-c3ec7c1d4956@nvidia.com>
 <6846e5bb-db1d-c2ff-c52c-70a2094c5b50@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6846e5bb-db1d-c2ff-c52c-70a2094c5b50@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07/07/2020 21:25, Sowjanya Komatineni wrote:
> 
> On 7/7/20 12:01 PM, Sowjanya Komatineni wrote:
>>
>>
>> On 7/6/20 2:10 AM, Hans Verkuil wrote:
>>>> +static void tegra_vi_graph_cleanup(struct tegra_vi *vi)
>>>> +{
>>>> +	struct tegra_vi_channel *chan;
>>>> +
>>>> +	list_for_each_entry(chan, &vi->vi_chans, list) {
>>>> +		video_unregister_device(&chan->video);
>>>> +		mutex_lock(&chan->video_lock);
>>>> +		vb2_queue_release(&chan->queue);
>>> No need for this since this is done in vb2_fop_release().
>>>
>>> In fact, vb2_queue_release should never be called by drivers. Just using
>>> vb2_fop_release or __vb2_fop_release is sufficient.
>>>
>>> The confusion is due to the fact that the name suggests that vb2_queue_release
>>> has to be balanced with vb2_queue_init, but that's not the case. Perhaps
>>> vb2_queue_stop or something like that might be a better name. I'll have to
>>> think about this since I see that a lot of drivers do this wrong.
>>>
>>>> +		mutex_unlock(&chan->video_lock);
>>>> +		v4l2_async_notifier_unregister(&chan->notifier);
>>>> +		v4l2_async_notifier_cleanup(&chan->notifier);
>>>> +	}
>>>> +}
>>>> +
>>
>> vb2_queue_release() here is called to stop streaming a head before media links are removed in case of when driver unbind happens while
>> userspace application holds video device with active streaming in progress.
>>
>> Without vb2_queue_release() here streaming will be active during the driver unbind and by the time vb2_queue_release() happens from
>> vb2_fop_release(), async notifiers gets unregistered and media links will be removed which causes channel stop stream to crash as we can't
>> retrieve sensor subdev  thru media entity pads to execute s_stream on subdev.
>>
> I think we don't need async notifier unbind. Currently media links are removed during unbind so during notifier unregister all subdevs gets
> unbind and links removed.
> 
> media_device_unregister during video device release callback takes care of media entity unregister and removing links.
> 
> So, will try by removing notifier unbind along with removing vb2_queue_release during cleanup.
> 

I actually wonder if vb2_queue_release shouldn't be called from video_unregister_device.

I'll look into this tomorrow.

Regards,

	Hans
