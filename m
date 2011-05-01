From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Tegra: dt: Split out separate Tegra SoC DT
Date: Sun, 1 May 2011 07:55:46 -0700
Message-ID: <20110501145546.GC19918@quad.lixom.net>
References: <1304136751-11629-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1304136751-11629-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 29, 2011 at 10:12:30PM -0600, Stephen Warren wrote:
> tegra250.dts describes everything within the Tegra SoC, but leaves all
> optional devices disabled.
> 
> tegra-harmony.dts is now the configuration of the SoC for the board,
> i.e. it enables the optional devices that are required for the board,
> and provides any required platform data for those devics.
> 
> The prevents every Tegra board having to repeat all the basic internal
> SoC wiring.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

A mostly unrelated question below.

[...]

> +	serial@70006000 {
> +		compatible = "nvidia,tegra250-uart";

I know this is how Grant specified it, but shouldn't these also have
a compat for ns16550?

> +		reg = <0x70006000 0x40>;
> +		reg-shift = <2>;
> +		interrupts = < 68 >;
> +		status = "disabled";
> +	};


-Olof
