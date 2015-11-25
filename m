From: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Fix bypassing of PLLs
Date: Wed, 25 Nov 2015 07:52:13 -0800
Message-ID: <CANMBJr598C1nd7awHdDx_j1uVNbnnAju1sgCvdmg1p6VO-FupQ@mail.gmail.com>
References: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
	<CANMBJr7vYb+kuUBzsC8i4b=b6DRVsbqnf5OrVtj6kVS2RMNgfQ@mail.gmail.com>
	<20151125151100.GA31492@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151125151100.GA31492-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kevin's boot bot <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 25 November 2015 at 07:11, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Nov 23, 2015 at 03:18:59PM -0800, Tyler Baker wrote:
>> Hi Jon,
>>
>> On 20 November 2015 at 07:11, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> > The _clk_disable_pll() function will attempt to place a PLL into bypass
>> > if the TEGRA_PLL_BYPASS is specified for the PLL and then disable the PLL
>> > by clearing the enable bit. To place the PLL into bypass, the bypass bit
>> > needs to be set and not cleared. Fix this by setting the bypass bit and
>> > not clearing it.
>> >
>> > Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> The kernelci.org bot recently detected a jetson-tk1 boot failure[1][2]
>> in the tegra tree. This boot failure has only been observed when
>> booting with a multi_v7_defconfig kernel variant. The bot bisected[3]
>> this boot failure to this commit, and I confirmed reverting it on top
>> of the tegra for-next branch resolves the issue. The ramdisk[4] used
>> for booting is loaded with the modules from the build. It appears to
>> me that as the modules are being loaded in userspace by eudev the
>> jetson-tk1 locks up. I've sifted through the console logs a bit, and
>> found this splat to be most interesting[5].  Can you confirm this
>> issue on your end?
>
> Just to close the loop on this: we've discussed this on IRC and came to
> the conclusion that not using the bypass mode is safer (switching into
> and out of bypass can glitch). I've dropped this patch for now and Jon
> will be looking into a second revision of the patch which, in addition
> to fixing bypass (the fix is legit, it just happens to break because of
> the glitch, most likely), will also remove the BYPASS flag setting so
> that bypass will not be used.

Thanks for the update, I appreciate you guys looking into this issue.
Please CC me on any fixes, I can re-test and give my tested-by.

Cheers,

Tyler
