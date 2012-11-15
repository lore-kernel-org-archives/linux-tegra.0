From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: tegra: defconfig updates for 3.8
Date: Thu, 15 Nov 2012 15:27:18 -0700
Message-ID: <50A56C46.6010300@wwwdotorg.org>
References: <1353015894-20003-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353015894-20003-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/15/2012 02:44 PM, Thierry Reding wrote:
> The following set of patches enables the Tegra DRM driver along with the
> framebuffer console and the PWM backlight driver to light up panels that
> are driven by the DRM driver. A third patch enables SquashFS, which is
> used as the root filesystem on Tamonten-based boards.

Thanks, I have squashed the series into Tegra's for-3.8/defconfig
branch. Squashed rather than applied since there's still a desire to
keep the number of defconfig-related commits minimal.
