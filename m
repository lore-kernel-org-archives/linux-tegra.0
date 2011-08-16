From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Fwd: [GIT PULL] [3.2] Please pull tegra boards for 3.2
Date: Tue, 16 Aug 2011 16:48:57 +0200
Message-ID: <201108161648.58250.arnd@arndb.de>
References: <CAOesGMjHN-pvVfMN0o3AD238m8wEiRS-D4ArjV_2VAGTuwPfBw@mail.gmail.com> <CAOesGMhFi0fsVdTe0ThhF636tqUhiWk7oZ41QKmL4dd3TcQ4_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMhFi0fsVdTe0ThhF636tqUhiWk7oZ41QKmL4dd3TcQ4_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sunday 14 August 2011, Olof Johansson wrote:
> 
> Hi Arnd,
> 
> Please pull the first set of tegra/board patches for 3.2:
> 
> 
> The following changes since commit e6a99d312687a42c077a9b8cb5e757f186edb1b9:
> 
>  Merge branch 'slab/urgent' of
> git://git.kernel.org/pub/scm/linux/kernel/git/penberg/slab-2.6
> (2011-08-09 08:42:16 -0700)
> 
> are available in the git repository at:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git boards-for-3.2
> 

Hi Olof,

The contents all look good, but I'm undecided whether we should have
branches that are not based on a -rc release. In your case, it's
halfway between -rc1 and -rc2.

Do others have an opinion? If we decide to take development branches
only when they are based on a proper -rc, I'll do the simple rebase
of the patches and push them out, otherwise I'll push them as they are.

	Arnd
