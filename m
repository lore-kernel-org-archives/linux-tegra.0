From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Fwd: [GIT PULL] [3.2] Please pull tegra boards for 3.2
Date: Fri, 26 Aug 2011 09:32:52 +0100
Message-ID: <20110826083252.GE11250@n2100.arm.linux.org.uk>
References: <CAOesGMjHN-pvVfMN0o3AD238m8wEiRS-D4ArjV_2VAGTuwPfBw@mail.gmail.com> <201108161648.58250.arnd@arndb.de> <CAOesGMgZCFF=dWhAm_+Ux-c-aORqo4sJ1DOGirCu3QT-iMcQRQ@mail.gmail.com> <2300535.b0zjAbUTLi@wuerfel> <CAOesGMj5P9yLO0My4UB7AEj+9NdmYq8HYwVMd3Uv1NQO6+WP7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMj5P9yLO0My4UB7AEj+9NdmYq8HYwVMd3Uv1NQO6+WP7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 25, 2011 at 10:23:21PM -0700, Olof Johansson wrote:
> Ok. Sounds like there might be some use for a temporary "work in
> progress" branch for linux-next for patches that are nearly ready to
> go but not quite that needs air time, but not really for anything
> beyond that.

Bad idea.

linux-next's policy is that everything in linux-next should be ready
for mainline - not nearly ready.

Linus is threatening at the next merge window to ignore pull requests
from maintainers, and just pull the entire linux-next tree into his at
the beginning.  Anything in linux-next which is "work in progress" will
therefore find its way immediately into mainline in whatever state it's
in.

So, everyone needs to ensure that linux-next only contains code that's
100% ready for merging during the next merge window.  Everything else
should not be in linux-next.
