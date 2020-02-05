From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [RFC PATCH v1 0/5] Add Tegra driver for video capture
Date: Wed, 5 Feb 2020 08:57:32 +0100
Message-ID: <474ca8c5-4735-1707-d6f6-cf541bfeb525@xs4all.nl>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <098ac46f-fe13-f215-b9a4-aa8d01395592@xs4all.nl>
 <6c3d2557-8982-37bf-810a-6d9faad9e5a4@nvidia.com>
 <9c4775f2-8188-43f4-1de1-56620fad2e7c@xs4all.nl>
 <af813a4e-339c-4254-75a0-8db995fe2aba@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <af813a4e-339c-4254-75a0-8db995fe2aba-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 2/4/20 8:02 PM, Sowjanya Komatineni wrote:
>>>> I also noticed that changing the test pattern while streaming did not seem to have
>>>> any effect until I stop and restart streaming. Is that a limitation of the HW or of
>>>> the driver?
>>> Do you mean changing test pattern mode of different channel while other
>>> channels are streaming?
>> No, from the same channel. E.g. v4l2-ctl --stream-mmap, then do from another
>> console 'v4l2-ctl -c test-pattern=1'.
>>
>> It depends on the hardware whether or not you can change the test pattern
>> while streaming. But it is nice for testing if this is possible.
> 
> Test-pattern mode changes during active streaming will not get set as 
> test-pattern mode is in CSI and mode is set every time during the start 
> of streaming and then VI keeps capturing the frames.
> 
> basically its during CSI subdevice stream enable.

OK. Just add a little comment either at the point the control is created or
where the control is set in vi_s_ctrl(). It's just to document that this
will only take effect at the next streamon.

Regards,

	Hans
