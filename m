From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sun, 26 Apr 2020 08:48:34 +0300
Message-ID: <01949632-c7e9-2b44-2c52-2d40e1632347@gmail.com>
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
 <99a5c82a-bd84-5c80-e6d7-7b6f2858aa78@gmail.com>
 <8c4f5e88-b47a-6b5c-b579-1b28be19feb5@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8c4f5e88-b47a-6b5c-b579-1b28be19feb5-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

26.04.2020 07:23, Sowjanya Komatineni пишет:
> 
> On 4/25/20 7:19 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 26.04.2020 05:10, Dmitry Osipenko пишет:
>> ...
>>>> currently other Tegra host1x driver (drm) also does similar. Single
>>>> module for all Tegra SoCs.
>>> DRM driver has a proper separation of the sub-drivers where sub-driver
>>> won't load on unsupported hardware. The tegra-video driver should do the
>>> same, i.e. VI and CSI should be individual drivers (and not OPS). There
>>> could be a some common core, but for now it's not obvious to me what
>>> that core should be, maybe just the video.c.
>> Maybe video.c csi.c vi.c could be moved into a separate module, somewhat
>> like a common driver framework. Then the individual CSI/VI drivers will
>> use those common helpers.. Just a quick thought.
> 
> structure of driver is based on prior feedback.
> 
> How about instead of re-structuring whole driver again, probably we can
> use conditional compatibles and also corresponding tegra210.o in
> Makefile based on ARCH_TEGRA?
> 
> #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>     { .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
> #endif

Yes, allowing user to disable the unneeded code should be good.
