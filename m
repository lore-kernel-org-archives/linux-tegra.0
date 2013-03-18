From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/7] usb: phy: tegra: get ULPI reset GPIO info using DT.
Date: Mon, 18 Mar 2013 17:01:35 +0400
Message-ID: <5147102F.1060204@cogentembedded.com>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com> <1363609781-4045-6-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363609781-4045-6-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello.

On 18-03-2013 16:29, Venu Byravarasu wrote:

> As GPIO information is avail through DT, used it to get Tegra ULPI
> reset GPIO number. Added a new member to tegra_usb_phy structure to
> store this number.

> Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/usb/phy/tegra_usb_phy.c   |   25 +++++++++++--------------
>   include/linux/usb/tegra_usb_phy.h |    1 +
>   2 files changed, 12 insertions(+), 14 deletions(-)

> diff --git a/drivers/usb/phy/tegra_usb_phy.c b/drivers/usb/phy/tegra_usb_phy.c
> index b5b2037..29c5ac4 100644
> --- a/drivers/usb/phy/tegra_usb_phy.c
> +++ b/drivers/usb/phy/tegra_usb_phy.c
[...]
> @@ -622,18 +619,18 @@ static int	tegra_phy_init(struct usb_phy *x)
[...]
> -		gpio_request(ulpi_config->reset_gpio, "ulpi_phy_reset_b");
> -		gpio_direction_output(ulpi_config->reset_gpio, 0);
> +		gpio_request(phy->reset_gpio, "ulpi_phy_reset_b");
> +		gpio_direction_output(phy->reset_gpio, 0);

    Why not use goio_request_one() instead of these two? Thought maybe it's a 
material of another patch...

WBR, Sergei
