From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: tamonten: Add NCT1008 temperature sensor
Date: Fri, 09 Nov 2012 15:05:29 -0700
Message-ID: <509D7E29.2070803@wwwdotorg.org>
References: <1352498408-31955-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352498408-31955-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/09/2012 03:00 PM, Thierry Reding wrote:
> The Tamonten SOM has an ON Semiconductor NCT1008 connected to the DVC
> bus which is used to measure the ambient (local) temperature as well as
> the on-die (remote) temperature.

Thanks, applied to Tegra's for-3.8/dt branch.
