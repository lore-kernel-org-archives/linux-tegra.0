From: "Rafael J. Wysocki" <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/7] Support inhibiting input devices
Date: Wed, 10 Jun 2020 16:01:45 +0200
Message-ID: <CAJZ5v0gVBzLpQqNrV-kzV84mLB86Gd6Ws63RwBKT=r1WgbeDSQ@mail.gmail.com>
References: <2336e15d-ff4b-bbb6-c701-dbf3aa110fcd@redhat.com>
 <20200608112211.12125-1-andrzej.p@collabora.com> <964ca07a-3da5-101f-7edf-64bdeec98a4b@redhat.com>
 <CAJZ5v0hB2ra2K=dd9ZjVyy1V2b1PmFHm79uDO2HtHU1D_4YUbw@mail.gmail.com>
 <6136f26c-e090-e025-af55-4c5f3a6aec92@collabora.com> <3e61c9c1-b211-da9f-c55b-b44eb6522f2a@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3e61c9c1-b211-da9f-c55b-b44eb6522f2a-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "Rafael J. Wysocki" <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux PM <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ACPI Devel Maling List <linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Samsung SoC <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>Peter
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 10, 2020 at 3:21 PM Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> Hi,
>
> On 6/10/20 3:12 PM, Andrzej Pietrasiewicz wrote:
> > Hi All,
> >

[cut]

> > What would it mean to become a wakeup source if there are no users,
> > or nobody has ever opened the device? There are no interested
> > input handlers (users) so what's the point of becoming a wakeup
> > source? Why would the system need to wake up?
>
> Well this is what we have been doing so far, so arguably we
> need to keep doing it to avoid regressions / breaking our ABI.
>
> Lets for example take a laptop, where when suspended the
> power-button is the only valid wakeup-source and this is
> running good old slackware with fvwm2 or windowmaker as
> "desktop environment", then likely no process will have
> the power-button input evdev node open.  Still we should
> wakeup the laptop on the power-button press, otherwise
> it will never wakeup.
>
> Note I agree with you that the way this works is not
> ideal, I just do not think that we can change it.

Please note that "no users" merely means that user space is not
interested in receiving and processing the events from that device.

If it is configured for system wakeup, it doesn't matter whether or
not user space will consume the related events.

Thanks!
