From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: move irammap.h to mach-tegra
Date: Mon, 29 Oct 2012 11:04:21 -0600
Message-ID: <508EB715.4030101@wwwdotorg.org>
References: <1350326249-18405-1-git-send-email-swarren@wwwdotorg.org> <1350326249-18405-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350326249-18405-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/15/2012 12:37 PM, Stephen Warren wrote:
> Nothing outside mach-tegra uses this file, so there's no need for it to
> be in <mach/>.
> 
> Since uncompress.h and debug-macro.S remain in include/mach, they need
> to include "../../irammap.h" becaue of this change. Both these usages
> will be removed shortly, when Tegra's DEBUG_LL implementation is updated
> not to pass information through IRAM.

I have applied this to Tegra's tree for 3.8.
