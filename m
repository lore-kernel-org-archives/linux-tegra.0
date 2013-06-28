From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Fri, 28 Jun 2013 13:27:15 +0100
Message-ID: <CACxGe6vkM+awN94kU2GYfbXPdR=MgYwr=PbqmtD+=i5vmuVSnA@mail.gmail.com>
References: <CACxGe6t9ifg9VRfXKypuhie3pXVPneZqcBy+J1bFpUaUx32P7g@mail.gmail.com>
 <20130626.090030.1519009485651154440.hdoyu@nvidia.com> <CACxGe6te2RzFb6nkSZQFrzVX4fkQo4pyzLJ1D7Lf=440mE+jyg@mail.gmail.com>
 <20130628.114915.1341075505557760886.hdoyu@nvidia.com> <20130628103826.GA17680@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130628103826.GA17680@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Pawel.Moll-5wv7dgnIgG8@public.gmane.org" <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 28, 2013 at 11:38 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Jun 28, 2013 at 10:49:15AM +0200, Hiroshi Doyu wrote:
>> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Wed, 26 Jun 2013 12:03:20 +0200:
>>
>> > On Wed, Jun 26, 2013 at 7:00 AM, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> > > Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Tue, 25 Jun 2013 19:52:33 +0200:
>> > >
>> > >> > Here's my workaround. I need to call of_detach_node() with OF_DYNAMIC
>> > >> > to avoid duplicated device registration.
>> > >>
>> > >> Gah! my eyes!
>> > >>
>> > >> Don't do that. It is incredibly problematic. Look at inhibiting
>> > >> duplicate device creation instead.
>> > >
>> > > I may not follow this thread correctly, but could anyone point out the
>> > > above "inhibiting duplicate device creation" if there's already such
>> > > solution?
>> >
>> > No, the solution doesn't exist yet, but it wouldn't be hard to
>> > implement. What you need to do is to add a struct device pointer to
>> > struct device_node, and set the pointer to the struct device when
>> > of_platform_device_create creates a device. (it would also need to be
>> > set for early_platform_device creation, but that's not something that
>> > should affect you). You would also add a check to
>> > of_platform_device_create to check if the device pointer is already
>> > set. If it is, then skip creation of the device.
>>
>> Implemented as Grant suggested. At least this works for our case,
>> where IOMMU needs to be instanciated earlier than other device[1].
>> early_platform_device case still need to be covered.
>
> I think we arrived at a different conclusion in another branch of this
> thread. With the patch below every driver needs to explicitly allocate
> the platform device and set the struct device_node's .dev field, which
> has other side-effects such as the device hierarchy getting messed up.
>
> A better alternative would be to have of_platform_populate() run early
> such that the .dev field in the struct device_node can be set by core
> code, which would not require every driver to be changed.
>
> I'm not sure exactly what needs to be done to make this work, however.
> Grant, can you provide some guidance here as to how this may be fixed?
> Where would we have to call of_platform_populate() from and what makes
> this break with the current implementation?

Try it and see!  :-) I cannot give a definite answer, but I suspect
that it will fall down when registering the devices on to the
platform_bus because it isn't initialized yet. If called early, the
code would need to hold the platform_device in some kind of deferred
list until the platform bus was initialize, and then have a cleanup
function at initcall time to finish the registration of all early
devices.

g.
