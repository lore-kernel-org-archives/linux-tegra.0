From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v2 11/18] media: tegra-video: Add support for external
 sensor capture
Date: Tue, 7 Jul 2020 03:32:49 -0700
Message-ID: <b0381437-31ea-a2f0-1105-842a357b9b23@nvidia.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-12-git-send-email-skomatineni@nvidia.com>
 <50deca28-c198-703c-96e2-82c53f48cd65@xs4all.nl>
 <6e09f5d3-85ca-5bf9-8617-b9c8bec36615@nvidia.com>
 <64622861-c9e7-c158-a2c3-0db8c65fd29f@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <64622861-c9e7-c158-a2c3-0db8c65fd29f@xs4all.nl>
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 7/7/20 2:51 AM, Hans Verkuil wrote:
> On 07/07/2020 11:40, Sowjanya Komatineni wrote:
>> On 7/6/20 2:10 AM, Hans Verkuil wrote:
>>>> +static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
>>>> +{
>>>> +	struct tegra_vi_graph_entity *entity;
>>>> +	struct v4l2_async_subdev *asd;
>>>> +	struct v4l2_subdev *subdev;
>>>> +	struct tegra_vi_channel *chan;
>>>> +	struct tegra_vi *vi;
>>>> +	int ret;
>>>> +
>>>> +	chan = container_of(notifier, struct tegra_vi_channel, notifier);
>>>> +	vi = chan->vi;
>>>> +
>>>> +	dev_dbg(vi->dev, "notify complete, all subdevs registered\n");
>>>> +
>>>> +	ret = video_register_device(&chan->video, VFL_TYPE_VIDEO, -1);
>>> This should be done last after the tegra_vi_graph_build and tegra_channel_setup_ctrl_handler
>>> calls. The video device is immediately accessible after this call, so don't
>>> call it until everything is setup (i.e. until just before the 'return 0;' below).
>>>
>>>> +	if (ret < 0) {
>>>> +		dev_err(vi->dev,
>>>> +			"failed to register video device: %d\n", ret);
>>>> +		goto unregister_video;
>>>> +	}
>>>> +
>>>> +	/* create links between the entities */
>>>> +	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
>>>> +		entity = to_tegra_vi_graph_entity(asd);
>>>> +		ret = tegra_vi_graph_build(chan, entity);
>>>> +		if (ret < 0)
>>>> +			goto unregister_video;
>>>> +	}
>>>> +
>> Hi Hans,
>>
>> Currently Tegra video driver sets v4l2_dev->mdev prior to graph parse and building links to let media_device_register_entity() to happen
>> during video_register_device() -> video_register_media_controller() and media_device_unregister_entity() to happen during v4l2_device_release()
>>
>> TPG also does the same of letting media entity register/unregister to happen during video device register and release callback.
>>
>> So, registering video device prior to media links creation as media_device_register_entity() will happen during video_register_device()
>>
>> To register video device after creating media links, it need to change for both TPG and Non-TPG to not set v4l2_dev->mdev and Tegra video
>> driver should explicitly take care of media_device_register_entity() and media_device_unregister_entity().
>>
>> Prior to making this change to both TPG and Non-TPG, would like to understand on possibility of using video device node prior to finishing
>> complete driver probe()
>>
>> As video device register happens during async notifier complete callback, and all the device graph build happens during video driver probe()
>> what exactly will be the issue of having video device node prior to creating media links?
> It's not the 'create links between the entities' bit that's the problem, it is what follows:
>
> +	ret = tegra_channel_setup_ctrl_handler(chan);
> +	if (ret < 0) {
> +		dev_err(vi->dev,
> +			"failed to setup channel controls: %d\n", ret);
> +		goto unregister_video;
> +	}
> +
> +	vi_fmts_bitmap_init(chan);
> +	subdev = tegra_channel_get_remote_subdev(chan, false);
> +	v4l2_set_subdev_hostdata(subdev, chan);
>
> That should be done before the video_register_device call.

v4l2_subdev is retrieved in tegra_channel_get_remote_subdev() through 
media pad entity links which are setup only during media_create_pad_link()

Currently as driver lets media_device_register_entity() to happen during 
video_device_register(), media_create_pad_link() is done after 
video_register_device.

media_create_pad_link() need to happen prior to using 
tegra_channel_get_remote_subdev() with current implementation.


Probably I can move tegra_channel_setup_ctrl_handler() and 
vi_fmts_bitmap_init() into subdev bound notifier callback to invoke them 
for subdev entity not MEDIA_ENT_F_VID_IF_BRIDGE.

With this by the time video_register_device happens during complete 
callback, ctrl handler and bitmaps both will be setup/initialized.

>
> Because otherwise the /dev/videoX doesn't have the full set of controls, and
> I am also not certain which ioctls might use the subdev hostdata.

csi driver gets hostdata as it needs channel pg_mode selection value and 
this is used only during streaming.


> The core problem is really that video_register_device should have been split
> into an init function and a register function, so it is possible to set
> everything up before registering the video device. Oh well...
>
> Regards,
>
> 	Hans
>
>> I see some other drivers also doing the same order of registering video device prior to creating media links and also we are doing the same
>> in L4T driver as well.
>>
>> Thanks
>>
>> Sowjanya
>>
>>
