From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 11/11] tegrarcm: Bump version to 1.5
Date: Mon, 09 Sep 2013 15:57:21 -0600
Message-ID: <522E4441.8060906@wwwdotorg.org>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com> <1378757761-20939-12-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-12-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/09/2013 02:16 PM, Allen Martin wrote:
> Update README with change log for version 1.5, and bump version
> number.

> diff --git a/README b/README

>  Changes (see git logs for complete list):
> +V1.5 - Added support for RCM protocol version 40
> +     - Added Tegra124 support

It might be worth mentioning the new --rip, --odmdata, --mini*
command-line options?
