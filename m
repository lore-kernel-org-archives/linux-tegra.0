From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: tegra: Enable LVDS output on Harmony
Date: Mon, 07 Oct 2013 15:14:26 -0600
Message-ID: <52532432.6040101@wwwdotorg.org>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com> <1381146528-18069-3-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-3-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 05:48 AM, Thierry Reding wrote:
> Add backlight and panel modes for the Harmony TFT LCD panel. Note that
> currently the panel power supply is marked as boot-on/always-on because
> otherwise regulator_enable() and regulator_disable() will become
> unbalanced. That's something that needs to be fixed properly in the
> panel driver.

Presumably that's something that will be fixed before I apply these
patches, since the DT content shouldn't rely on the presence/absence of
bugs in one particular OS's drivers?
