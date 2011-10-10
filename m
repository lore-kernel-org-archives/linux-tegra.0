From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: fix another compilation error in 3.1-rc9
Date: Mon, 10 Oct 2011 10:45:48 -0700
Message-ID: <CAOesGMgyYebNw1vphaKf8SPLBvtSvwPa0nCLxr81UJ-BtSRhzA@mail.gmail.com>
References: <3546151.Ds9gZv0JqE@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3546151.Ds9gZv0JqE@fb07-iapwap2>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

[Adding Grant, SPI maintainer]

Hi,

I can't reproduce this problem. CONFIG_SPI doesn't seem to be on for
tegra_defconfig (I'll revisit the defconfig and turn on missing
options for 3.2), but even after I enable it (plus CONFIG_SPI_TEGRA),
I don't see any errors here. I tried static build as well as module.
Can you provide more detail to what you're seeing?


Also, for future patches:

* Please add your free-form comment below the "---" in the commit
message. That way git apply-mbox will just automatically do the right
thing and leave it out from the patch
* If you include the compiler error output it's easier for others to
find the error on the lists and avoid duplicate patch submissions.


Thanks!

-Olof

On Mon, Oct 10, 2011 at 2:17 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> Hi Olof,
>
> sorry for being so late, but here is another last minute patch.
>
> Marc
>
> -----
>
> spi/tegra: fix compilation error in spi-tegra.c
>
> This adds the missing #include <linux/module.h> to spi-tegra.c
>
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
>
> diff --git a/drivers/spi/spi-tegra.c b/drivers/spi/spi-tegra.c
> index a5a6302..e8cd58f 100644
> --- a/drivers/spi/spi-tegra.c
> +++ b/drivers/spi/spi-tegra.c
> @@ -18,6 +18,7 @@
> =A0*/
>
> =A0#include <linux/kernel.h>
> +#include <linux/module.h>
> =A0#include <linux/init.h>
> =A0#include <linux/err.h>
> =A0#include <linux/platform_device.h>
>
>
