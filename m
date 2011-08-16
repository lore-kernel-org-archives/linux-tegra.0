From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: Fwd: [GIT PULL] [3.2] Please pull tegra boards for 3.2
Date: Tue, 16 Aug 2011 12:30:50 -0700
Message-ID: <CAOesGMgZCFF=dWhAm_+Ux-c-aORqo4sJ1DOGirCu3QT-iMcQRQ@mail.gmail.com>
References: <CAOesGMjHN-pvVfMN0o3AD238m8wEiRS-D4ArjV_2VAGTuwPfBw@mail.gmail.com>
	<CAOesGMhFi0fsVdTe0ThhF636tqUhiWk7oZ41QKmL4dd3TcQ4_g@mail.gmail.com>
	<201108161648.58250.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201108161648.58250.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 16, 2011 at 7:48 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Sunday 14 August 2011, Olof Johansson wrote:
>>
>> Hi Arnd,
>>
>> Please pull the first set of tegra/board patches for 3.2:
>>
>>
>> The following changes since commit e6a99d312687a42c077a9b8cb5e757f18=
6edb1b9:
>>
>> =A0Merge branch 'slab/urgent' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/penberg/slab-2.6
>> (2011-08-09 08:42:16 -0700)
>>
>> are available in the git repository at:
>>
>> =A0git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git boar=
ds-for-3.2
>>
>
> Hi Olof,
>
> The contents all look good, but I'm undecided whether we should have
> branches that are not based on a -rc release. In your case, it's
> halfway between -rc1 and -rc2.
>
> Do others have an opinion? If we decide to take development branches
> only when they are based on a proper -rc, I'll do the simple rebase
> of the patches and push them out, otherwise I'll push them as they ar=
e.

I guess it depends on what you and others prefer -- if you want to
aggregate the branches in arm-soc.git through the development weeks,
or if you prefer to get most of the merge requests when platform
maintainers are getting ready for the merge window and feeding things
up?

Either is fine with me -- if it's easier for me to hold off the merge
requests a while, then I'll start a for-next branch and ask Stephen to
add it, and rebase it a few times up until when the merge request to
arm-soc is sent. Maybe it's just easier for everyone to do it that way
-- the drawback is that there's less visibility about what's about to
go in until the merge requests start to drop in late in the cycle. The
git history won't be quite as wide then either.


-Olof
