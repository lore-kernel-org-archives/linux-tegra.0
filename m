From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: use CS_LAR_KEY definition instead of
 0xC5ACCE55
Date: Tue, 26 Mar 2013 14:34:53 -0600
Message-ID: <5152066D.8080804@wwwdotorg.org>
References: <1364235552-17851-1-git-send-email-will.deacon@arm.com> <1364235552-17851-2-git-send-email-will.deacon@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364235552-17851-2-git-send-email-will.deacon-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dietmar Eggemann <dietmar.eggemann-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/25/2013 12:19 PM, Will Deacon wrote:
> When enabling coresight on secondary cores for tegra, make use of our
> fancy new definition for the magic lock code.

The code you're editing has actually been removed in the 3.10 cycle, so
there's no need for this patch any more.
