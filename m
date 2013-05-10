From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 08/10] usb: phy: tegra: Add error handling & clean
 up.
Date: Fri, 10 May 2013 22:06:48 +0400
Message-ID: <518D3738.6040402@cogentembedded.com>
References: <1368194051-4925-1-git-send-email-vbyravarasu@nvidia.com> <1368194051-4925-9-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368194051-4925-9-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello.

On 05/10/2013 05:54 PM, Venu Byravarasu wrote:

> Check return values from all GPIO APIs and handle errors accordingly.
>
> Remove the call to clk_disable_unprepare(); this function does not
> prepare or enable the clock, so the error path should not disable or
> unprepare it.
>
> Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[...]
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
> index a2a89a9..dce692a 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
[...]
> @@ -624,24 +632,44 @@ static int	tegra_phy_init(struct usb_phy *x)
[...]
>   		phy->ulpi = otg_ulpi_create(&ulpi_viewport_access_ops, 0);
> +		if (!phy->ulpi) {
> +			dev_err(phy->dev, "otg_ulpi_create returned err\n");

    Rather "returned NULL".

WBR, Sergei
