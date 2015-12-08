From: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Subject: Re: [PATCH 1/2] drm: make drm_dev_set_unique() not use a format
 string
Date: Wed, 9 Dec 2015 00:52:58 +0100
Message-ID: <56676D5A.6060605@m4x.org>
References: <1449612732-32438-1-git-send-email-nicolas.iooss_linux@m4x.org>
 <CACvgo51hU5L5wDeViyR2AW5J1HYOc_rKRUQoEh9_u1qOx7vPXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACvgo51hU5L5wDeViyR2AW5J1HYOc_rKRUQoEh9_u1qOx7vPXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Terje_Bergstr=c3=b6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/09/2015 12:28 AM, Emil Velikov wrote:
> On 8 December 2015 at 22:12, Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org> wrote:
>> drm_dev_set_unique() uses a format string to define the unique name of a
>> device.  This feature is not used as currently all the calls to this
>> function either use "%s" as a format string or directly use
>> dev_name().
>>
>> Even though this second kind of call does not introduce security
>> problems, because there cannot be "%" characters in dev_name() results,
>> gcc issues a warning when building with -Wformat-security flag
>> ("warning: format string is not a string literal (potentially
>> insecure)").  This warning is useful to find real bugs like the one
>> fixed by commit 3958b79266b1 ("configfs: fix kernel infoleak through
>> user-controlled format string").  False positives which do not bring
>> an extra value make the work of finding real bugs harder.
>>
>> Therefore remove the format-string feature from drm_dev_set_unique().
>>
>> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
>> ---
>>  drivers/gpu/drm/drm_drv.c                   | 11 +++--------
>>  drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
>>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  2 +-
>>  include/drm/drmP.h                          |  2 +-
>>  4 files changed, 6 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 7dd6728dd092..20eaa0aae205 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -797,7 +797,7 @@ EXPORT_SYMBOL(drm_dev_unregister);
>>  /**
>>   * drm_dev_set_unique - Set the unique name of a DRM device
>>   * @dev: device of which to set the unique name
>> - * @fmt: format string for unique name
>> + * @name: unique name
>>   *
>>   * Sets the unique name of a DRM device using the specified format string and
>>   * a variable list of arguments. Drivers can use this at driver probe time if
> You might want to also update the above hunk :-)

Indeed, thanks! I will wait a little bit for other feedbacks, read all
the comments/documentation to see if anything else needs an update and
submit a v2.

Nicolas
