From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3] arm/tegra: emc: convert tegra2_emc to a platform
 driver
Date: Thu, 5 Jan 2012 14:14:18 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17761F1818@HQMAIL01.nvidia.com>
References: <1325742994-1178-1-git-send-email-olof@lixom.net>
 <1325743288-2460-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1325743288-2460-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, January 04, 2012 11:01 PM:
> This is the first step in making it device-tree aware and get rid of the
> in-kernel EMC tables (of which there are none in mainline, thankfully).
> 
> Changes since v2:
> 
> * D'oh -- missed a couple of variables that were added, never used and then
>   later removed in a later patch.
> 
> Changes since v1:
> 
> * Fixed messed up indentation
> * Removed code that should be gone (was added here and removed later in series)
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
...
> diff --git a/arch/arm/mach-tegra/tegra2_emc.c b/arch/arm/mach-tegra/tegra2_emc.c
...
> +static int __devinit tegra_emc_probe(struct platform_device *pdev)
...
> +	if (!request_mem_region(res->start, resource_size(res), "tegra_emc")) {
> +		dev_err(&pdev->dev, "failed to request register region\n");
> +		return -EBUSY;
> +	}
> +
> +	emc_regbase = ioremap(res->start, resource_size(res));

Don't you need to error-check the ioremap() result, and undo the
request_mem_region() too? Or, use the devm variant to request the
region. The rest of the code checks emc_pdev!=NULL which won't detect
this failure.

Isn't there a get_resource && request && remap function now; I think I
recall a patch that wraps all that into one function, but it might have
been DT-only.

Otherwise,

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
