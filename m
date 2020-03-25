From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
Date: Wed, 25 Mar 2020 12:09:40 +0100
Message-ID: <af710b95-55a5-8f20-6617-c1e6f9a3fe79@xs4all.nl>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <20200325110358.GB853@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200325110358.GB853-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 3/25/20 12:03 PM, Sakari Ailus wrote:
> Hi Sowjanya,
> 
> Thanks for the patchset.
> 
> On Mon, Mar 23, 2020 at 10:52:32AM -0700, Sowjanya Komatineni wrote:
>> Tegra210 contains a powerful Video Input (VI) hardware controller
>> which can support up to 6 MIPI CSI camera sensors.
>>
>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>> capture from an external camera sensor connected to CSI or from
>> built-in test pattern generator.
>>
>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>
>> This patch adds a V4L2 media controller and capture driver support
>> for Tegra210 built-in CSI to VI test pattern generator.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/staging/media/Kconfig              |    2 +
>>  drivers/staging/media/Makefile             |    1 +
>>  drivers/staging/media/tegra/Kconfig        |   10 +
>>  drivers/staging/media/tegra/Makefile       |    8 +
>>  drivers/staging/media/tegra/TODO           |   10 +
>>  drivers/staging/media/tegra/tegra-common.h |  263 +++++++
>>  drivers/staging/media/tegra/tegra-csi.c    |  522 ++++++++++++++
>>  drivers/staging/media/tegra/tegra-csi.h    |  118 ++++
>>  drivers/staging/media/tegra/tegra-vi.c     | 1058 ++++++++++++++++++++++++++++
>>  drivers/staging/media/tegra/tegra-vi.h     |   83 +++
>>  drivers/staging/media/tegra/tegra-video.c  |  129 ++++
>>  drivers/staging/media/tegra/tegra-video.h  |   32 +
>>  drivers/staging/media/tegra/tegra210.c     |  754 ++++++++++++++++++++
>>  drivers/staging/media/tegra/tegra210.h     |  192 +++++
> 
> Why staging? Are there reasons not to aim this to the kernel proper right
> away? If you only support TPG, the driver may not have too many (if any)
> real users anyway.

A TPG-only driver is not very useful, and I do not believe that belongs in
the kernel proper. The next phase will add sensor support, and that's a good
time to move it in the kernel itself.

Regards,

	Hans
