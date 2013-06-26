From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Wed, 26 Jun 2013 12:04:51 +0100
Message-ID: <CACxGe6vHL3Ha4jmq=XkCvSu+egMJ6djLN=DDu08yzxwms1UZBQ@mail.gmail.com>
References: <51C9AF96.3040107@wwwdotorg.org> <20130625.193628.2143557800560690024.hdoyu@nvidia.com>
 <CACxGe6t9ifg9VRfXKypuhie3pXVPneZqcBy+J1bFpUaUx32P7g@mail.gmail.com>
 <20130626.090030.1519009485651154440.hdoyu@nvidia.com> <CACxGe6te2RzFb6nkSZQFrzVX4fkQo4pyzLJ1D7Lf=440mE+jyg@mail.gmail.com>
 <20130626103135.GG27083@manwe>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130626103135.GG27083@manwe>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "Pawel.Moll-5wv7dgnIgG8@public.gmane.org" <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 26, 2013 at 11:31 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Jun 26, 2013 at 11:03:20AM +0100, Grant Likely wrote:
>> On Wed, Jun 26, 2013 at 7:00 AM, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> > Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Tue, 25 Jun 2013 19:52:33 +0200:
>> >
>> >> > Here's my workaround. I need to call of_detach_node() with OF_DYNAMIC
>> >> > to avoid duplicated device registration.
>> >>
>> >> Gah! my eyes!
>> >>
>> >> Don't do that. It is incredibly problematic. Look at inhibiting
>> >> duplicate device creation instead.
>> >
>> > I may not follow this thread correctly, but could anyone point out the
>> > above "inhibiting duplicate device creation" if there's already such
>> > solution?
>>
>> No, the solution doesn't exist yet, but it wouldn't be hard to
>> implement. What you need to do is to add a struct device pointer to
>> struct device_node, and set the pointer to the struct device when
>> of_platform_device_create creates a device. (it would also need to be
>> set for early_platform_device creation, but that's not something that
>> should affect you). You would also add a check to
>> of_platform_device_create to check if the device pointer is already
>> set. If it is, then skip creation of the device.
>
> One problem with this method is that every driver that needs or wants
> the device early has to do it explicitly, but I guess we can't have it
> all.

The other option is to modify of_device_add() to allow it to be called
before the platform bus is set up, and then to 'fixup' the
registrations at initcall time. That would mean of_platform_populate
can be called really early and it would solve the problem of
preserving the device hierarchy.

g.
