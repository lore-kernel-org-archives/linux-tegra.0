From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 30 Apr 2020 17:13:37 +0300
Message-ID: <c6d54885-6f23-f60c-a17b-3481fc4d6adf@gmail.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
 <4da289e6-036f-853b-beb4-379d6462adb0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4da289e6-036f-853b-beb4-379d6462adb0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

30.04.2020 17:02, Dmitry Osipenko пишет:
> 30.04.2020 16:56, Dmitry Osipenko пишет:
>> 30.04.2020 01:00, Sowjanya Komatineni пишет:
>>> +static int chan_capture_kthread_finish(void *data)
>>> +{
>>> +	struct tegra_vi_channel *chan = data;
>>> +	struct tegra_channel_buffer *buf;
>>> +
>>> +	set_freezable();
>>> +
>>> +	while (1) {
>>> +		try_to_freeze();
>>
>> I guess it won't be great to freeze in the middle of a capture process, so:
>> 		if (list_empty(&chan->done))
>> 			try_to_freeze();
> 
> And here should be some locking protection in order not race with the
> chan_capture_kthread_start because kthread_finish could freeze before
> kthread_start.

Or maybe both start / finish threads should simply be allowed to freeze
only when both capture and done lists are empty.

if (list_empty(&chan->capture) &&
    list_empty(&chan->done))
	try_to_freeze();
