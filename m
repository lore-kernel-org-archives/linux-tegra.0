From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 6/9] arm/tegra: emc: convert tegra2_emc to a platform
 driver
Date: Wed, 4 Jan 2012 15:39:22 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17761F158A@HQMAIL01.nvidia.com>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
 <1324599468-12845-7-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324599468-12845-7-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Thursday, December 22, 2011 5:18 PM:
> This is the first step in making it device-tree aware and get rid of the
> in-kernel EMC tables (of which there are none in mainline, thankfully).

> -void tegra_init_emc(const struct tegra_emc_table *table, int table_size)
> +static int __devinit tegra_emc_probe(struct platform_device *pdev)
> +{
...
> +	}
> +
> +        res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +        if (!res) {
> +		dev_err(&pdev->dev, "missing register base\n");
> +                return -ENOMEM;
> +        }
> +
> +	if (!request_mem_region(res->start, resource_size(res), "tegra_emc")) {

Something is wrong with the indentation there.

> +	/* Since default max_rate on emc clock is the same as firmware set
> +	 * it to before booting, raise it up here based on known timings.
> +	 */
> +
> +	for (i = 0; i < pdata->num_tables; i++)
> +		if (pdata->tables[i].rate > max)
> +			max = pdata->tables[i].rate;
> +
> +	c->max_rate = max * 2 * 1000;
> +
> +	list_for_each_entry(user, &c->shared_bus_list, u.shared_bus_user.node)
> +		user->max_rate = c->max_rate;

Hmm. I guess that works OK for now. Using some kind of accessor might
be nice; I'm not sure how that could be implemented once there's a
common clock framework, and this code can't touch the clock internals.

-- 
nvpublic
