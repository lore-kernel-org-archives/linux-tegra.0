From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH tegra-cbootimage-configs] Add Toradex Colibri T20 configurations
Date: Tue, 02 Jul 2013 09:31:57 -0600
Message-ID: <51D2F26D.4000405@wwwdotorg.org>
References: <1372451264-13049-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372451264-13049-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/28/2013 02:27 PM, Lucas Stach wrote:
> The Colibri T20 COM comes in two different versions, which can both
> boot from NAND or SD-Card.

> diff --git a/tegra20/toradex/colibri-t20/colibri-t20_256_hsmmc.bct.cfg b/tegra20/toradex/colibri-t20/colibri-t20_256_hsmmc.bct.cfg
...
> +OdmData       = 0x200C0000;

> diff --git a/tegra20/toradex/colibri-t20/colibri-t20_512_hsmmc.bct.cfg b/tegra20/toradex/colibri-t20/colibri-t20_512_hsmmc.bct.cfg
...
> +OdmData       = 0x400C0000;

Those ODMDATA values don't look correct. The first nibble should be set
as follows:

1: 256MiB
2: 512MiB
3: 1GiB

... and I assume that the "256" and "515" in the filenames represent the
RAM size?

Nit: Many files have an extra blank line at the end.
