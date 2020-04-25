From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sat, 25 Apr 2020 16:44:04 -0700
Message-ID: <f3a122b9-3600-b1eb-be4f-39be79d979a5@nvidia.com>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <3155e0d2-94b0-6e0a-bf35-b3560c201039@gmail.com>
 <fffc09d1-a25f-2d6e-83bd-f7657dd2ff16@nvidia.com>
 <e5602c48-a73e-8e71-188d-6a53ebf8e4a4@gmail.com>
 <f6d62dde-9ab5-7001-0ff4-93ed70cb207f@nvidia.com>
 <6568af00-3d65-4ddb-f003-7a4161d751a0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <6568af00-3d65-4ddb-f003-7a4161d751a0@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/25/20 4:40 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 01:11, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/25/20 3:08 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 25.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 4/24/20 8:07 AM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 24.04.2020 06:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>
>>>>> Is this driver compiled as a single kernel module file?
>>>>>
>>>>>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>>>>>> +MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
>>>>>> +MODULE_LICENSE("GPL v2");
>>>>> ...
>>>>>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>>>>>> +MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
>>>>>> +MODULE_LICENSE("GPL v2");
>>>>> I don't think that these macros are needed in that case.
>>>>> The video.c should be enough, isn't it?
>>>> yes these can be removed
>>> It will be nice to factor out the Tegra210-specific VI/CSI OPS into a
>>> separate driver module (say tegra210-vi) to ease supporting of other
>>> Tegra versions. Of course this could be done later on, although I
>>> suppose the amount of hassle could be reduced if it's done from the
>>> start.
>> vi/csi.c are common drivers for all Tegras. All Tegra chip specific
>> related programming for both vi and csi were already moved to Tegra210.c
>> based on prior feedbacks.
> Judging by the code's structure the VI/CSI drivers aren't planned to be
> reused by older pre-Terga210 SoCs, correct?
>
> How much of the T210 code could be reused by T186/194?

vi/csi are common driver where soc structure should be populated for=20
T186/T194

Tegra210.c can't be reused for Tegra186/t194 as programming seq is a=20
whole lot diff
