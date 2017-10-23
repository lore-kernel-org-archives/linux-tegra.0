From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [GIT PULL] clk: tegra: Changes for v4.15-rc1
Date: Mon, 23 Oct 2017 01:01:17 -0700
Message-ID: <CAEG3pNBZc1m_jDmzVPN-n-najhts2VzPDOtqV-cNNbKObqA8wQ@mail.gmail.com>
References: <20171020121412.10527-1-thierry.reding@gmail.com> <20171023073920.GA3802@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171023073920.GA3802@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Mon, Oct 23, 2017 at 12:39 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Oct 20, 2017 at 02:14:12PM +0200, Thierry Reding wrote:
>> Hi Michael, Stephen,
>>
>> The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:
>>
>>   Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.15-clk
>>
>> for you to fetch changes up to e4e2519df9928ae923205759176599969f344cd4:
>>
>>   clk: tegra: Use readl_relaxed_poll_timeout_atomic() in tegra210_clock_init() (2017-10-20 13:37:45 +0200)
>>
>> Note that this pulls in parts from two other tags that are going to go
>> in via the ARM SoC tree. Those are needed to a couple of resolve build
>> dependencies.
>>
>> Thanks,
>> Thierry
>>
>> ----------------------------------------------------------------
>> clk: tegra: Changes for v4.15-rc1
>>
>> This contains cleanups and minor fixes for the Tegra clock driver.
>>
>> ----------------------------------------------------------------
>> Bhumika Goyal (1):
>>       clk: tegra: Make tegra_clk_pll_params __ro_after_init
>>
>> Dmitry Osipenko (4):
>>       clk: tegra: Add AHB DMA clock entry
>>       clk: tegra: Correct parent of the APBDMA clock
>
> Hi,
>
> looks like I was a little too quick on the trigger on this one and
> missed a regression that this introduces.
>
> Can we hold off on this for a little? Jon should have a fix for this
> within the day.

Sounds good.

Best regards,
Mike

>
> Thanks,
> Thierry
