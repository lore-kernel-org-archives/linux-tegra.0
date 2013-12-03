From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Add MIPI pad calibration DT bindings
Date: Tue, 03 Dec 2013 13:17:20 -0700
Message-ID: <529E3C50.8000801@wwwdotorg.org>
References: <1385990934-20809-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385990934-20809-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/02/2013 06:28 AM, Thierry Reding wrote:
> Introduce device tree bindings for the MIPI pad calibration controller
> found on Tegra SoCs. The controller can be used to perform calibration
> of pads used for DSI and CSI peripherals.

> diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt

> +Required properties:
> +- compatible: "nvidia,tegra<chip>-mipi"
> +- reg: Physical base address and length of the controller's registers.
> +- clocks: The clock consumed by the controller.

I'd prefer all our new drivers just use clock-names from the start, so
we never have to specify that certain clocks must be at a certain index
in the clocks property. How about:

+  - clocks: Must contain an entry for each entry in clock-names.
+    See ../clocks/clock-bindings.txt for details.
+  - clock-names: Must include the following entries:
+    - mipi

(or "cal" or whatever makes sense there)
