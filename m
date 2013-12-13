From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Fix misconfiguration of pin PH2 on Venice2
Date: Fri, 13 Dec 2013 10:33:32 -0700
Message-ID: <52AB44EC.6090905@wwwdotorg.org>
References: <1386951904-6564-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386951904-6564-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/13/2013 09:25 AM, Thierry Reding wrote:
> This pin needs to be configured in pull-down, non-tristate mode in order
> for the backlight to work correctly.

Applied to Tegra's for-3.14/dt branch.
