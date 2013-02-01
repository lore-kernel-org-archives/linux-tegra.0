From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 5/8] ARM: tegra: SCU base rework
Date: Thu, 31 Jan 2013 20:32:22 -0800
Message-ID: <20130201043222.GC5844@quad.lixom.net>
References: <1359582159-28816-1-git-send-email-swarren@wwwdotorg.org>
 <1359582159-28816-5-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1359582159-28816-5-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 30, 2013 at 02:42:36PM -0700, Stephen Warren wrote:
> Tegra currently relies on the SCU to determine the number of CPU
> cores, and also hard-codes the SCU physical address.
> 
> This series adds a /cpus node to the Tegra device tree, and updates
> the code to rely solely on that to determine the CPU count. A new
> API is introduced to query for the existence of SCU registers, and the
> SCU register address. Tegra and OMAP2 are converted to use these new
> APIs.
> 
> This pull request is based on a merge of v3.8-rc3, and arm-soc's
> depends/rmk-perf branch.

This one looks like it should also be based on your cleanup, since it has
conflicts with it. Please rebase accordingly.


-Olof
