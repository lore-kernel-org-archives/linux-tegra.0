From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
Date: Tue, 31 Mar 2020 12:56:57 +0200
Message-ID: <ba37eb84-392c-3767-57f6-d297b0ab79a3@xs4all.nl>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <20200325110358.GB853@valkosipuli.retiisi.org.uk>
 <8bc44545-7d1e-0e37-db27-d37784679574@xs4all.nl>
 <20200331103215.GI2394@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200331103215.GI2394-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 3/31/20 12:32 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Mar 30, 2020 at 12:59:15PM +0200, Hans Verkuil wrote:
>> On 3/25/20 12:03 PM, Sakari Ailus wrote:
>>> Hi Sowjanya,
>>>
>>> Thanks for the patchset.
>>>
>>> On Mon, Mar 23, 2020 at 10:52:32AM -0700, Sowjanya Komatineni wrote:
>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>
>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>> capture from an external camera sensor connected to CSI or from
>>>> built-in test pattern generator.
>>>>
>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>
>>>> This patch adds a V4L2 media controller and capture driver support
>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>  drivers/staging/media/Kconfig              |    2 +
>>>>  drivers/staging/media/Makefile             |    1 +
>>>>  drivers/staging/media/tegra/Kconfig        |   10 +
>>>>  drivers/staging/media/tegra/Makefile       |    8 +
>>>>  drivers/staging/media/tegra/TODO           |   10 +
>>>>  drivers/staging/media/tegra/tegra-common.h |  263 +++++++
>>>>  drivers/staging/media/tegra/tegra-csi.c    |  522 ++++++++++++++
>>>>  drivers/staging/media/tegra/tegra-csi.h    |  118 ++++
>>>>  drivers/staging/media/tegra/tegra-vi.c     | 1058 ++++++++++++++++++++++++++++
>>>>  drivers/staging/media/tegra/tegra-vi.h     |   83 +++
>>>>  drivers/staging/media/tegra/tegra-video.c  |  129 ++++
>>>>  drivers/staging/media/tegra/tegra-video.h  |   32 +
>>>>  drivers/staging/media/tegra/tegra210.c     |  754 ++++++++++++++++++++
>>>>  drivers/staging/media/tegra/tegra210.h     |  192 +++++
>>>
>>> Why staging? Are there reasons not to aim this to the kernel proper right
>>> away? If you only support TPG, the driver may not have too many (if any)
>>> real users anyway.
>>>
>>>>  14 files changed, 3182 insertions(+)
>>>>  create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>  create mode 100644 drivers/staging/media/tegra/Makefile
>>>>  create mode 100644 drivers/staging/media/tegra/TODO
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>>>  create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>>  create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>
>>
>> <snip>
>>
>>>> +static int tegra_channel_g_input(struct file *file, void *priv,
>>>> +				 unsigned int *i)
>>>> +{
>>>> +	*i = 0;
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int tegra_channel_s_input(struct file *file, void *priv,
>>>> +				 unsigned int input)
>>>> +{
>>>> +	if (input > 0)
>>>> +		return -EINVAL;
>>>> +
>>>> +	return 0;
>>>> +}
>>>
>>> Please see patchset on topic "v4l2-dev/ioctl: Add V4L2_CAP_IO_MC" on
>>> linux-media; it's relevant here, too.
>>
>> No, it isn't. The pipeline is controlled by the driver, not by userspace.
>> This is a regular video capture driver, not an ISP driver.
> 
> I don't think that really makes a difference, whether a device is an ISP or
> not, but instead what does is whether there is something to control in its
> pipeline that cannot be generally done through the regular V4L2 interface.
> Even plain CSI-2 receiver drivers should be media device centric these days
> as doing otherwise excludes using a range of sensor drivers with them,
> including any possible future support for e.g. sensor embedded data.
> 

We've been back and forth on this before for this driver. I see no reason to make things
complicated, these are simple video pipelines for video capture. Making this media
device centric means that existing software using the BSP version of this driver require
a full rewrite, which is not desirable.

If we are going to require CSI receiver drivers to be media centric, then that's a
major departure of existing practice. And something that needs to be discussed first,
since that will require that support for each csi receiver driver is added to libcamera.
Is libcamera ready for that? Are common applications using libcamera yet?

Obviously, if NVIDIA decides that this is worth the effort, then I have no objection.
But I don't think it is something we should require at this stage.

Regards,

	Hans
