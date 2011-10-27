From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCHv2] arm/tegra: clk_get should not be fatal
Date: Thu, 27 Oct 2011 09:03:54 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173E1B48B0@HQMAIL01.nvidia.com>
References: <1319618501-15020-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1319618501-15020-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org wrote at Wednesday, October 26, 2011 2:42 AM:
> The timer and rtc-timer clocks aren't gated by default, so there is no reason
> to crash the system if the dummy enable call failed.
...
>  	clk = clk_get_sys("timer", NULL);
> -	BUG_ON(IS_ERR(clk));
> -	clk_enable(clk);
> +	if (IS_ERR(clk))
> +		pr_warn("Unable to get timer clock\n");
> +	else
> +		clk_enable(clk);

This seems reasonable to me, and is certainly required for Tegra30 support
until we get a full clock tree set up for Tegra30, which I think we'll
probably defer until the common clock infra-structure is in place.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
