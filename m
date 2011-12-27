From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 1/5] Tegra cleanups for 3.3
Date: Tue, 27 Dec 2011 14:22:31 -0800
Message-ID: <CAOesGMi7-wTTBBXEWhhB6XvJBynS0YpR+WpsNKYTAjhRkku1BA@mail.gmail.com>
References: <CAOesGMja7+nA-VSF9bEmUJRbpLbVwZ+ngC1+qJ4Sz8L3Bx0m5A@mail.gmail.com>
	<201112272219.38986.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201112272219.38986.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 27, 2011 at 2:19 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 21 December 2011, Olof Johansson wrote:
>> Hi Arnd,
>>
>> Please pull the following cleanups for tegra. Thanks!
>>
>>
>> The following changes since commit 5611cc4572e889b62a7b4c72a413536bf=
6a9c416:
>>
>> =A0 Linux 3.2-rc4 (2011-12-01 14:56:01 -0800)
>>
>> are available in the git repository at:
>> =A0 git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git for=
-3.3/cleanup
>
> Pulled and resolved a conflict with Marc's "ARM: tegra2: convert to
> CONFIG_MULTI_IRQ_HANDLER" patch, which leaves entry-macro.S
> almost empty with these contents:
>
> =A0 =A0 =A0 =A0.macro =A0disable_fiq
> =A0 =A0 =A0 =A0.endm
>
> =A0 =A0 =A0 =A0.macro =A0arch_ret_to_user, tmp1, tmp2
> =A0 =A0 =A0 =A0.endm
>
> Please confirm if this is the correct resolution.
>

Yep, that's the expected resolution. Thanks!


-Olof
