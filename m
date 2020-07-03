From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC PATCH v2 12/18] media: tegra-video: Add support for
 selection ioctl ops
Date: Fri, 3 Jul 2020 10:06:09 +0200
Message-ID: <a95717b6-e2ee-78df-5145-de265805b3d4@xs4all.nl>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-13-git-send-email-skomatineni@nvidia.com>
 <efc84cff-76d5-78a2-e84e-0342459d3756@xs4all.nl>
 <c82a000a-7766-c933-fd69-24eb4885fc14@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <c82a000a-7766-c933-fd69-24eb4885fc14@nvidia.com>
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 02/07/2020 23:20, Sowjanya Komatineni wrote:
> 
> On 7/2/20 6:54 AM, Hans Verkuil wrote:
>> On 17/06/2020 03:41, Sowjanya Komatineni wrote:
>>> This patch adds selection v4l2 ioctl operations to allow configuring
>>> a selection rectangle in the sensor through the Tegra video device
>>> node.
>>>
>>> Some sensor drivers supporting crop uses try_crop rectangle from
>>> v4l2_subdev_pad_config during try format for computing binning.
>>>
>>> So with selection ops support, this patch also updates try format
>>> to use try crop rectangle either from subdev frame size enumeration
>>> or from subdev crop boundary.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/staging/media/tegra-video/vi.c | 106 +++++++++++++++++++++++++++++++++
>>>   1 file changed, 106 insertions(+)
>>>
>>> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
>>> index 506c263..f9eb96b 100644
>>> --- a/drivers/staging/media/tegra-video/vi.c
>>> +++ b/drivers/staging/media/tegra-video/vi.c
>>> @@ -427,6 +427,13 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>>>   	struct v4l2_subdev *subdev;
>>>   	struct v4l2_subdev_format fmt;
>>>   	struct v4l2_subdev_pad_config *pad_cfg;
>>> +	struct v4l2_subdev_frame_size_enum fse = {
>>> +		.which = V4L2_SUBDEV_FORMAT_TRY,
>>> +	};
>>> +	struct v4l2_subdev_selection sdsel = {
>>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>>> +		.target = V4L2_SEL_TGT_CROP_BOUNDS,
>>> +	};
>>>   	int ret;
>>>   
>>>   	subdev = tegra_channel_get_remote_subdev(chan, true);
>>> @@ -449,6 +456,24 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>>>   	fmt.which = V4L2_SUBDEV_FORMAT_TRY;
>>>   	fmt.pad = 0;
>>>   	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
>>> +
>>> +	/*
>>> +	 * Attempt to obtain the format size from subdev.
>>> +	 * If not available, try to get crop boundary from subdev.
>>> +	 */
>>> +	fse.code = fmtinfo->code;
>>> +	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, pad_cfg, &fse);
>>> +	if (ret) {
>>> +		ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
>>> +		if (ret)
>>> +			return -EINVAL;
>>> +		pad_cfg->try_crop.width = sdsel.r.width;
>>> +		pad_cfg->try_crop.height = sdsel.r.height;
>>> +	} else {
>>> +		pad_cfg->try_crop.width = fse.max_width;
>>> +		pad_cfg->try_crop.height = fse.max_height;
>>> +	}
>>> +
>>>   	ret = v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
>>>   	if (ret < 0)
>>>   		return ret;
>>> @@ -540,6 +565,85 @@ static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
>>>   	return 0;
>>>   }
>>>   
>>> +static int tegra_channel_g_selection(struct file *file, void *priv,
>>> +				     struct v4l2_selection *sel)
>>> +{
>>> +	struct tegra_vi_channel *chan = video_drvdata(file);
>>> +	struct v4l2_subdev *subdev;
>>> +	struct v4l2_subdev_format fmt = {
>>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>>> +	};
>>> +	struct v4l2_subdev_selection sdsel = {
>>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>>> +		.target = sel->target,
>>> +	};
>>> +	int ret;
>>> +
>>> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>>> +		return -ENOTTY;
>>> +
>>> +	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>>> +		return -EINVAL;
>>> +	/*
>>> +	 * Try the get selection operation and fallback to get format if not
>>> +	 * implemented.
>>> +	 */
>>> +	subdev = tegra_channel_get_remote_subdev(chan, true);
>>> +	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
>>> +	if (!ret)
>>> +		sel->r = sdsel.r;
>>> +	if (ret != -ENOIOCTLCMD)
>>> +		return ret;
>>> +
>>> +	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	sel->r.left = 0;
>>> +	sel->r.top = 0;
>>> +	sel->r.width = fmt.format.width;
>>> +	sel->r.height = fmt.format.height;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int tegra_channel_s_selection(struct file *file, void *fh,
>>> +				     struct v4l2_selection *sel)
>>> +{
>>> +	struct tegra_vi_channel *chan = video_drvdata(file);
>>> +	struct v4l2_subdev *subdev;
>>> +	int ret;
>>> +	struct v4l2_subdev_selection sdsel = {
>>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>>> +		.target = sel->target,
>>> +		.flags = sel->flags,
>>> +		.r = sel->r,
>>> +	};
>>> +
>> This function doesn't check if the subdev actually supports set_selection.
>> The imx219 is one such driver: it supports get_selection, but not set_selection.
>>
>> So this code should add these lines to fix the v4l2-compliance fail:
>>
>>         subdev = tegra_channel_get_remote_subdev(chan, true);
>>
>>         if (!v4l2_subdev_has_op(subdev, pad, set_selection))
>>                 return -ENOTTY;
>>
> v4l2_subdev_call() does that check and returns -ENOIOCTLCMD when 
> specified subdev ops does not exist.

But that test happens too late. In the v4l2-compliance test it fails in the
sel->type test below, so it returns EINVAL instead of ENOTTY.

>>> +	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>>> +		return -ENOTTY;

I think this test should come before the v4l2_subdev_has_op test since there
is probably no subdev if the TPG is enabled. So:

	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
		return -ENOTTY;

        subdev = tegra_channel_get_remote_subdev(chan, true);
        if (!v4l2_subdev_has_op(subdev, pad, set_selection))
                return -ENOTTY;


Regards,

	Hans

>>> +
>>> +	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>>> +		return -EINVAL;
>>> +
>>> +	if (vb2_is_busy(&chan->queue))
>>> +		return -EBUSY;
>>> +
>>> +	subdev = tegra_channel_get_remote_subdev(chan, true);
>> And this line can be dropped.
>>
>> Regards,
>>
>> 	Hans
>>
>>> +	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, &sdsel);
>>> +	if (!ret) {
>>> +		sel->r = sdsel.r;
>>> +		/*
>>> +		 * Subdev active format resolution may have changed during
>>> +		 * set selection operation. So, update channel format to
>>> +		 * the sub-device active format.
>>> +		 */
>>> +		return tegra_channel_set_subdev_active_fmt(chan);
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>   static int tegra_channel_enum_input(struct file *file, void *fh,
>>>   				    struct v4l2_input *inp)
>>>   {
>>> @@ -597,6 +701,8 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
>>>   	.vidioc_streamoff		= vb2_ioctl_streamoff,
>>>   	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
>>>   	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
>>> +	.vidioc_g_selection		= tegra_channel_g_selection,
>>> +	.vidioc_s_selection		= tegra_channel_s_selection,
>>>   };
>>>   
>>>   /*
>>>
