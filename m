From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 19:05:23 +0300
Message-ID: <1a12974a-7cc7-2c3a-3995-076b9956714d@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <38d921a7-5cdf-8d0a-2772-4399dd1a96a0@gmail.com>
 <9b8cf37b-d2ad-9df2-aad8-216c2c954e69@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9b8cf37b-d2ad-9df2-aad8-216c2c954e69-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

06.04.2020 18:35, Sowjanya Komatineni пишет:
...
>>> +     /* wait for syncpt counter to reach frame start event threshold */
>>> +     err = host1x_syncpt_wait(chan->frame_start_sp, thresh,
>>> +                              TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>>> +     if (err) {
>>> +             dev_err(&chan->video.dev,
>>> +                     "frame start syncpt timeout: %d\n", err);
>>> +             /* increment syncpoint counter for timedout events */
>>> +             host1x_syncpt_incr(chan->frame_start_sp);
>> Why incrementing is done while hardware is still active?
>>
>> The sync point's state needs to be completely reset after resetting
>> hardware. But I don't think that the current upstream host1x driver
>> supports doing that, it's one of the known-long-standing problems of the
>> host1x driver.
>>
>> At least the sp->max_val incrementing should be done based on the actual
>> syncpoint value and this should be done after resetting hardware.
> 
> upstream host1x driver don't have API to reset or to equalize max value
> with min/load value.
> 
> So to synchronize missed event, incrementing HW syncpt counter.
> 
> This should not impact as we increment this in case of missed events only.

It's wrong to touch sync point while hardware is active and it's active
until being reset.

You should re-check the timeout after hw resetting and manually put the
syncpoint counter back into sync only if needed.
