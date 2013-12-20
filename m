From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: DTS: tegra: add DFLL integration to the Dalmore
 DTS file
Date: Thu, 19 Dec 2013 17:10:17 -0700
Message-ID: <52B38AE9.2030209@wwwdotorg.org>
References: <20131219122857.3226.42830.stgit@tamien> <20131219124929.3226.79335.stgit@tamien>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131219124929.3226.79335.stgit@tamien>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthew Longnecker <mlongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/19/2013 05:49 AM, Paul Walmsley wrote:
> Expose the DFLL device on the NVIDIA Tegra114 Dalmore board, and connect
> the DFLL (and FCPU cluster) voltage regulator.

> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra114-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra114-dfll.txt

> +NVIDIA Tegra114 DFLL clocksource data in the board DTS file
> +
> +Optional properties:
> +
> +- status : device availability -- managed by the DT integration code, not
> +           the DFLL driver.  Should be set to "okay" if the DFLL is to be
> +           used on this board type.

There's certainly no need to document the same DT property twice. The DT
docs are about documenting the schema. If the DT author decides to split
the properties between a .dtsi and a .dts file, that's irrelevant to the
schema.
