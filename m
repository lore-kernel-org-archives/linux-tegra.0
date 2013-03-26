From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: use setup_mm_for_reboot rather than explicit
 pgd switch
Date: Tue, 26 Mar 2013 14:38:05 -0600
Message-ID: <5152072D.6020201@wwwdotorg.org>
References: <1364235552-17851-1-git-send-email-will.deacon@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364235552-17851-1-git-send-email-will.deacon-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/25/2013 12:19 PM, Will Deacon wrote:
> This patch changes the Tegra PM code to use the setup_mm_for_reboot
> helper rather than call cpu_switch_mm directly. This keeps things like
> TLB invalidation in one place.

I've applied this to Tegra's for-3.10/cleanup branch.
