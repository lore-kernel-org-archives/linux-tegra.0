From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v5.5-rc1
Date: Mon, 9 Dec 2019 12:02:19 +0100
Message-ID: <CAMuHMdV+4Q2atJUPsYuc+UFxyoh1fscQL7aLUp4CWrb7=U706g@mail.gmail.com>
References: <20191209105613.2491-1-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191209105613.2491-1-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 9, 2019 at 11:57 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.5-rc1[1] compared to v5.4[2].
>
> Summarized:
>   - build errors: +2/-8
>   - build warnings: +84/-87
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/e42617b825f8073569da76dc4510bfa019b1c35a/ (all 232 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/219d54332a09e8d8741c1e1982f5eae56099de85/ (all 232 configs)
>
>
> *** ERRORS ***
>
> 2 error regressions:
>   + error: "clk_set_min_rate" [drivers/devfreq/tegra30-devfreq.ko] undefined!:  => N/A
>   + error: tegra30-devfreq.c: undefined reference to `clk_set_min_rate':  => .text+0xcc8)

sh-all{mod,yes}config

Legacy non-CCF platform do not provide clk_set_min_rate(), so this needs
a dependency on CCF.

BTW, it seems this was already known back in June...
https://lore.kernel.org/linux-pm/5301c593-97e1-db4e-067b-0522537b55d9@gmail.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
