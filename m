From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL V2 0/7] ARM: tegra: pull requests for 3.6
Date: Fri, 6 Jul 2012 20:31:01 +0000
Message-ID: <201207062031.01998.arnd@arndb.de>
References: <1341600482-11020-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1341600482-11020-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 06 July 2012, Stephen Warren wrote:
> This is Tegra's pull requests for v3.6.
> 
> Changes in V2:
> * Split for-3.6/{fixes,soc} to remove their dependency.
> * Split for-3.6/{dt,boards} to remove their dependency.
> * Added example merge resolution branches for the conflicts when merging
>   the above pairs of branches.

Pulled all of those, thanks for redoing the series so quickly!

I pulled both the fixes and the cleanup branch into the arm-soc next/cleanup
one, because I usually like the fixes to come even before the cleanups, but
I think that's fine.

The merge conflicts were really trivial compared to other things I'm used
to, so there is no need to provide an example merge in cases like this,
git mergetool handles those just fine.

I appreciate the comments for each pull request, I copied them into the
merge changeset description where it makes sense. This would be even easier
if you used signed tags because then you can put the text directly into
the tag message and I don't have to copy it.

Good job also on getting to the point where you can easily add support
for a new board using DT.

	Arnd
