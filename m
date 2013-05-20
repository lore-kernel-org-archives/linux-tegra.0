From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: enable host1x support by default
Date: Mon, 20 May 2013 13:08:04 -0600
Message-ID: <519A7494.1050206@wwwdotorg.org>
References: <1368868666-24754-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368868666-24754-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/18/2013 03:17 AM, Alexandre Courbot wrote:
> Tegra DRM support used to be enabled in the default Tegra configuration,
> but it now depends on CONFIG_TEGRA_HOST1X which is disabled by default.
> Enable CONFIG_TEGRA_HOST1X so that DRM support is compiled in again.

I've forwarded this to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org in the hope it can be pulled into
3.10. If not, I'll apply it to the Tegra tree once I hear back.
