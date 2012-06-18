From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: make tegra_cpu_reset_handler_enable() __init
Date: Mon, 18 Jun 2012 16:44:12 -0700
Message-ID: <20120618234412.GA2034@quad.lixom.net>
References: <1340053310-20855-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1340053310-20855-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arndb-r2nGTMty4D4@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 18, 2012 at 03:01:50PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This solves a section mismatch warning. I hadn't noticed this before,
> because my compiler was inlining tegra_cpu_reset_handler_enable() inside
> tegra_cpu_reset_handler_init(), which is already __init, but I switched
> compilers and it stopped doing that.
> 
> Cc: <stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> # v3.4
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Arnd, Olof, do you want me to put this in a pull request, or can you apply
> it directly for 3.5?

Single patches are just fine as is, no need for a pull request.

Applied to fixes. Thanks!


-Olof
