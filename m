From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mfd: cros ec: spi: Simplify delay handling between
 SPI messages
Date: Tue, 14 Nov 2017 10:47:30 -0800
Message-ID: <CAD=FV=XS3kuVx7hcGTNYVwxjUj83e7Jo9azEw00PbOQRO8wJ1w@mail.gmail.com>
References: <1510670608-19594-1-git-send-email-jonathanh@nvidia.com> <1510670608-19594-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510670608-19594-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Nov 14, 2017 at 6:43 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> The EC SPI driver prevents SPI transfers being to rapidly by keeping
> track of the time the last transfer was issued via the
> 'last_transfer_ns' variable. Previously, if the 'last_transfer_ns'
> variable was zero, this indicated that no previous transfer had been
> sent and that no delay was needed. However, the EC SPI driver has
> been updated to always initialise the 'last_transfer_ns' variable
> during probe and therefore, it is no longer necessary to test if it
> is zero. Remove the code that checks if this variable is zero.
>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes since V1:
> - Added Brian's reviewed-by.
>
>  drivers/mfd/cros_ec_spi.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)

Reviewed-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
