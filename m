From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 0/9] ARM: tegra: add platform suspend support
Date: Wed, 13 Mar 2013 11:38:30 -0600
Message-ID: <5140B996.40400@wwwdotorg.org>
References: <1363161683-20825-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363161683-20825-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/13/2013 02:01 AM, Joseph Lo wrote:
> This series introduces a basic functionality for Tegra to support the
> platform suspend and resume.
> 
> Note: This series only adds the support for Tegra20 and Tegra30. The
> Tegra114 will be supported later.
> 
> This series were depending on the patch below that not yet be merged into
> linux-mmc tree.
> "mmc: tegra: use mmc_of_parse to get the support of standard MMC DT bindings"

Is that a compile-time dependency, or a run-time dependency? I assume
this is simply a run-time dependency, and is also only a dependency for
suspend itself to work; there wouldn't be any other regressions due to
ignoring that dependency?

In other words, if I simply apply this series without "mmc: tegra: use
mmc_of_parse to get the support of standard MMC DT bindings", then the
only issue is that suspend, a new feature, won't work correctly yet? If
so, I believe I will ignore that dependency. The new feature will work
in linux-next and 3.10-rc1.
