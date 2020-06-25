From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v4 4/7] ACPI: button: Use input_device_enabled() helper
Date: Wed, 24 Jun 2020 22:24:46 -0700
Message-ID: <20200625052446.GF248110@dtor-ws>
References: <2336e15d-ff4b-bbb6-c701-dbf3aa110fcd@redhat.com>
 <20200608112211.12125-1-andrzej.p@collabora.com>
 <20200608112211.12125-5-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200608112211.12125-5-andrzej.p@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 08, 2020 at 01:22:08PM +0200, Andrzej Pietrasiewicz wrote:
> A new helper is available, so use it.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/acpi/button.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/button.c b/drivers/acpi/button.c
> index ff7ab291f678..4deb2b48d03c 100644
> --- a/drivers/acpi/button.c
> +++ b/drivers/acpi/button.c
> @@ -411,7 +411,7 @@ static void acpi_button_notify(struct acpi_device *device, u32 event)
>  		input = button->input;
>  		if (button->type == ACPI_BUTTON_TYPE_LID) {
>  			mutex_lock(&button->input->mutex);
> -			users = button->input->users;
> +			users = input_device_enabled(button->input);
>  			mutex_unlock(&button->input->mutex);
>  			if (users)

This chunk (pre-patch) is really wrong. 'users' value is obsolete and
can not be trusted the moment we unlocked the mutex. "if" needs to be
inside critical section.

>  				acpi_lid_update_state(device, true);
> @@ -460,7 +460,7 @@ static int acpi_button_resume(struct device *dev)
>  
>  	button->suspended = false;
>  	mutex_lock(&input->mutex);
> -	if (button->type == ACPI_BUTTON_TYPE_LID && input->users) {
> +	if (button->type == ACPI_BUTTON_TYPE_LID && input_device_enabled(input)) {
>  		button->last_state = !!acpi_lid_evaluate_state(device);
>  		button->last_time = ktime_get();
>  		acpi_lid_initialize_state(device);
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry
