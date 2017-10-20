From: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: xhci: tegra: use time64_t for printing timestamp
Date: Fri, 20 Oct 2017 13:37:18 +0300
Message-ID: <59E9D1DE.9070407@intel.com>
References: <20171020072006.4174886-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171020072006.4174886-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 20.10.2017 10:19, Arnd Bergmann wrote:
> The time_t type and time_to_tm() function are deprecated because
> of y2038 problems. In this driver, they are used to pretty-print
> the timestamp of the firmware build. This is fine as long as
> we don't get a firmware build past 2038.
>
> Converting to time64_t and time64_to_tm() avoids the deprecated
> interfaces and works until 2106, when the firmware-defined
> data structure overflows.
>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>   drivers/usb/host/xhci-tegra.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 74436f8ca538..39b6e93130d3 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -771,7 +771,7 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
>   	struct device *dev = tegra->dev;
>   	const struct firmware *fw;
>   	unsigned long timeout;
> -	time_t timestamp;
> +	time64_t timestamp;
>   	struct tm time;
>   	u64 address;
>   	u32 value;
> @@ -877,7 +877,7 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
>   	}
>
>   	timestamp = le32_to_cpu(header->fwimg_created_time);
> -	time_to_tm(timestamp, 0, &time);
> +	time64_to_tm(timestamp, 0, &time);
>
>   	dev_info(dev, "Firmware timestamp: %ld-%02d-%02d %02d:%02d:%02d UTC\n",
>   		 time.tm_year + 1900, time.tm_mon + 1, time.tm_mday,
>

Thanks, adding to queue

-Mathias
