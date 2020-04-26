From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sat, 25 Apr 2020 18:08:26 -0700
Message-ID: <03426915-25ea-69b4-bc64-f87f3046d33f@nvidia.com>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
 <62546d1f-eca5-06be-2bc2-e45ccd53830a@xs4all.nl>
 <50fd1016-ca8b-ec5d-e5a8-f257138b152e@gmail.com>
 <658c4232-94d9-3051-8c93-bff7046cf5f2@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <658c4232-94d9-3051-8c93-bff7046cf5f2-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/25/20 5:41 PM, Sowjanya Komatineni wrote:
>
> On 4/25/20 5:36 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 25.04.2020 12:36, Hans Verkuil =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> ...
>>>> The media/tegra/ sounds a bit too generic, the media/tegra-vi/ path
>>>> should better reflect the driver, IMO.
>>>>
>>>> It also should be better to name the compiled kernel module as=20
>>>> tegra-vi,
>>>> IMO.
>>>>
>>> The driver name and the directory should be in sync, so either=20
>>> tegra-video
>>> or tegra-vi for both. I have no preference myself, as long as they=20
>>> are the
>>> same.
>>>
>>> This can be done as a follow-up patch.
>> Given that this driver isn't going to be reused by older pre-Tegra210
>> SoCs, perhaps it will also be worthwhile to name it as tegra210-vi or
>> tegra210-video.
>
> Can you explain what do you meant by can't be reused for pre-tegra210=20
> or for tegra186/194?
>
> support for other tegra's can be added to same tegra-video driver.=20
> tegra-video host1x driver can be updated to add other tegra's vi and=20
> csi compatibles to host1x subdevs and vi and csi driver can be updated=20
> to add other tegra soc data and need to add coresponding=20
> tegra186/194/xxx.c file with tegra specific prog sequence
>
Same tegra-video.ko can be used for all tegra soc as driver supports=20
adding other soc related as well.

Also was thinking instead of renaming media/tegra as media/tegra-vi,=20
probably we can rename as media/tegra-video so it will be inline with=20
module name we already chosen and also mainly we have vi and csi with in=20
that so instead of tegra-vi probably we can use media/tegra-video?
