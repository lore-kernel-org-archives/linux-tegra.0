From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Export tegra_powergate_sequence_power_up()
Date: Fri, 29 Mar 2013 10:39:42 -0600
Message-ID: <5155C3CE.8090008@wwwdotorg.org>
References: <1364502904-5284-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364502904-5284-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/28/2013 02:35 PM, Thierry Reding wrote:
> This function can be used by drivers to enable power to the hardware
> blocks that they drive. Most of the drivers can be built as a module
> and therefore require this function to be exported.

I applied the series to Tegra's for-3.10/fixes branch.
