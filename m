From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 26 Mar 2020 16:48:20 +0200
Message-ID: <20200326144820.GB2394@valkosipuli.retiisi.org.uk>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <20200325110358.GB853@valkosipuli.retiisi.org.uk>
 <a219aeb2-3d00-016e-eed9-503a9fbd0d13@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a219aeb2-3d00-016e-eed9-503a9fbd0d13-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Sowjanya,

On Wed, Mar 25, 2020 at 11:30:18PM -0700, Sowjanya Komatineni wrote:
> 
> On 3/25/20 4:03 AM, Sakari Ailus wrote:
> > > +static int tegra_channel_enum_input(struct file *file, void *fh,
> > > +                                 struct v4l2_input *inp)
> > > +{
> > > +     /* currently driver supports internal TPG only */
> > > +     if (inp->index)
> > > +             return -EINVAL;
> > > +
> > > +     inp->type = V4L2_INPUT_TYPE_CAMERA;
> > > +     strscpy(inp->name, "Tegra TPG", sizeof(inp->name));
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int tegra_channel_g_input(struct file *file, void *priv,
> > > +                              unsigned int *i)
> > > +{
> > > +     *i = 0;
> > > +     return 0;
> > > +}
> > > +
> > > +static int tegra_channel_s_input(struct file *file, void *priv,
> > > +                              unsigned int input)
> > > +{
> > > +     if (input > 0)
> > > +             return -EINVAL;
> > > +
> > > +     return 0;
> > > +}
> > Please see patchset on topic "v4l2-dev/ioctl: Add V4L2_CAP_IO_MC" on
> > linux-media; it's relevant here, too.
> 
> Can update in v6 to add device caps V4L2_CAP_IO_MC and remove enum/g/s_input
> ioctls.
> 
> But, I don't see this patch "v4l2-dev/ioctl: Add V4L2_CAP_IO_MC" on latest
> linux-next

It's not merged yet but likely will be very soon.

-- 
Sakari Ailus
