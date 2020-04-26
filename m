From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sat, 25 Apr 2020 20:03:43 -0700
Message-ID: <fddb9a1e-c8be-1339-5a06-f3f41541896a@nvidia.com>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
 <62546d1f-eca5-06be-2bc2-e45ccd53830a@xs4all.nl>
 <50fd1016-ca8b-ec5d-e5a8-f257138b152e@gmail.com>
 <658c4232-94d9-3051-8c93-bff7046cf5f2@nvidia.com>
 <03426915-25ea-69b4-bc64-f87f3046d33f@nvidia.com>
 <aabaecc4-3494-0137-7d2b-853304bfa68b@gmail.com>
 <09f20441-fec6-7496-2edc-c69db535e441@nvidia.com>
 <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
 <3a9707b5-b260-6137-f475-fc88d271010f@nvidia.com>
 <a7407ed7-f35e-b3e9-ad26-3e83f0ed462b@gmail.com>
 <024fc70f-9a65-3fc4-1387-d0b15f3f74e7@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <024fc70f-9a65-3fc4-1387-d0b15f3f74e7@nvidia.com>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/25/20 7:48 PM, Sowjanya Komatineni wrote:
>
> On 4/25/20 7:38 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 26.04.2020 05:19, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 4/25/20 7:10 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 26.04.2020 04:43, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> ...
>>>>>> It looks to me that at least all those hardcoded HW format IDs do=20
>>>>>> not
>>>>>> match the older SoCs.
>>>>> TPG hard coded formats are supported on prior Tegra.
>>>>>
>>>>> Other supported formats are SoC dependent and=C2=A0 part of soc data =
in=20
>>>>> the
>>>>> driver already.
>>>> But I don't see where that SoC-dependent definition is made in
>>>> terga210.c. That tegra_image_format enum looks T210-specific, isn't=20
>>>> it?
>>>>
>>>> ...
>>> Video formats which are SoC variants are made soc specific in driver
>>> already tegra_vi_soc structure member video_formats
>>>
>>> tegra_image_format enum is same for T210 and T186
>>>
>>> For T194, enums will be diff and will have diff TEGRA194_VIDEO_FORMAT
>>> using corresponding Tegra194 video format enums
>> But it is also not the same for older SoCs, correct? All the
>> T210-specific things should be separated better, unique parts shouldn't
>> be kept in the common code.
>>
>> Hence the tegra_image_format should be renamed to tegra210_image_format
>> and moved out to t210.h, since it's not common. But then you'll probably
>> need to rename all TEGRA_ defines to TEGRA210_ to make t210.h reusable
>> by T186.
>
> We can't make t210.h reusable for t186 as all register defines are diff.
>
> only video format enums are same b/w them so to reuse that for t186 I=20
> had that in common.
>
> Regarding defines, will change prefix as Tegra210
>
>>
>> Also, in the end it may not worth the effort to share anything at all,
>> it could be cleaner to have a bit of duplication. Although, I have no
>> idea how T186 code will look like and what other parts of T210 could be
>> reused by T186. All this needs to be taken into account in order to
>> avoid struggling with the code's reshuffling in the future.
>
> Currently as image formats are same for t210 and t186 I had them in=20
> common.h and for t194 where they are diff new enums will be added.
>
> Other tegra210 soc specific only are all part of tegra210.c/h
>
Will move video formats to tegra specific file (tegra210.c)...
