From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V2 1/2] mfd: cros ec: spi: Don't send first message too soon
Date: Tue, 14 Nov 2017 10:46:02 -0800
Message-ID: <CAD=FV=V1vHsQDixt=wRHMcWzx7krR747vE7hGvn5Qnkn-C2RXg@mail.gmail.com>
References: <1510670608-19594-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510670608-19594-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Nov 14, 2017 at 6:43 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On the Tegra124 Nyan-Big chromebook the very first SPI message sent to
> the EC is failing.
>
> The Tegra SPI driver configures the SPI chip-selects to be active-high
> by default (and always has for many years). The EC SPI requires an
> active-low chip-select and so the Tegra chip-select is reconfigured to
> be active-low when the EC SPI driver calls spi_setup(). The problem is
> that if the first SPI message to the EC is sent too soon after
> reconfiguring the SPI chip-select, it fails.
>
> The EC SPI driver prevents back-to-back SPI messages being sent too
> soon by keeping track of the time the last transfer was sent via the
> variable 'last_transfer_ns'. To prevent the very first transfer being
> sent too soon, initialise the 'last_transfer_ns' variable after calling
> spi_setup() and before sending the first SPI message.
>
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes since V1:
> - Added stable-tag and Brian's reviewed-by.
>
> Looks like this issue has been around for several Linux releases now
> and it just depends on timing if this issue is seen or not and so there
> is no specific commit this fixes. However, would be good to include for
> v4.15.
>
>  drivers/mfd/cros_ec_spi.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
