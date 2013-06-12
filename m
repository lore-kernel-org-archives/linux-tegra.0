From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/4] arm: tegra: Add power-supplies link between battery
 and charger
Date: Wed, 12 Jun 2013 11:44:41 -0600
Message-ID: <51B8B389.8010105@wwwdotorg.org>
References: <1370899602-22123-1-git-send-email-rklein@nvidia.com> <1370899602-22123-5-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370899602-22123-5-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/10/2013 03:26 PM, Rhyland Klein wrote:
> The power supply core now supports detecting linkages between batteries
> and chargers through the use of the power-supplies property. Adding
> this to the battery, the core will use the phandle list to find
> the associated charger and pair them up. This facilitates notifications
> from the charger to the battery when ac power is dissconnected
> or connected for instance.

Rhyland, if I apply this patch without patches 1-3 being in the same
branch, will it cause any bugs? If so, I guess 1-3 should go through the
drivers/power maintainer for 3.11, and I should defer this patch to 3.12?
