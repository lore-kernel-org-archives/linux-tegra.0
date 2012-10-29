From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: move iomap.h to mach-tegra
Date: Mon, 29 Oct 2012 11:04:10 -0600
Message-ID: <508EB70A.9050605@wwwdotorg.org>
References: <1350326249-18405-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350326249-18405-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/15/2012 12:37 PM, Stephen Warren wrote:
> Nothing outside mach-tegra uses this file, so there's no need for it to
> be in <mach/>.
> 
> Since uncompress.h and debug-macro.S remain in include/mach, they need
> to include "../../iomap.h" becaue of this change. uncompress.h will soon
> be deleted in later multi-platform/single-zImage patches. debug-macro.S
> will need to continue to include this header using an explicit relative
> path, to avoid duplicating the physical->virtual address mapping that
> iomap.h dictates.

I have applied this to Tegra's tree for 3.8.
