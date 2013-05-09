From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: tegra: a couple clock bug-fixes
Date: Thu, 9 May 2013 16:55:33 -0700
Message-ID: <20130509235533.GA19697@quad.lixom.net>
References: <1367874671-11474-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1367874671-11474-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, May 06, 2013 at 03:11:09PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Arnd, Olof,
> 
> The following two patches fix a couple issues in the Tegra20 clock driver
> that show up on specific platforms. They were sent a little late for 3.9,
> and I forgot to include them for 3.10 since they weren't reposted:-(

Applied to fixes now, sorry for missing them earlier.

> Patch 1 is clearly a bug-fix. Someone pedantic could argue that patch 2
> is a new feature since it's the last piece to enabling AC'97 support, but
> I'd argue that it's a bug in the clock driver that it didn't support this
> clock when it was first written:-)

For very early -rc we can be a bit more flexible, so this is ok with me at the
moment.

> These patches logically belong to Tegra's for-3.10/clk branch, but feel
> free to apply them where is easiest; it'd be fine to defer them to a post-
> 3.10-rc1 fixes branch too if you want.

Postponed in effect due to missing them earlier.

Btw, since the drivers have moved and most of the churn is completed, fixes
like these really can go straight to Mike Turquette from here on out.


-Olof
