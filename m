From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] drm: tegra: Use framebuffer pitch as line stride
Date: Mon, 26 Nov 2012 15:37:29 -0700
Message-ID: <50B3EF29.6000308@wwwdotorg.org>
References: <1353613037-15808-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353613037-15808-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/22/2012 12:37 PM, Thierry Reding wrote:
> Instead of using the stride derived from the display mode, use the pitch
> associated with the currently active framebuffer. This fixes a bug where
> the LCD display content would be skewed when enabling HDMI with a video
> mode different from that of the LCD.

This patch certainly doesn't cause any additional issues for me, so:

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Howwever, it still doesn't allow both Cardhu's LCD panel and external
HDMI port (1080p) to be active at once. If I boot with both enabled, or
boot with just the LCD enabled and hot-plug HDMI, as soon as both heads
are active, then some kind of display corruption starts; it looks like a
clocking issue or perhaps memory underflow.

Mark, can you please investigate this. I haven't tested to see if the
issue is Tegra30-specific, or also happens on Tegra20.
