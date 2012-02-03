From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/4] pinctrl: add a driver for NVIDIA Tegra
Date: Fri, 3 Feb 2012 23:12:12 +0100
Message-ID: <CACRpkdbtPjDPb=hJkW99jvfaSTZZoeg91XArhjo3RMUcEfkRBg@mail.gmail.com>
References: <1328130290-17607-1-git-send-email-swarren@nvidia.com>
	<201202021533.14650.arnd@arndb.de>
	<CACRpkdbMPrvN80cLyVLUNvTjx4ZV4iLeHcJaJyM_qvTHHAfWww@mail.gmail.com>
	<201202031855.20589.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201202031855.20589.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ext Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rajendra Nayak <rajendra.nayak-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 3, 2012 at 7:55 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 03 February 2012, Linus Walleij wrote:
>>
>> So I'm taking this branch off from -next until we resolve this.
>
> That is the opposite of what I intended :(

OK I might put it back in next week after conferring with some
of the involved people. I just want a credible story for my
pull request at the end of the day and that's all.

> I really meant that you don't need my Ack: the Tegra changes got an
> Ack from the subarch maintainers and the drivers/pinctrl changes are
> for you to judge.

OK so this was more from the point of "the ARM stuff is
growing wild again" point of view, and Mr. Torvalds has made it
pretty clear to me that he don't like it growing anywhere, no
matter whether that is under arch/arm/* or any place else,
like drivers/pinctrl/*.

If I had a few Atom, MIPS, Blackfin or CRIS pin controllers in
tree or in the pipe, it wouldn't be so much of an ARM issue, but
currently it sort of is, that's basically why I want to involve
you guys.

BTW does anyone know of some inherent muxing in Intel
hardware like the Langwell PCH?

> I don't have the resources to look into every patch
> with the level of detail required to make a final decision, I really
> have to rely on someone I trust like you to decide if something goes
> in or not. Of course I can offer an opinion when you ask me, which
> I did, but also didn't feel I understand the patch well enough to
> ack them -- even though it looks reasonable to me.

OK sorry it wasn't meant to stress you.

> Regarding the process, you have my full Ack on the plan to merge
> them into mainline through your tree when you find them good enough
> and also put a copy into the arm-soc tree if needed to resolve
> any dependencies or conflicts with other stuff in arm-soc.

Yes, well the patches are a *real* *good* pinctrl driver, there is
no question of that.

The only issue is size and open-coding.

I am open to any smart ideas on how to get rid of excess tables,
I just happen to have run out of them myself, all sort of comes
to the point of wanting the C preprocessor to have loop
statements...

I'm leaning toward creating a pin and group specification
language and put that into the kbuild to generate headers with
them to cut the open-coded data down.

>> Tony had made it possible to have pinctrl drivers as modules,
>> but some systems may need their pin control up before
>> they even bring up the filesystem :-(
>>
>> Booting from initramfs and switchroot can solve the above
>> but will slow down boot I believe, and ARM systems
>> usually don't like that.
>
> Sounds good enough for me. Anyone who wants a single kernel that runs on
> a lot different machines (distros like ubuntu, fedora, debian, opensuse)
> typically relies on initramfs already, the others can have the code built-in.

Yep single uImage mandates modules, I thought so for long
but now I'm ever more certain of it.

Yours,
Linus Walleij
