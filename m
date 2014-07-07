From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 2/3] ARM: tegra: move fuse code out of arch/arm
Date: Sun, 6 Jul 2014 17:44:17 -0700
Message-ID: <20140707004417.GE8469@quad.lixom.net>
References: <1403558626-13422-1-git-send-email-swarren@wwwdotorg.org>
 <1403558626-13422-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403558626-13422-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 23, 2014 at 03:23:45PM -0600, Stephen Warren wrote:
> This branch moves code related to the Tegra fuses out of arch/arm and
> into a centralized location which could be shared with ARM64. It also
> adds support for reading the fuse data through sysfs.

The new/moved misc driver isn't acked by any misc maintainer, so I can't
take this branch.

I saw no indication from searching the mailing list of that either,
so it wasn't just a missed acked-by.

I wonder if this code should go under drivers/soc/ instead?


-Olof
