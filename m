From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 11/20] tegra: fdt: Add clock bindings for Tegra2 Seaboard
Date: Mon, 27 Feb 2012 16:29:45 -0700
Message-ID: <4F4C11E9.1050907@nvidia.com>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org> <1330375973-10681-12-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330375973-10681-12-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/27/2012 01:52 PM, Simon Glass wrote:
> Add the definition of the oscillator clock frequency.

> diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts

> +	clock@60006000 {
> +		clocks = <&osc>;
> +	};

The CAR takes two clock inputs; one 32KHz clock (typically from the
PMU/PMIC) and one from the oscillator. The 32KHz one is missing here. I
guess this won't make any difference to U-Boot since it isn't using the
clock inputs in the CAR driver, but it'd be best if the .dts file
contained the correct content so it didn't act as an incorrect example.
See the example in the binding documentation for what should be there.

-- 
nvpublic
