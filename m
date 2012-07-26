From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Remove unneeded include
Date: Thu, 26 Jul 2012 11:36:45 -0600
Message-ID: <5011802D.7060105@wwwdotorg.org>
References: <1343323707-27221-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343323707-27221-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/26/2012 11:28 AM, Thierry Reding wrote:
> The linux/notifier.h include is no longer required. This removal was
> most likely forgotten in the move to the new pinctrl driver in commit
> f30d12b ("ARM: tegra: Switch to new pinctrl driver").

Does the include actually cause any problems? One of the first commits
I'll send for 3.7 is to remove all the board files leaving only device
tree support, so this file is going away soon anyway...
