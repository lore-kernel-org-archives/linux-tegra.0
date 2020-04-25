From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sat, 25 Apr 2020 16:47:42 -0700
Message-ID: <cefa2bbb-5d29-1ea8-9c28-b5470a4c9535@nvidia.com>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <fd5300fd-33af-babe-95d0-9669b66a8c06@gmail.com>
 <2983577f-fec9-f24c-0563-6d1f0e1dd5d8@gmail.com>
 <32e30b7f-865b-282e-5e19-e4c8cf217e63@nvidia.com>
 <3f2916eb-dcd4-58c3-4d45-7f88620d4a83@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3f2916eb-dcd4-58c3-4d45-7f88620d4a83@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/25/20 4:44 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 02:27, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/25/20 4:25 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 26.04.2020 02:13, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 24.04.2020 06:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> +static int __maybe_unused vi_runtime_resume(struct device *dev)
>>>>> +{
>>>>> +    struct tegra_vi *vi =3D dev_get_drvdata(dev);
>>>>> +    int ret;
>>>>> +
>>>>> +    ret =3D regulator_enable(vi->vdd);
>>>>> +    if (ret) {
>>>>> +            dev_err(dev, "failed to enable VDD supply: %d\n", ret);
>>>>> +            return ret;
>>>>> +    }
>>>>> +
>>>>> +    ret =3D clk_set_rate(vi->clk, vi->soc->vi_max_clk_hz);
>>>>> +    if (ret) {
>>>>> +            dev_err(dev, "failed to set vi clock rate: %d\n", ret);
>>>>> +            goto disable_vdd;
>>>>> +    }
>>>> Isn't setting clock rate using assigned-clocks in a device-tree enough=
?
>>>> Could you please clarify why this vi_max_clk_hz is needed?
>>>>
>>> In that case it should be wrong to set the clock rate in the RPM
>>> callback because RPM works asynchronously and RPM may not be suspended
>>> on TGP -> sensor source switch.
>> Driver will not do TPG and Sensor switch dynamically.
>>
>> Based on kconfig, it will only do TPG or Sensor and sensor will be
>> default all the time once sensor support is added in next series.
>>
> Doesn't V4L have a native support for the capture source selection? Why
> it needs to be a compile-time option?
>
> I think other drivers use a generic V4L "Image Processing Controls" with
> a configurable test_pattern option.

selecting test pattern thru v4l2 controls is once device graph is=20
already set for TPG to choose test pattern modes.

But as internal TPG is b/w CSI and VI only, device graph is diff and for=20
sensor device graph is different.


Based on internal discussion and discussion with Hans, decided to use=20
kconfig for TPG Vs Sensor and TPG is rarely used only to test driver=20
without sensor
