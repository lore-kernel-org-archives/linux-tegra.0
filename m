From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: tegra: Enable DSI and panel support
Date: Mon, 07 Oct 2013 15:27:24 -0600
Message-ID: <5253273C.9000607@wwwdotorg.org>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 05:48 AM, Thierry Reding wrote:
> This series enables DSI, HDMI and gr2d support on Dalmore as well as
> panel support for Cardhu and Harmony.
> 
> The DRM_PANEL and DRM_PANEL_SIMPLE Kconfig symbols enabled in patch 9
> are introduced by the following patch series:
> 
> 	[PATCH v2 00/27] drm/tegra: Repatriation and DSI support
> 
> Perhaps a good solution would be to postpone applying patch 9 until
> after 3.13-rc1, so that the symbols are there when the above series
> has gone in during the merge window.

I think it's fine to add those options to tegra_defconfig now; people
rebuilding the defconfig hopefully do it on top of linux-next rather
than the Tegra tree itself, and even if they don't, it's not too hard to
edit out the differences they don't want to post.
