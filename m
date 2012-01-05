From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] arm/tegra: emc: device tree support
Date: Thu, 5 Jan 2012 14:35:55 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17761F182F@HQMAIL01.nvidia.com>
References: <1324599468-12845-10-git-send-email-olof@lixom.net>
 <1325743338-2533-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1325743338-2533-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, January 04, 2012 11:02 PM:
> Add device tree support to the emc driver, filling in the platform data
> based on the DT bindings.
> 
> Changes since v1:
> 
> * Unmangled some messed up patch squashes, moving changes to earlier patches
> * Flipped an of_property_read_u32 return value test
> * Clarified clock settings message on case where no table is provided
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
...
> diff --git a/arch/arm/mach-tegra/tegra2_emc.c b/arch/arm/mach-tegra/tegra2_emc.c
...
> +static struct tegra_emc_pdata __devinit *tegra_emc_fill_pdata(struct platform_device *pdev)
...
> +	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +	pdata->tables = devm_kzalloc(&pdev->dev,
> +				     sizeof(struct tegra_emc_table),
> +				     GFP_KERNEL);

You could convert that one to sizeof(*pdata->tables) too, although feel
free to ignore this picky comment, or fix it up when you apply the change.

Otherwise,

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
