From: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Subject: Re: permission to move definition of struct rpmsg_channel_info
Date: Mon, 9 Sep 2013 22:06:24 +0200
Message-ID: <CAK=Wgbbxp5pfQm1mvCZ2phigXe_e2_J_Zkrof9tx2jggi8EMjQ@mail.gmail.com>
References: <5220F099.1020002@nvidia.com> <CAK=WgbZ2JgtAonvdyeDZazYBGdKpPAieJtjzi7MM6nwqhVfs7g@mail.gmail.com>
 <20130909125745.GD22197@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130909125745.GD22197@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arjun Gopalan <agopalan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Brian Swetland <swetland-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 9, 2013 at 2:57 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> If I understand correctly, the way that the services should be announced
> is via RSC_VDEV entries in the resource table?

Yes.

> Looking at the remoteproc core and ELF loader, it seems like the way to
> pass in the resource table is either via an extra ELF section or driver
> specific. TI drivers seem to use ELF, but the STE modem driver seems to
> employ some custom format.
>
> From what I understand this resource table can also be processed by the
> host to provide some of the resources such as carveout memory. So that
> the normal way for this to work would be something like:
>
>         - load firmware image
>           - obtain pointer to resource table
>         - process resource table
>           - allocate resources
>           - update table
>         - upload firmware to remote processor
>
> Upon which the remote processor probably needs to parse the resource
> table to set itself up. Does that sound about right?

Yeah, it generally does.

> > The way we were planning to add static channels functionality (I
> > should still have preliminary patches doing this somewhere but the
> > entire work was put on hold since TI changed its focus) is by
> > statically publishing them in the resource table, which is coupled
> > with a specific remote image.
>
> While I see that the format of all this is pretty well documented, are
> there any standard tools that can be used to embed the resource table
> into an ELF binary?

I'm not aware of any.

> I have a pretty good idea on how it could be done,
> but I wonder if it might make sense to provide some kind of a standard
> set of headers to make things easier so that not everyone has to
> reinvent the wheel.
>
> Looking at the remoteproc core, it seems that there's no direct way to
> change the firmware running on a remoteproc at runtime.

One way is to unload and load the driver, but you can also use the
bind/unbind sysfs files of your driver (echo -n device-name >
/sys/..../{un}bind).

Does that help?

Best,
Ohad.
