From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v3 1/4] usb: otg: Add ulpi viewport access ops
Date: Thu, 17 Feb 2011 14:31:08 -0800
Message-ID: <20110217223108.GB22126@suse.de>
References: <1297980904-23466-1-git-send-email-benoit@android.com>
 <1297980904-23466-2-git-send-email-benoit@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1297980904-23466-2-git-send-email-benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 17, 2011 at 02:15:01PM -0800, Benoit Goby wrote:
> Add generic access ops for controllers with a ulpi viewport register
> (e.g. Chipidea/ARC based controllers).
> 
> Signed-off-by: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/usb/otg/Kconfig         |    7 +++
>  drivers/usb/otg/Makefile        |    1 +
>  drivers/usb/otg/ulpi_viewport.c |   81 +++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/ulpi.h        |    5 ++
>  4 files changed, 94 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/usb/otg/ulpi_viewport.c
> 
> diff --git a/drivers/usb/otg/Kconfig b/drivers/usb/otg/Kconfig
> index 9ffc823..02952c4 100644
> --- a/drivers/usb/otg/Kconfig
> +++ b/drivers/usb/otg/Kconfig
> @@ -49,6 +49,13 @@ config USB_ULPI
>  	  Enable this to support ULPI connected USB OTG transceivers which
>  	  are likely found on embedded boards.
>  
> +config USB_ULPI_VIEWPORT
> +	bool "ULPI Viewport Access Operations"
> +	depends on USB_ULPI
> +	help
> +	  Provides read/write operations to the ULPI phy register set for
> +	  controllers with a viewport register (e.g. Chipidea/ARC controllers).

Why would this be a Kconfig option?  Why not just always have this
option enabled if USB_ULPI is enabled?  How will someone know to enable
this or not?

And you aren't allowing this to be built as a module, which suggests
that you really want this always present, right?

> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, write to the Free Software Foundation, Inc.,
> + * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

Don't include this paragraph unless you promise to keep up to date with
the movements of the FSF's office for the next 40+ years.  Just drop it,
it's pointless and needless.


> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/usb.h>
> +#include <linux/io.h>
> +#include <linux/usb/otg.h>
> +#include <linux/usb/ulpi.h>
> +
> +#define ULPI_VIEW_WAKEUP	(1 << 31)
> +#define ULPI_VIEW_RUN		(1 << 30)
> +#define ULPI_VIEW_WRITE		(1 << 29)
> +#define ULPI_VIEW_READ		(0 << 29)
> +#define ULPI_VIEW_ADDR(x)	(((x) & 0xff) << 16)
> +#define ULPI_VIEW_DATA_READ(x)	(((x) >> 8) & 0xff)
> +#define ULPI_VIEW_DATA_WRITE(x)	(((x) & 0xff) << 0)
> +
> +static int ulpi_viewport_wait(void __iomem *view, u32 mask, u32 res)

What is "res"?

> +{
> +	unsigned long timeout = 2000;

That's not a timeout, it's a loop count, don't lie.

> +
> +	while (timeout--) {
> +		if ((readl(view) & mask) == res)
> +			return 0;
> +		cpu_relax();

Ick, if you get a faster processor, you just burned through this loop
faster.  Make it a "real" timeout based on a time value, not just "how
fast can my processor do nothing".  Otherwise this code will break in 2
years and you will not know why.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
