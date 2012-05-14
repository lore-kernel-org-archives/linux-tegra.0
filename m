From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL] ARM: tegra: for-3.5/ahb branch
Date: Mon, 14 May 2012 20:55:12 +0000
Message-ID: <201205142055.12881.arnd@arndb.de>
References: <1337024794-25269-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337024794-25269-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Monday 14 May 2012, Stephen Warren wrote:
> I meant to send this with the other two pull requests this morning, but
> forgot:-(
> 
> This is the last pull request I intend to send for 3.5, except for any
> bugs that crop up.
> 
> ----------------------------------------------------------------
> 
> The following changes since commit e816b57a337ea3b755de72bec38c10c864f23015:
> 
>   Linux 3.4-rc3
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-3.5/ahb
> 
> for you to fetch changes up to 89c788bab1f0374ae05aef7560066442ceb55384:
> 
>   ARM: tegra: Add SMMU enabler in AHB
> 

When I pull the branch, I get an extraneous commit
"ARM: dt: tegra: Add device tree support for AHB" that adds nodes that are
already there from another branch. I've removed that commit and applied the
rest to next/drivers. Please check what I have now.

Thanks,

	Arnd
