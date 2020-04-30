From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 30 Apr 2020 12:51:35 -0700
Message-ID: <9b2b36ad-82cb-bcf6-24d6-3533b51918c8@nvidia.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <34a49a30-71f2-5b24-20a4-7d98ae37cefa@gmail.com>
 <1b23178b-0e5c-c97e-434c-f9cc3c02805b@nvidia.com>
 <ebfb532b-bcd2-f356-49e0-e4d72d0db933@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <ebfb532b-bcd2-f356-49e0-e4d72d0db933@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/30/20 12:47 PM, Dmitry Osipenko wrote:
> 30.04.2020 22:32, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/30/20 6:38 AM, Dmitry Osipenko wrote:
>>> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> +/**
>>>> + * struct tegra_csi_ops - Tegra CSI operations
>>>> + *
>>>> + * @csi_streaming: programs csi hardware to enable or disable
>>>> streaming.
>>>> + * @csi_err_recover: csi hardware block recovery in case of any
>>>> capture errors
>>>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 due to missing source st=
ream or due to improper csi input
>>>> from
>>>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the external source.
>>>> + */
>>>> +struct tegra_csi_ops {
>>>> +=C2=A0=C2=A0=C2=A0 int (*csi_streaming)(struct tegra_csi_channel *csi=
_chan, u8
>>>> pg_mode,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 int enable);
>>> What about to split csi_streaming() into csi_start_streaming() /
>>> csi_stop_streaming()?
>>>
>>> This will make tegra_csi_ops to be consistent with the tegra_ve_ops. A
>>> separated start/stop operations are somewhat more natural to have in
>>> general.
>> vi ops is for vb2_ops which has separate start/stop so has seperate
>> start/stop for vi ops.
>>
>> csi is subdev and csi ops is for v4l2_subdev_ops which as s_stream
>> callback only.
>>
>> So, created single stream function for csi to match same as subdev_ops.
> It will be nicer to have separate ops for CSI, regardless of the
> subdev_ops. It should be okay to have a single-combined ops if CSI
> start/stop was trivial, but it's not the case here.
>
> For example, the pm_runtime_put() shouldn't be invoked if stream's
> stopping fails. The stopping can't fail for the current code, but this
> could change in the future.
>
> You could make csi_streaming to return void, telling explicitly that
> this code can't fail. Then the combined OPS should be okay to have.

we don't return anything for stop stream. OK can make it split to=20
explicitly specify no return code during stop stream.

will split this in v12
