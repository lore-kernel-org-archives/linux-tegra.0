From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 23 Apr 2020 09:50:57 -0700
Message-ID: <3115a959-045e-7b27-94fb-a11a8b5f4a6a@nvidia.com>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
 <ae6dfd6b-4b0b-db73-54cf-a16e59476f38@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ae6dfd6b-4b0b-db73-54cf-a16e59476f38-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/23/20 12:48 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> On 22/04/2020 08:18, Sowjanya Komatineni wrote:
>> Tegra210 contains a powerful Video Input (VI) hardware controller
>> which can support up to 6 MIPI CSI camera sensors.
>>
>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>> capture from an external camera sensor connected to CSI or from
>> built-in test pattern generator.
>>
>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>
>> This patch adds a v4l2 capture driver with media interface for
>> Tegra210 built-in CSI to VI test pattern generator.
>>
>> This patch includes TPG support only and all the video pipeline
>> configuration happens through the video device node.
>>
>> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/staging/media/Kconfig          |    2 +
>>   drivers/staging/media/Makefile         |    1 +
>>   drivers/staging/media/tegra/Kconfig    |   13 +
>>   drivers/staging/media/tegra/Makefile   |    8 +
>>   drivers/staging/media/tegra/TODO       |   10 +
>>   drivers/staging/media/tegra/common.h   |  262 ++++++++
>>   drivers/staging/media/tegra/csi.c      |  606 +++++++++++++++++
>>   drivers/staging/media/tegra/csi.h      |  149 +++++
>>   drivers/staging/media/tegra/tegra210.c |  709 ++++++++++++++++++++
>>   drivers/staging/media/tegra/tegra210.h |  190 ++++++
>>   drivers/staging/media/tegra/vi.c       | 1132 ++++++++++++++++++++++++++++++++
>>   drivers/staging/media/tegra/vi.h       |   83 +++
>>   drivers/staging/media/tegra/video.c    |  153 +++++
>>   drivers/staging/media/tegra/video.h    |   34 +
>>   14 files changed, 3352 insertions(+)
>>   create mode 100644 drivers/staging/media/tegra/Kconfig
>>   create mode 100644 drivers/staging/media/tegra/Makefile
>>   create mode 100644 drivers/staging/media/tegra/TODO
>>   create mode 100644 drivers/staging/media/tegra/common.h
>>   create mode 100644 drivers/staging/media/tegra/csi.c
>>   create mode 100644 drivers/staging/media/tegra/csi.h
>>   create mode 100644 drivers/staging/media/tegra/tegra210.c
>>   create mode 100644 drivers/staging/media/tegra/tegra210.h
>>   create mode 100644 drivers/staging/media/tegra/vi.c
>>   create mode 100644 drivers/staging/media/tegra/vi.h
>>   create mode 100644 drivers/staging/media/tegra/video.c
>>   create mode 100644 drivers/staging/media/tegra/video.h
> With 'make menuconfig' I get this:
>
> scripts/kconfig/mconf  Kconfig
>
> WARNING: unmet direct dependencies detected for TEGRA_HOST1X
>    Depends on [n]: HAS_IOMEM [=y] && (ARCH_TEGRA || ARM && COMPILE_TEST [=y])
>    Selected by [y]:
>    - VIDEO_TEGRA [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && (ARCH_TEGRA || COMPILE_TEST [=y])
>
> This is an x86_64 build with COMPILE_TEST set. I can provide my full .config if you need it.
>
> CONFIG_TEGRA_HOST1X=y
> CONFIG_VIDEO_TEGRA=y
>
> Regards,
>
>          Hans

Hi Hans,

In v7, changed Kconfig to remove ARM. But looks like we should limit

TEGRA_HOST1X also limits compile to ARM only so running VIDEO_TEGRA on 
x86_64 shows above warning.

We should limit compile to ARM for CONFIG_VIDEO_TEGRA.

Will update CONFIG_VIDEO_TEGRA dependency to use ARM && COMPILE_TEST 
like I had in previous version. Sorry about this.


Also, I see some changes went into latest linux-next staging media 
Kconfig, So, will have my patches on top of today's linux-next.

Thanks

Sowjanya
