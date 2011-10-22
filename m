From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: paz00: add support for the embedded controller
Date: Sat, 22 Oct 2011 13:27:12 -0700
Message-ID: <CAOesGMhVFk6n0n98akeVdM-cLtK9ip0-M01u9jy8WEdJNU+xsg@mail.gmail.com>
References: <cover.1319313019.git.marvin24@gmx.de>
	<b5f0dc6e7996a21d4493f8e7765e322fe6d8b7ef.1319313020.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b5f0dc6e7996a21d4493f8e7765e322fe6d8b7ef.1319313020.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Oct 22, 2011 at 1:16 PM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> This adds support for the embedded controller known as NVEC. The driv=
er
> lives currently in the staging tree and we aim to promote it one leve=
l
> higher in the near future.
>
> The NVEC driver uses the I2C resources of the master controller for n=
ow
> until slave support is added to the i2c-tegra driver.

> diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/=
board-paz00.c
> index 602f8dd..3f46b37 100644
> --- a/arch/arm/mach-tegra/board-paz00.c
> +++ b/arch/arm/mach-tegra/board-paz00.c
> @@ -44,6 +44,8 @@
> =A0#include "devices.h"
> =A0#include "gpio-names.h"
>
> +#include "../../../drivers/staging/nvec/nvec.h"

Ick, no! Move the header file containing platform data to
include/linux/platform_data instead (or break it off in a separate
header file).



> =A0static struct platform_device *paz00_devices[] __initdata =3D {
> =A0 =A0 =A0 =A0&debug_uart,
> =A0 =A0 =A0 =A0&tegra_sdhci_device4,
> @@ -127,6 +134,10 @@ static void paz00_i2c_init(void)
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device1);
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device2);
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device4);
> +
> + =A0 =A0 =A0 tegra_i2c_device3.name =3D "nvec";
> + =A0 =A0 =A0 tegra_i2c_device3.dev.platform_data =3D &nvec_pdata;
> + =A0 =A0 =A0 platform_device_register(&tegra_i2c_device3);

Please define a separate platform_device instead of hijacking the
current one, please.



-Olof
