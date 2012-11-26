From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] arm: tegra: fix comment in dsib clk set_parent
Date: Mon, 26 Nov 2012 14:00:28 -0700
Message-ID: <50B3D86C.40104@wwwdotorg.org>
References: <1353498147-14574-1-git-send-email-sivaramn@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353498147-14574-1-git-send-email-sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/21/2012 04:42 AM, Sivaram Nair wrote:
> Since the clk framework has already taken necessary locks before calling
> into the arch clk ops code, no further locks are needed while setting
> the parent of dsib clk. This patch removes a comment that indicated
> otherwise, and yet did not take any locks.

Thanks, applied.
