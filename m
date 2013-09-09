From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 2/2] Documentation: dt: hwmon: add OF document for
 LM90
Date: Mon, 09 Sep 2013 16:15:57 -0600
Message-ID: <522E489D.6080903@wwwdotorg.org>
References: <1378722552-10357-1-git-send-email-wni@nvidia.com> <1378722552-10357-3-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378722552-10357-3-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/09/2013 04:29 AM, Wei Ni wrote:
> Add OF document for LM90 in Documentation/devicetree/.

> diff --git a/Documentation/devicetree/bindings/hwmon/lm90.txt
> b/Documentation/devicetree/bindings/hwmon/lm90.txt

> +Optional properties:

> +- interrupts: Contains a single interrupt specifier which
> describes the +              LM90 pin6 output.

Does the pin also have a standard name you could include here, rather
than (or in addition to) just the pin number?
