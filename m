From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL] ARM: tegra: switch to dmaengine
Date: Thu, 20 Sep 2012 19:58:22 -0700
Message-ID: <20120921025822.GB19276@quad.lixom.net>
References: <1347897744-8009-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1347897744-8009-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 17, 2012 at 10:02:24AM -0600, Stephen Warren wrote:
> The Tegra code-base has contained both a legacy DMA and a dmaengine
> driver since v3.6-rcX. This series flips Tegra's defconfig to enable
> dmaengine rather than the legacy driver, and removes the legacy driver
> and all client code.
> 
> The branch is based on v3.6-rc6 in order to pick up a bug-fix to the
> ASoC Tegra PCM driver that's required for audio to work correctly when
> using dmaengine.
> 
> ----------------------------------------------------------------
> 
> The following changes since commit 5698bd757d55b1bb87edd1a9744ab09c142abfc2:
> 
>   Linux 3.6-rc6
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.7-dmaengine

Pulled, into tegra/dmaengine-removal (next/cleanup).

Thanks,

-Olof
