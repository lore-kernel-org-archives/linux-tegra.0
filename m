From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 4/8] arm/tegra: prepare pinmux code for multiple
 tegra variants
Date: Fri, 4 Nov 2011 13:35:07 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173F9A4E46@HQMAIL01.nvidia.com>
References: <1320242948-21061-1-git-send-email-pdeschrijver@nvidia.com>
 <1320242948-21061-5-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1320242948-21061-5-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Wednesday, November 02, 2011 8:09 AM:
> This patch modifies the pinmux code to be useable for multiple tegra variants.
> Some tegra20 specific constants will be replaced by variables which will be
> initialized to the appropriate value at runtime.
...
> diff --git a/arch/arm/mach-tegra/include/mach/pinmux.h b/arch/arm/mach-tegra/include/mach/pinmux.h
...
> @@ -219,13 +213,20 @@ struct tegra_pingroup_desc {
>  	s8 pupd_bit;	/* offset into the PULL_UPDOWN_REG_* register bit */
>  };
> 
> -extern const struct tegra_pingroup_desc tegra_soc_pingroups[];
> -extern const struct tegra_drive_pingroup_desc tegra_soc_drive_pingroups[];
> +struct tegra_pinmux_pm {
> +	void (*suspend)(void);
> +	void (*resume)(void);
> +};

You still don't need that struct type.

-- 
nvpublic
