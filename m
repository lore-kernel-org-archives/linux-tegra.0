From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/7] ARM: tegra: add Venice2 board support
Date: Mon, 07 Oct 2013 11:20:47 -0600
Message-ID: <5252ED6F.9070303@wwwdotorg.org>
References: <1381131085-26116-1-git-send-email-josephl@nvidia.com> <1381131085-26116-6-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381131085-26116-6-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 01:31 AM, Joseph Lo wrote:
> Add support for the Tegra124 based Venice2 reference board.

> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts

> +	pmc {

You'll need to update the node name here too.

> +		nvidia,invert-interrupt;
> +	};
> +
> +};

There's an extra blank line between the two }; above.
