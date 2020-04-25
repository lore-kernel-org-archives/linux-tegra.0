From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sat, 25 Apr 2020 11:36:19 +0200
Message-ID: <62546d1f-eca5-06be-2bc2-e45ccd53830a@xs4all.nl>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6ca93ff9-ca59-544f-767c-4355d01a5c20-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 24/04/2020 17:11, Dmitry Osipenko wrote:
> 24.04.2020 06:55, Sowjanya Komatineni пишет:
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
>>  drivers/staging/media/Kconfig          |    2 +
>>  drivers/staging/media/Makefile         |    1 +
>>  drivers/staging/media/tegra/Kconfig    |   12 +
>>  drivers/staging/media/tegra/Makefile   |    8 +
>>  drivers/staging/media/tegra/TODO       |   10 +
>>  drivers/staging/media/tegra/common.h   |  259 ++++++++
>>  drivers/staging/media/tegra/csi.c      |  604 +++++++++++++++++
>>  drivers/staging/media/tegra/csi.h      |  144 ++++
>>  drivers/staging/media/tegra/tegra210.c |  708 ++++++++++++++++++++
>>  drivers/staging/media/tegra/tegra210.h |  190 ++++++
>>  drivers/staging/media/tegra/vi.c       | 1127 ++++++++++++++++++++++++++++++++
>>  drivers/staging/media/tegra/vi.h       |   72 ++
>>  drivers/staging/media/tegra/video.c    |  153 +++++
>>  drivers/staging/media/tegra/video.h    |   29 +
> 
> The media/tegra/ sounds a bit too generic, the media/tegra-vi/ path
> should better reflect the driver, IMO.
> 
> It also should be better to name the compiled kernel module as tegra-vi,
> IMO.
> 

The driver name and the directory should be in sync, so either tegra-video
or tegra-vi for both. I have no preference myself, as long as they are the
same.

This can be done as a follow-up patch.

Regards,

	Hans
