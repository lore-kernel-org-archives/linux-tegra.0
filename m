From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 3/7] ACPI: button: Access input device's users under
 appropriate mutex
Date: Thu, 25 Jun 2020 12:55:29 +0200
Message-ID: <CAJZ5v0hgQt-amMn8xiF_0kyVZ-9pQxgm5H-VcFpinVQGKnYhwQ@mail.gmail.com>
References: <2336e15d-ff4b-bbb6-c701-dbf3aa110fcd@redhat.com>
 <20200608112211.12125-1-andrzej.p@collabora.com> <20200608112211.12125-4-andrzej.p@collabora.com>
 <CAJZ5v0j7e9TzDtEiDXmj3fLAQ7CvFHoe7Q3aYKKas3PEXrsUuw@mail.gmail.com> <20200625052318.GE248110@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200625052318.GE248110@dtor-ws>
Sender: linux-acpi-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Linux PM <linux-pm@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-iio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, linux-input@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>Peter
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 25, 2020 at 7:23 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Jun 24, 2020 at 05:00:09PM +0200, Rafael J. Wysocki wrote:
> > On Mon, Jun 8, 2020 at 1:22 PM Andrzej Pietrasiewicz
> > <andrzej.p@collabora.com> wrote:
> > >
> > > Inspecting input device's 'users' member should be done under device's
> > > mutex, so add appropriate invocations.
> > >
> > > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> >
> > This looks like a fix that might be applied independently of the other
> > patches in the series.
> >
> > Do you want me to pick it up?
>
> If you pick it we'll have to have a dance with this series. Can I apply
> instead?

Yes, please.

Also feel free to add

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

to it.

> I do not think this change has any practical effect as nobody
> attaches/detached input handlers or opening/closing input devices when
> system goes through device resume phase.

Indeed.

Thanks!
