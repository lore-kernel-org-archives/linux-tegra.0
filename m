From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 3/7] ACPI: button: Access input device's users under
 appropriate mutex
Date: Wed, 24 Jun 2020 17:00:09 +0200
Message-ID: <CAJZ5v0j7e9TzDtEiDXmj3fLAQ7CvFHoe7Q3aYKKas3PEXrsUuw@mail.gmail.com>
References: <2336e15d-ff4b-bbb6-c701-dbf3aa110fcd@redhat.com>
 <20200608112211.12125-1-andrzej.p@collabora.com> <20200608112211.12125-4-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200608112211.12125-4-andrzej.p@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Linux PM <linux-pm@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-iio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, linux-input@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 8, 2020 at 1:22 PM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Inspecting input device's 'users' member should be done under device's
> mutex, so add appropriate invocations.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

This looks like a fix that might be applied independently of the other
patches in the series.

Do you want me to pick it up?

> ---
>  drivers/acpi/button.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/button.c b/drivers/acpi/button.c
> index 78cfc70cb320..ff7ab291f678 100644
> --- a/drivers/acpi/button.c
> +++ b/drivers/acpi/button.c
> @@ -456,13 +456,16 @@ static int acpi_button_resume(struct device *dev)
>  {
>         struct acpi_device *device = to_acpi_device(dev);
>         struct acpi_button *button = acpi_driver_data(device);
> +       struct input_dev *input = button->input;
>
>         button->suspended = false;
> -       if (button->type == ACPI_BUTTON_TYPE_LID && button->input->users) {
> +       mutex_lock(&input->mutex);
> +       if (button->type == ACPI_BUTTON_TYPE_LID && input->users) {
>                 button->last_state = !!acpi_lid_evaluate_state(device);
>                 button->last_time = ktime_get();
>                 acpi_lid_initialize_state(device);
>         }
> +       mutex_unlock(&input->mutex);
>         return 0;
>  }
>  #endif
> --
> 2.17.1
>
