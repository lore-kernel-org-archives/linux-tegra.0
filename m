From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sat, 25 Apr 2020 19:19:13 -0700
Message-ID: <3a9707b5-b260-6137-f475-fc88d271010f@nvidia.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <61799fab-858c-8b0d-ba7d-846cd041e044-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/25/20 7:10 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 04:43, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>> It looks to me that at least all those hardcoded HW format IDs do not
>>> match the older SoCs.
>> TPG hard coded formats are supported on prior Tegra.
>>
>> Other supported formats are SoC dependent and  part of soc data in the
>> driver already.
> But I don't see where that SoC-dependent definition is made in
> terga210.c. That tegra_image_format enum looks T210-specific, isn't it?
>
> ...

Video formats which are SoC variants are made soc specific in driver=20
already tegra_vi_soc structure member video_formats

tegra_image_format enum is same for T210 and T186

For T194, enums will be diff and will have diff TEGRA194_VIDEO_FORMAT=20
using corresponding Tegra194 video format enums

>>> The driver will need to have a bit better separation if it's supposed t=
o
>>> have a common core for all SoCs. Each incompatible VI/CSI hardware
>>> version should have its own kernel module.
>> currently other Tegra host1x driver (drm) also does similar. Single
>> module for all Tegra SoCs.
> DRM driver has a proper separation of the sub-drivers where sub-driver
> won't load on unsupported hardware. The tegra-video driver should do the
> same, i.e. VI and CSI should be individual drivers (and not OPS). There
> could be a some common core, but for now it's not obvious to me what
> that core should be, maybe just the video.c.
>
>> With current tegra-video, all the v4l2 related common part of
>> implementation is same for all tegra's and only
>> tegra210.c/tegra186.c/tegra194.c will have corresponding tegra soc
>> specific vi/csi programming sequence.
> This code shouldn't be shared within the same driver module, IMO.
>
>
>>> The tegra-video should be okay, although the "video" part sounds a bit
>>> too broad since video could mean a lot of things. I think downstream
>>> kernel uses (or at least used) the tegra-camera name for the driver,
>>> perhaps it could be a reasonable variant as well.
>> prior feedback suggests not to use camera variant instead to use video
> Alright, then the tegra-video should be fine.
