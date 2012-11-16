From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: tegra: Enable HDMI on Tamonten carriers
Date: Fri, 16 Nov 2012 09:18:14 -0700
Message-ID: <50A66746.6090805@wwwdotorg.org>
References: <1353081412-19448-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353081412-19448-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/16/2012 08:56 AM, Thierry Reding wrote:
> The three patches in this series enable the HDMI output on Plutux and
> TEC. The Medcom-Wide only has an LVDS output and the TEC has an LVDS
> output as well, but since they depend on the videomode helpers and the
> power-sequences patch series, they will only be enabled in subsequent
> patches.

Thanks, I've applied the series to Tegra's for-3.8/dt branch.
