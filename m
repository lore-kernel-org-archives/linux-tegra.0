From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/6] Port Tegra to generic clk framework
Date: Fri, 29 Jun 2012 11:24:06 -0600
Message-ID: <4FEDE4B6.4010405@wwwdotorg.org>
References: <1340879846-12900-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340879846-12900-1-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mturquette-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/28/2012 04:37 AM, Prashant Gaikwad wrote:
> This patch set ports Tegra clock code to generic clock framework.
> 
> Depends on
> [PATCH v3 0/9] Add clk_prepare/clk_unprepare series
> [PATCH] ARM: tegra: Remove second instance of uart clk
> [PATCH] dma: tegra: add clk_prepare/clk_unprepare
> [PATCH] ARM: tegra: dma: rename driver name for clock to "tegra-apbdma"

Prashant, this doesn't apply either to my local development tree
(roughly what's in next-20120629), nor Tegra's for-3.6/common-clk
branch. Can you please regenerate the series on top of
for-3.6/common-clk. Thanks.
