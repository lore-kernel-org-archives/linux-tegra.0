From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v4 3/7] ACPI: button: Access input device's users under
 appropriate mutex
Date: Wed, 24 Jun 2020 22:23:18 -0700
Message-ID: <20200625052318.GE248110@dtor-ws>
References: <2336e15d-ff4b-bbb6-c701-dbf3aa110fcd@redhat.com>
 <20200608112211.12125-1-andrzej.p@collabora.com>
 <20200608112211.12125-4-andrzej.p@collabora.com>
 <CAJZ5v0j7e9TzDtEiDXmj3fLAQ7CvFHoe7Q3aYKKas3PEXrsUuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJZ5v0j7e9TzDtEiDXmj3fLAQ7CvFHoe7Q3aYKKas3PEXrsUuw@mail.gmail.com>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Linux PM <linux-pm@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-iio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, linux-input@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kuk
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 24, 2020 at 05:00:09PM +0200, Rafael J. Wysocki wrote:
> On Mon, Jun 8, 2020 at 1:22 PM Andrzej Pietrasiewicz
> <andrzej.p@collabora.com> wrote:
> >
> > Inspecting input device's 'users' member should be done under device's
> > mutex, so add appropriate invocations.
> >
> > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> 
> This looks like a fix that might be applied independently of the other
> patches in the series.
> 
> Do you want me to pick it up?

If you pick it we'll have to have a dance with this series. Can I apply
instead?

I do not think this change has any practical effect as nobody
attaches/detached input handlers or opening/closing input devices when
system goes through device resume phase.

> 
> > ---
> >  drivers/acpi/button.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/acpi/button.c b/drivers/acpi/button.c
> > index 78cfc70cb320..ff7ab291f678 100644
> > --- a/drivers/acpi/button.c
> > +++ b/drivers/acpi/button.c
> > @@ -456,13 +456,16 @@ static int acpi_button_resume(struct device *dev)
> >  {
> >         struct acpi_device *device = to_acpi_device(dev);
> >         struct acpi_button *button = acpi_driver_data(device);
> > +       struct input_dev *input = button->input;
> >
> >         button->suspended = false;
> > -       if (button->type == ACPI_BUTTON_TYPE_LID && button->input->users) {
> > +       mutex_lock(&input->mutex);
> > +       if (button->type == ACPI_BUTTON_TYPE_LID && input->users) {
> >                 button->last_state = !!acpi_lid_evaluate_state(device);
> >                 button->last_time = ktime_get();
> >                 acpi_lid_initialize_state(device);
> >         }
> > +       mutex_unlock(&input->mutex);
> >         return 0;
> >  }
> >  #endif
> > --
> > 2.17.1
> >

Thanks.

-- 
Dmitry
