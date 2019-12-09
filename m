From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: Build regressions/improvements in v5.5-rc1
Date: Mon, 9 Dec 2019 15:45:17 +0300
Message-ID: <33f03ef9-c868-8bd5-ae5d-3da703d21fa9@gmail.com>
References: <20191209105613.2491-1-geert@linux-m68k.org>
 <CAMuHMdV+4Q2atJUPsYuc+UFxyoh1fscQL7aLUp4CWrb7=U706g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV+4Q2atJUPsYuc+UFxyoh1fscQL7aLUp4CWrb7=U706g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

09.12.2019 14:02, Geert Uytterhoeven пишет:
> On Mon, Dec 9, 2019 at 11:57 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> Below is the list of build error/warning regressions/improvements in
>> v5.5-rc1[1] compared to v5.4[2].
>>
>> Summarized:
>>   - build errors: +2/-8
>>   - build warnings: +84/-87
>>
>> Happy fixing! ;-)
>>
>> Thanks to the linux-next team for providing the build service.
>>
>> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/e42617b825f8073569da76dc4510bfa019b1c35a/ (all 232 configs)
>> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/219d54332a09e8d8741c1e1982f5eae56099de85/ (all 232 configs)
>>
>>
>> *** ERRORS ***
>>
>> 2 error regressions:
>>   + error: "clk_set_min_rate" [drivers/devfreq/tegra30-devfreq.ko] undefined!:  => N/A
>>   + error: tegra30-devfreq.c: undefined reference to `clk_set_min_rate':  => .text+0xcc8)
> 
> sh-all{mod,yes}config
> 
> Legacy non-CCF platform do not provide clk_set_min_rate(), so this needs
> a dependency on CCF.

Hello Geert,

Thanks for the report, I'll make a patch to fix it.

> BTW, it seems this was already known back in June...
> https://lore.kernel.org/linux-pm/5301c593-97e1-db4e-067b-0522537b55d9@gmail.com/

Yes, I was a bit confused about why only T20 driver was causing the
trouble.
