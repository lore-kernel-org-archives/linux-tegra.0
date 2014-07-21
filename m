From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/8] ARM: tegra: Remove TEGRA124_CLK_EMC from tegra124-car.h
Date: Mon, 21 Jul 2014 16:37:20 -0600
Message-ID: <53CD9620.3090301@wwwdotorg.org>
References: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com> <1405088313-20048-3-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405088313-20048-3-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/11/2014 08:18 AM, Mikko Perttunen wrote:
> Remove the TEGRA124_CLK_EMC cell value define for tegra124-car
> from the binding headers. This clock has never been able to do
> anything and is being replaced with a separate EMC driver with
> its own device tree node. Removing the define ensures that any
> user will not mistakenly refer to <&tegra_car TEGRA124_CLK_EMC>
> instead of <&emc> or similar.

If the clock physically exists in HW, I see no reason to remove it from
the binding definition, even if we don't implement it (or remove the
implementation of it) in the Linux clock driver.
