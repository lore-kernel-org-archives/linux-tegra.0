From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH V4 2/2] regmap: add regmap_bulk_write() for register write
Date: Sun, 12 Feb 2012 12:57:25 +0100
Message-ID: <4F37A925.90507@metafoo.de>
References: <1329036556-15408-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329036556-15408-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/12/2012 09:49 AM, Laxman Dewangan wrote:
> [...]
> +	} else {
> +		for (i = 0; i < val_count; i++) {
> +			memcpy(&ival, val + (i * val_bytes), val_bytes);

This will have endianess issues. You'll need something like regcache_get_val.

> +			ret = _regmap_write(map, reg + i, ival);
> +			if (ret) {
> +				dev_err(map->dev,
> +				    "Error in register %u write, ret %d\n",
> +						reg + i, ret);
> +				break;
> +			}
> +		}
> +	}
> [...]
