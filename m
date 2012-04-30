From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] ARM: disable SUSPEND/ARCH_SUSPEND_POSSIBLE for
	ARCH_TEGRA
Date: Tue, 1 May 2012 00:26:32 +0100
Message-ID: <20120430232632.GA3548@n2100.arm.linux.org.uk>
References: <1335381650-7666-1-git-send-email-swarren@wwwdotorg.org> <4F9F1E4E.4020604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F9F1E4E.4020604-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 30, 2012 at 05:20:46PM -0600, Stephen Warren wrote:
> On 04/25/2012 01:20 PM, Stephen Warren wrote:
> > Tegra doesn't yet support system sleep. Explicitly disable support
> > for this feature in Kconfig.
> 
> Russell, Arnd, Olof, should this go through the ARM patch tracker, or
> should I just take it through the Tegra tree? Thanks.

I don't think it really matters - this doesn't change a lot so the
chances of conflicts are relatively low.
