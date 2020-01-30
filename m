From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input
 driver for Tegra210
Date: Thu, 30 Jan 2020 09:02:21 -0800
Message-ID: <5a45782a-d88f-099a-f3b6-3c0255131f6b@nvidia.com>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <20200129111340.GF2479935@ulmo>
 <070f9a4c-1919-f3f6-fef3-ed0a84cf5776@nvidia.com>
 <20200130122055.GA2584455@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200130122055.GA2584455@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 1/30/20 4:20 AM, Thierry Reding wrote:
> On Wed, Jan 29, 2020 at 09:23:38AM -0800, Sowjanya Komatineni wrote:
>> On 1/29/20 3:13 AM, Thierry Reding wrote:
>>> On Tue, Jan 28, 2020 at 10:23:20AM -0800, Sowjanya Komatineni wrote:
> [...]
>>>> diff --git a/drivers/staging/media/tegra/host1x-video.c b/drivers/staging/media/tegra/host1x-video.c
> [...]
>>>> +	media_device_init(&cam->media_dev);
>>>> +	ret = media_device_register(&cam->media_dev);
>>>> +	if (ret < 0) {
>>>> +		dev_err(cam->dev, "failed to register media device: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	cam->v4l2_dev.mdev = &cam->media_dev;
>>>> +	ret = v4l2_device_register(cam->dev, &cam->v4l2_dev);
>>>> +	if (ret < 0) {
>>>> +		dev_err(cam->dev, "V4L2 device registration failed: %d\n", ret);
>>>> +		goto register_error;
>>>> +	}
>>>> +
>>>> +	dev_set_drvdata(&dev->dev, cam);
>>>> +
>>>> +	ret = host1x_device_init(dev);
>>>> +	if (ret < 0)
>>>> +		goto dev_exit;
>>>> +
>>>> +	return 0;
>>>> +
>>>> +dev_exit:
>>>> +	host1x_device_exit(dev);
>>> There should be no need to call host1x_device_exit() when
>>> host1x_device_init() failed because the latter already takes care of
>>> undoing whatever it did already.
>>>
>> host1x_device_init can fail if any of its client ops init fails.
>>
>> So, calling host1x_device_exit here to undo the things done in other
>> successful client init ops.
> host1x_device_init() already takes care of undoing what it did on
> failure. Also, it makes sure to only undo what had already been done,
> rather than tear down every client, even if it hadn't been initialized
> yet when the failure happened. The latter is what would happen if you
> called host1x_device_exit() to cleanup at this point.
>
> Thierry

Sorry, yes I see host1x_device_init calls exit ops on failures .

Will remove it. Thanks Thierry.
