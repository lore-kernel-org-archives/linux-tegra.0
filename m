From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] include/linux/platform_data/tegra_emc.h: Remove unused
 header
Date: Thu, 28 Aug 2014 10:53:53 -0600
Message-ID: <53FF5EA1.4050708@wwwdotorg.org>
References: <1409226858-3406-1-git-send-email-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409226858-3406-1-git-send-email-linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/28/2014 05:54 AM, Rasmus Villemoes wrote:
> The header file include/linux/platform_data/tegra_emc.h does not seem
> to be used anywhere. It was orphaned by a7cbe92c "ARM: tegra: remove
> tegra EMC scaling driver". Remove it.

Applied to Tegra's for-3.18/soc branch.
