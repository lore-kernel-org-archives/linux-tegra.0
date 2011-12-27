From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 2/5] Tegra devicetree updates for 3.3
Date: Tue, 27 Dec 2011 15:25:04 -0800
Message-ID: <CAOesGMi5gEc-KAsEGDc7yw4UowEEAhkFFwKa6LoMvBf5=3WK9w@mail.gmail.com>
References: <CAOesGMhSEbpcKXv87_cv+1b-wB7g8zmtFR2wMygByuTBv_bmvA@mail.gmail.com>
	<201112272243.39791.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201112272243.39791.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Dec 27, 2011 at 2:43 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 21 December 2011, Olof Johansson wrote:
>> Hi Arnd,
>>
>> Please pull the following device tree-related updates for tegra for =
3.3. Thanks!
>>
>>
>> The following changes since commit 5611cc4572e889b62a7b4c72a413536bf=
6a9c416:
>>
>> =A0 Linux 3.2-rc4 (2011-12-01 14:56:01 -0800)
>>
>> are available in the git repository at:
>> =A0 git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git for=
-3.3/dt
>>
>
> Pulled into a new next/dt branch, thanks!

Thanks!

> There is a bogus conflict in arch/arm/mach-tegra/Makefile from mergin=
g
> two different versions of "arm/tegra: fix variable formatting in make=
file".
> The patches are identical, but 317d5330 made it into tegra/dt and
> 584634e3 into tegra/cleanup.
>
> Trivial to fix, but something to watch out for in the future.

Thanks, I just realized how that must have happened -- I had to rebase
to a newer -rc a while back, and must have rebased each branch from
scratch instead of rebasing dt on top of the new rebased cleanup.


-Olof
