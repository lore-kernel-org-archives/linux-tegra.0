From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] ASoC: tegra: Use flat regcache.
Date: Wed, 19 Mar 2014 13:24:37 -0600
Message-ID: <5329EEF5.9090201@wwwdotorg.org>
References: <1395119329-30721-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395119329-30721-1-git-send-email-dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/17/2014 11:08 PM, Dylan Reid wrote:
> When using an rbtree cache, there can be allocations the first time a
> register is accessed.  This can cause an attempt to schedule while
> atomic in the case that the regmap is using a spinlock.  This could be
> fixed by either initializing all the registers or using a flat cache.
> The register maps for tegra30_ahub and tegra30_i2s are dense and don't
> save much from using a tree so convert them to flat.
> 
> Tegra30 changes tested on Norrin, Tegra20 changes compile.

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(On Tegra124 Venice2 and Tegra20 Seaboard/Springbank)
