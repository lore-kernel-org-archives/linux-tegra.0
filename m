From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v1 3/5] media: tegra-video: Move PM runtime handle to
 streaming
Date: Tue, 28 Apr 2020 08:08:29 -0700
Message-ID: <18a7b095-7f0f-7819-c786-7e011cfd14ed@nvidia.com>
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
 <1588047650-29402-4-git-send-email-skomatineni@nvidia.com>
 <631390cb-9aff-0e3f-6c39-81d6c565987e@gmail.com>
 <3ef69413-a606-b475-f530-d5534760b73b@nvidia.com>
 <2b334095-fadb-bf0a-f7a8-62fc798c2bd2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2b334095-fadb-bf0a-f7a8-62fc798c2bd2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/28/20 7:59 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 28.04.2020 17:51, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/28/20 6:59 AM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 28.04.2020 07:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> diff --git a/drivers/staging/media/tegra-video/csi.c
>>>> b/drivers/staging/media/tegra-video/csi.c
>>>> index b3dd0c3..29ccdae 100644
>>>> --- a/drivers/staging/media/tegra-video/csi.c
>>>> +++ b/drivers/staging/media/tegra-video/csi.c
>>>> @@ -272,8 +272,25 @@ static int tegra_csi_s_stream(struct v4l2_subdev
>>>> *subdev, int enable)
>>>>         struct tegra_vi_channel *chan =3D v4l2_get_subdev_hostdata(sub=
dev);
>>>>         struct tegra_csi_channel *csi_chan =3D to_csi_chan(subdev);
>>>>         struct tegra_csi *csi =3D csi_chan->csi;
>>>> +     int ret;
>>>> +
>>>> +     if (enable && atomic_add_return(1, &csi->clk_refcnt) =3D=3D 1) {
>>>> +             ret =3D pm_runtime_get_sync(csi->dev);
>>>> +             if (ret < 0) {
>>>> +                     dev_err(csi->dev,
>>>> +                             "failed to get runtime PM: %d\n", ret);
>>>> +                     pm_runtime_put_noidle(csi->dev);
>>>> +                     atomic_dec(&csi->clk_refcnt);
>>>> +                     return ret;
>>>> +             }
>>>> +     }
>>>> +
>>>> +     ret =3D csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable)=
;
>>>>
>>>> -     return csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
>>>> +     if ((ret < 0 || !enable) && atomic_dec_and_test(&csi->clk_refcnt=
))
>>>> +             pm_runtime_put_sync(csi->dev);
>>> Runtime PM maintains its own refcount, why these
>>> clk_refcnt/power_on_refcnt are needed?
>> Streaming is per channel and we can't turn power/clocks off while other
>> channels may still be running.
>>
> All channels use the same CSI device. You should remove the custom
> refcounting.
>
> BTW, next time you'll really need to do refcounting, use the generic kref=
.

Before channel stream we enable power/clocks and after streaming we stop.

So without refcount, on stream stop of any of the channel RPM put turns=20
power/clock but other channels will still be streaming.
