From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: DT: tegra: Add board leaver compatible properties
Date: Wed, 02 Jan 2013 16:22:27 -0700
Message-ID: <50E4C133.1070506@wwwdotorg.org>
References: <1357167025-6167-1-git-send-email-pengw@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357167025-6167-1-git-send-email-pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/02/2013 03:50 PM, Bryan Wu wrote:

A patch description would be useful.

> diff --git a/Documentation/devicetree/bindings/arm/tegra.txt b/Documentation/devicetree/bindings/arm/tegra.txt

> -Boards with the tegra20 SoC shall have the following properties:
> +- Boards with the tegra20 SoC shall have the following properties:
> +  Required root node property:
> +  compatible = "nvidia,tegra20";

Since you're changing that, Tegra should be capitalized in free-form text.

> +Boards
> +-------------------------------------------
> +
> +- NVIDIA Tegra20 Harmony evaluation board:
> +  compatible = "nvidia,harmony", "nvidia,tegra20";
> +
> +- Avionic Design Medcom-Wide board:
> +  compatible = "ad,medcom-wide", "ad,tamonten", "nvidia,tegra20";

This seems a little long-winded. Perhaps just say:

SoCs
-------------------------------------------

Each device tree must specify which Tegra SoC it uses, using one of the
following compatible values:

  nvidia,tegra20
  nvidia,tegra30

Boards
-------------------------------------------

Each device tree must specify which one or more of the following
board-specific compatible values:

  ad,plutux
  compal,paz00
  nvidia,harmony
  ...

(and keep the list alphabetically sorted)
