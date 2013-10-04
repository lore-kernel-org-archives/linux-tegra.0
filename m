From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage-configs PATCH] Build using Makefiles, add separate
 bct/img targets
Date: Fri, 04 Oct 2013 13:33:48 -0600
Message-ID: <524F181C.8010502@wwwdotorg.org>
References: <1380827425-9816-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380827425-9816-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/03/2013 01:10 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> In some situations, one may only need BCT binaries and not flashable
> image binaries. Hence, it's useful to allow BCTs and flashable image
> to be built separately, rather than always building both together.
> 
> While re-writing the build system, convert from shell-scripts to
> Makefiles. Now, one can "make", "make bcts", or "make images", all with
> appropriate dependency checking.
> 
> Many Avionic Design boards use a carrier/module design, with the carrier
> and module files stored in separate directories. Use symlinks to handle
> this, rather than complicating the build system with support for files
> from other directories.

Applied.
