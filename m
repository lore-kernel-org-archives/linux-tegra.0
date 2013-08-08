From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 3/3] Documentation: dt: hwmon: add OF document for
 lm90
Date: Thu, 08 Aug 2013 11:37:27 -0600
Message-ID: <5203D757.8000208@wwwdotorg.org>
References: <1375944991-29182-1-git-send-email-wni@nvidia.com> <1375944991-29182-4-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375944991-29182-4-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/08/2013 12:56 AM, Wei Ni wrote:
> Add OF document for lm90 in Documentation/devicetree/.

> diff --git a/Documentation/devicetree/bindings/hwmon/lm90.txt b/Documentation/devicetree/bindings/hwmon/lm90.txt

> +Required node properties:
> +- compatible: manufacture and chip name,
> +              which are listed in the Documentation/hwmon/lm90

You need to specify the exact values here. DT binding documentations
should be OS-agnostic, and hence can't depend on Linux-specific
documentation or other details.

> +Optional properties:
> +- vdd-supply: vdd regulator for the supply voltage. If this is not set,

s/set/present/.

> +- interrupts: lm90 can support interrupt mode, you can set interrupt here.

You might want to mention that a single entry ("specifier") is expected
in the list.
