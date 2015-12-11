From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm: make drm_dev_set_unique() not use a format
 string
Date: Fri, 11 Dec 2015 09:12:26 +0100
Message-ID: <20151211081226.GV20822@phenom.ffwll.local>
References: <1449612732-32438-1-git-send-email-nicolas.iooss_linux@m4x.org>
 <CACvgo51hU5L5wDeViyR2AW5J1HYOc_rKRUQoEh9_u1qOx7vPXA@mail.gmail.com>
 <56676D5A.6060605@m4x.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56676D5A.6060605@m4x.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Cc: Emil Velikov <emil.l.velikov@gmail.com>, Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, Alison Wang <alison.wang@freescale.com>, Stephen Warren <swarren@wwwdotorg.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 09, 2015 at 12:52:58AM +0100, Nicolas Iooss wrote:
> On 12/09/2015 12:28 AM, Emil Velikov wrote:
> > On 8 December 2015 at 22:12, Nicolas Iooss <nicolas.iooss_linux@m4x.org> wrote:
> >> drm_dev_set_unique() uses a format string to define the unique name of a
> >> device.  This feature is not used as currently all the calls to this
> >> function either use "%s" as a format string or directly use
> >> dev_name().
> >>
> >> Even though this second kind of call does not introduce security
> >> problems, because there cannot be "%" characters in dev_name() results,
> >> gcc issues a warning when building with -Wformat-security flag
> >> ("warning: format string is not a string literal (potentially
> >> insecure)").  This warning is useful to find real bugs like the one
> >> fixed by commit 3958b79266b1 ("configfs: fix kernel infoleak through
> >> user-controlled format string").  False positives which do not bring
> >> an extra value make the work of finding real bugs harder.
> >>
> >> Therefore remove the format-string feature from drm_dev_set_unique().
> >>
> >> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
> >> ---
> >>  drivers/gpu/drm/drm_drv.c                   | 11 +++--------
> >>  drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
> >>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  2 +-
> >>  include/drm/drmP.h                          |  2 +-
> >>  4 files changed, 6 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> >> index 7dd6728dd092..20eaa0aae205 100644
> >> --- a/drivers/gpu/drm/drm_drv.c
> >> +++ b/drivers/gpu/drm/drm_drv.c
> >> @@ -797,7 +797,7 @@ EXPORT_SYMBOL(drm_dev_unregister);
> >>  /**
> >>   * drm_dev_set_unique - Set the unique name of a DRM device
> >>   * @dev: device of which to set the unique name
> >> - * @fmt: format string for unique name
> >> + * @name: unique name
> >>   *
> >>   * Sets the unique name of a DRM device using the specified format string and
> >>   * a variable list of arguments. Drivers can use this at driver probe time if
> > You might want to also update the above hunk :-)
> 
> Indeed, thanks! I will wait a little bit for other feedbacks, read all
> the comments/documentation to see if anything else needs an update and
> submit a v2.

fyi 4.5 window for drm is closing in the next few days (because holidays
and all that). Please resend soon, otherwise it might miss and get delayed
to 4.6.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
