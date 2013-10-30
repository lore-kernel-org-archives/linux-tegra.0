From: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 2/3] hwmon: (lm90) add support to handle IRQ
Date: Wed, 30 Oct 2013 16:53:15 +0100
Message-ID: <20131030165315.077703b3@endymion.delvare>
References: <1375856306-14415-1-git-send-email-wni@nvidia.com>
	<1375856306-14415-3-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375856306-14415-3-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 7 Aug 2013 14:18:25 +0800, Wei Ni wrote:
> When the temperature exceed the limit range value,
> the driver can handle the interrupt.
> 
> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/hwmon/lm90.c |   23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> (...)

This one looks good now, thanks, with just one minor change I'd do
before committing:

> +			dev_err(dev, "cannot request IRQ: %d\n", client->irq);

The ":" isn't really needed, I'll remove it.

-- 
Jean Delvare
