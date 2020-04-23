From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 23 Apr 2020 15:59:21 -0700
Message-ID: <843d1276-1281-7f02-ce08-d0dad52bb681@nvidia.com>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
 <ae6dfd6b-4b0b-db73-54cf-a16e59476f38@xs4all.nl>
 <3115a959-045e-7b27-94fb-a11a8b5f4a6a@nvidia.com>
 <db413479-1557-3c40-ecb2-5a0c657065b6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <db413479-1557-3c40-ecb2-5a0c657065b6@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/23/20 3:55 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 23.04.2020 19:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/23/20 12:48 AM, Hans Verkuil wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On 22/04/2020 08:18, Sowjanya Komatineni wrote:
>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>
>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>> capture from an external camera sensor connected to CSI or from
>>>> built-in test pattern generator.
>>>>
>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>
>>>> This patch adds a v4l2 capture driver with media interface for
>>>> Tegra210 built-in CSI to VI test pattern generator.
>>>>
>>>> This patch includes TPG support only and all the video pipeline
>>>> configuration happens through the video device node.
>>>>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>    drivers/staging/media/Kconfig          |=C2=A0=C2=A0=C2=A0 2 +
>>>>    drivers/staging/media/Makefile         |=C2=A0=C2=A0=C2=A0 1 +
>>>>    drivers/staging/media/tegra/Kconfig    |=C2=A0=C2=A0 13 +
>>>>    drivers/staging/media/tegra/Makefile   |=C2=A0=C2=A0=C2=A0 8 +
>>>>    drivers/staging/media/tegra/TODO       |=C2=A0=C2=A0 10 +
>>>>    drivers/staging/media/tegra/common.h   |=C2=A0 262 ++++++++
>>>>    drivers/staging/media/tegra/csi.c      |=C2=A0 606 ++++++++++++++++=
+
>>>>    drivers/staging/media/tegra/csi.h      |=C2=A0 149 +++++
>>>>    drivers/staging/media/tegra/tegra210.c |=C2=A0 709 ++++++++++++++++=
++++
>>>>    drivers/staging/media/tegra/tegra210.h |=C2=A0 190 ++++++
>>>>    drivers/staging/media/tegra/vi.c       | 1132
>>>> ++++++++++++++++++++++++++++++++
>>>>    drivers/staging/media/tegra/vi.h       |=C2=A0=C2=A0 83 +++
>>>>    drivers/staging/media/tegra/video.c    |=C2=A0 153 +++++
>>>>    drivers/staging/media/tegra/video.h    |=C2=A0=C2=A0 34 +
>>>>    14 files changed, 3352 insertions(+)
>>>>    create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>    create mode 100644 drivers/staging/media/tegra/Makefile
>>>>    create mode 100644 drivers/staging/media/tegra/TODO
>>>>    create mode 100644 drivers/staging/media/tegra/common.h
>>>>    create mode 100644 drivers/staging/media/tegra/csi.c
>>>>    create mode 100644 drivers/staging/media/tegra/csi.h
>>>>    create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>>    create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>    create mode 100644 drivers/staging/media/tegra/vi.c
>>>>    create mode 100644 drivers/staging/media/tegra/vi.h
>>>>    create mode 100644 drivers/staging/media/tegra/video.c
>>>>    create mode 100644 drivers/staging/media/tegra/video.h
>>> With 'make menuconfig' I get this:
>>>
>>> scripts/kconfig/mconf  Kconfig
>>>
>>> WARNING: unmet direct dependencies detected for TEGRA_HOST1X
>>>     Depends on [n]: HAS_IOMEM [=3Dy] && (ARCH_TEGRA || ARM &&
>>> COMPILE_TEST [=3Dy])
>>>     Selected by [y]:
>>>     - VIDEO_TEGRA [=3Dy] && STAGING [=3Dy] && STAGING_MEDIA [=3Dy] &&
>>> MEDIA_SUPPORT [=3Dy] && (ARCH_TEGRA || COMPILE_TEST [=3Dy])
>>>
>>> This is an x86_64 build with COMPILE_TEST set. I can provide my full
>>> .config if you need it.
>>>
>>> CONFIG_TEGRA_HOST1X=3Dy
>>> CONFIG_VIDEO_TEGRA=3Dy
>>>
>>> Regards,
>>>
>>>           Hans
>> Hi Hans,
>>
>> In v7, changed Kconfig to remove ARM. But looks like we should limit
>>
>> TEGRA_HOST1X also limits compile to ARM only so running VIDEO_TEGRA on
>> x86_64 shows above warning.
>>
>> We should limit compile to ARM for CONFIG_VIDEO_TEGRA.
>>
>> Will update CONFIG_VIDEO_TEGRA dependency to use ARM && COMPILE_TEST
>> like I had in previous version. Sorry about this.
>>
>>
>> Also, I see some changes went into latest linux-next staging media
>> Kconfig, So, will have my patches on top of today's linux-next.
> VIDEO_TEGRA should depend on TEGRA_HOST1X and not select it.
>
> depends on (ARCH_TEGRA && TEGRA_HOST1X) || COMPILE_TEST

Was selecting it to auto-select Tegra host1x when video_tegra is enabled.

Yes, can use depends on
