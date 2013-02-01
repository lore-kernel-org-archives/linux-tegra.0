From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 5/8] ARM: tegra: SCU base rework
Date: Fri, 1 Feb 2013 15:51:43 +0000
Message-ID: <201302011551.43947.arnd@arndb.de>
References: <1359582159-28816-1-git-send-email-swarren@wwwdotorg.org> <CAOesGMjjgz7Am7-D_fQHqgLX=G+Wc_LKL-GYMHd1-NzVC-DUfA@mail.gmail.com> <510B4892.3050900@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <510B4892.3050900-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 01 February 2013, Stephen Warren wrote:
> Hmm. And here I was thinking that I was basing branches on top of
> each-other too much given your previous comments about merge conflicts
> being OK!

IMHO the cleanup branches are special in this regard because they
are primarily meant as a way to resolve the merge conflicts.
If you are able to put all the conflicts between the normal branches
into cleanup patches, you can put them all in one branch and
base your other branches on top of that. Of course that doesn't
always work, but it would solve this particular instance.

	Arnd
