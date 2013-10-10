From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH V2] ARM: tegra: unify Tegra's Kconfig a bit more
Date: Thu, 10 Oct 2013 16:11:51 -0700
Message-ID: <20131010231151.GG4301@kroah.com>
References: <1381164349-23130-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381164349-23130-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 07, 2013 at 10:45:49AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Move all common select clauses from ARCH_TEGRA_*_SOC to ARCH_TEGRA to
> eliminate duplication. The USB-related selects all should have been
> common too, but were missing from Tegra114 previously. Move these to
> ARCH_TEGRA too. The latter fixes a build break when only Tegra114
> support was enabled, but not Tegra20 or Tegra30 support.
> 
> This is 20984c44b5a08620778ea14fa5807489170fd5ca in v3.12-rc1, with
> a merge conflict resolved.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reported-by: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> [our auto-builders for 3.11.x are failing due to this]
> ---
> v2: I actually applied the patch this time, resolving the merge conflict
>     while I was at it. I built and booted the result too.

Thanks for testing it :)

Now queued up.

greg k-h
