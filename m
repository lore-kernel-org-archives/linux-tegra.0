From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: ventana: Add NCT1008 temperature sensor
Date: Fri, 09 Nov 2012 15:05:41 -0700
Message-ID: <509D7E35.5070004@wwwdotorg.org>
References: <1352498481-32032-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352498481-32032-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/09/2012 03:01 PM, Thierry Reding wrote:
> The Harmony board has an ON Semiconductors NCT1008 temperature sensor
> connected to the DVC bus. It can be used to monitor the ambient (local)
> and on-die (remote) temperatures.

Thanks, applied to Tegra's for-3.8/dt branch.
