From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 1/3] ARM: tegra: core SoC code changes for 3.18
Date: Thu, 25 Sep 2014 19:55:46 +0200
Message-ID: <5666206.hBBQzilaqm@wuerfel>
References: <1411062692-22338-1-git-send-email-swarren@wwwdotorg.org> <201409251801.18466.arnd@arndb.de> <5424458E.7020603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5424458E.7020603-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 25 September 2014 10:40:46 Stephen Warren wrote:
> 
> I don't recall the exact commits, but I ended up needing to base one of 
> the branches on -rc2. So, I then based all the branches on the same 
> commit. When I create Tegra's for-next, I start with that baseline 
> branch and merge in each Tegra topic branch. That way, the merges only 
> bring in exactly what's in that branch, and it's easy to validate the 
> final result in gitk/similar.

I see. For us it's actually more helpful if every single topic branch
is on the oldest possible state.

> I suppose it'd work fine if I start with 
> the newest base of any branch and then merged the topic branches in; 
> that would at least restrict the merges to only the contents of the 
> branch, although it'd create a far more difficult to validate history, 
> since the different topic branches would be based in different places.

Yes, I fear there is no perfect solution to this. Someone also suggested
switching around the parent commits during a merge that updates one of
our branches to a newer base. That would solve the backmerge problem but
in turn break 'git log --first-parent'.

	Arnd
