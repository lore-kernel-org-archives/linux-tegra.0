From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Add IO rail support
Date: Mon, 16 Dec 2013 14:11:51 -0700
Message-ID: <52AF6C97.7090505@wwwdotorg.org>
References: <1387226548-11631-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387226548-11631-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/16/2013 01:42 PM, Thierry Reding wrote:
> Add tegra_io_rail_power_off() and tegra_io_rail_power_on() functions to
> put IO rails into or out of deep powerdown mode, respectively.

Applied to Tegra's for-3.14/powergate branch.
