From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 3/3] Documentation: dt: hwmon: add OF document for
 LM90
Date: Thu, 12 Sep 2013 09:00:25 -0600
Message-ID: <5231D709.5080308@wwwdotorg.org>
References: <1378985061-28547-1-git-send-email-wni@nvidia.com> <1378985061-28547-4-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378985061-28547-4-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/12/2013 05:24 AM, Wei Ni wrote:
> Add OF document for LM90 in Documentation/devicetree/.

> diff --git a/Documentation/devicetree/bindings/hwmon/lm90.txt b/Documentation/devicetree/bindings/hwmon/lm90.txt

> +Optional properties:
> +- vcc-supply: vcc regulator for the supply voltage.
> +              If this is not set, assuming vcc is always powered.

I thought that was going to be a "Required Property".
