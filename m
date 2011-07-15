From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [GIT PULL] Tegra updates for v3.1
Date: Fri, 15 Jul 2011 08:57:27 -0700
Message-ID: <CAMbhsRQLaZss2uhLCaY-WjaH85WKLbYYnR2cfw4b+Qnz_rKXyw@mail.gmail.com>
References: <CAMbhsRQoZ7vJGchkXLUOrOH4rpKJzJe-iGvLjTfBmz4R=8HtVw@mail.gmail.com>
	<201107151506.29281.arnd@arndb.de>
	<201107151600.40794.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201107151600.40794.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 15, 2011 at 7:00 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 15 July 2011, Arnd Bergmann wrote:
>> On Friday 15 July 2011, Colin Cross wrote:
>> > Please pull Tegra updates from:
>> >
>> > git://android.git.kernel.org/kernel/tegra.git for-next
>> >
>> > Mostly peripheral support in existing boards, but also a few fixes and
>> > code reduction.
>
> Hi Colin,
>
> Sorry about the first message. I accidentally looked at the tegra/for-next
> branch, not at for-next, so the stuff I commented on is very historic and
> has been merged a few releases ago.
>
> The stuff you sent now does look very good. It would still be better
> to reorganize it into separate branches next time, but it's small
> enough overall that I'll just merge it as one for this release.
>
> Again, sorry if my first message caused any trouble.

No problem, I'll delete the tegra/for-next branch, it was an old mis-push.

If I put it in separate branches in the future, do you want a single
pull request for a merge of the branches, or a pull request for each
branch?
