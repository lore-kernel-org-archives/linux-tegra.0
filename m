From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: PCIe: Provide 3.3V supply voltage
Date: Fri, 17 Feb 2012 16:39:31 +0000
Message-ID: <20120217163931.GB961@sirena.org.uk>
References: <1329493468-7741-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1329493468-7741-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 17, 2012 at 04:44:28PM +0100, Thierry Reding wrote:

> +	err = regulator_set_voltage(regulator, 3300000, 3300000);
> +	if (err < 0)
> +		goto err_put;
> +

This is a bit weird, why is this not just set by constraints?
