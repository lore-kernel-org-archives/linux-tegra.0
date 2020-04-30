From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 30 Apr 2020 09:29:00 -0700
Message-ID: <7d31d24f-f353-7e82-3ff9-cdba8b773d1e@nvidia.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
 <4da289e6-036f-853b-beb4-379d6462adb0@gmail.com>
 <c6d54885-6f23-f60c-a17b-3481fc4d6adf@gmail.com>
 <b14b9dc5-7ac9-7735-d98d-eebc7e151cba@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b14b9dc5-7ac9-7735-d98d-eebc7e151cba@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/30/20 9:04 AM, Sowjanya Komatineni wrote:
>
> On 4/30/20 7:13 AM, Dmitry Osipenko wrote:
>> 30.04.2020 17:02, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 30.04.2020 16:56, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> +static int chan_capture_kthread_finish(void *data)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D data;
>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 set_freezable();
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 while (1) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try_to_freeze();
>>>> I guess it won't be great to freeze in the middle of a capture=20
>>>> process, so:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (list_empty(&chan->done)=
)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try=
_to_freeze();
>>> And here should be some locking protection in order not race with the
>>> chan_capture_kthread_start because kthread_finish could freeze before
>>> kthread_start.
>> Or maybe both start / finish threads should simply be allowed to freeze
>> only when both capture and done lists are empty.
>>
>> if (list_empty(&chan->capture) &&
>> =C2=A0=C2=A0=C2=A0=C2=A0 list_empty(&chan->done))
>> =C2=A0=C2=A0=C2=A0=C2=A0try_to_freeze();
>
> good to freeze when not in middle of the frame capture but why should=20
> we not allow freeze in between captures?
>
> Other drivers do allow freeze in between frame captures.
>
> I guess we can freeze before dequeue for capture and in finish thread=20
> we can freeze after capture done. This also don't need to check for=20
> list_empty with freeze to allow between frame captures.
>
Also if we add check for both lists empty, freeze is not allowed as long=20
as streaming is going on and in case of continuous streaming freeze will=20
never happen.
