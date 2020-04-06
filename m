From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 09:12:10 -0700
Message-ID: <66cc8646-43d3-3fc8-c31d-d0d2efac505f@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <38d921a7-5cdf-8d0a-2772-4399dd1a96a0@gmail.com>
 <9b8cf37b-d2ad-9df2-aad8-216c2c954e69@nvidia.com>
 <1a12974a-7cc7-2c3a-3995-076b9956714d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1a12974a-7cc7-2c3a-3995-076b9956714d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/6/20 9:05 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 06.04.2020 18:35, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>>> +     /* wait for syncpt counter to reach frame start event threshold =
*/
>>>> +     err =3D host1x_syncpt_wait(chan->frame_start_sp, thresh,
>>>> +                              TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>>>> +     if (err) {
>>>> +             dev_err(&chan->video.dev,
>>>> +                     "frame start syncpt timeout: %d\n", err);
>>>> +             /* increment syncpoint counter for timedout events */
>>>> +             host1x_syncpt_incr(chan->frame_start_sp);
>>> Why incrementing is done while hardware is still active?
>>>
>>> The sync point's state needs to be completely reset after resetting
>>> hardware. But I don't think that the current upstream host1x driver
>>> supports doing that, it's one of the known-long-standing problems of th=
e
>>> host1x driver.
>>>
>>> At least the sp->max_val incrementing should be done based on the actua=
l
>>> syncpoint value and this should be done after resetting hardware.
>> upstream host1x driver don't have API to reset or to equalize max value
>> with min/load value.
>>
>> So to synchronize missed event, incrementing HW syncpt counter.
>>
>> This should not impact as we increment this in case of missed events onl=
y.
> It's wrong to touch sync point while hardware is active and it's active
> until being reset.
>
> You should re-check the timeout after hw resetting and manually put the
> syncpoint counter back into sync only if needed.

There is possibility of timeout to happen any time even during the=20
capture also and is not related to hw reset.

Manual synchronization is needed when timeout of any frame events happen=20
otherwise all subsequence frames will timeout due to mismatch in event=20
counters.
