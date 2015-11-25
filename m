From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] clk: tegra: Fix bypassing of PLLs
Date: Wed, 25 Nov 2015 17:48:57 +0000
Message-ID: <5655F489.6080808@nvidia.com>
References: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
 <CANMBJr7vYb+kuUBzsC8i4b=b6DRVsbqnf5OrVtj6kVS2RMNgfQ@mail.gmail.com>
 <20151125151100.GA31492@ulmo.nvidia.com>
 <CANMBJr598C1nd7awHdDx_j1uVNbnnAju1sgCvdmg1p6VO-FupQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CANMBJr598C1nd7awHdDx_j1uVNbnnAju1sgCvdmg1p6VO-FupQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Tyler Baker <tyler.baker@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rhyland Klein <rklein@nvidia.com>, Kevin's boot bot <khilman@kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 25/11/15 15:52, Tyler Baker wrote:
> On 25 November 2015 at 07:11, Thierry Reding <thierry.reding@gmail.com> wrote:
>> On Mon, Nov 23, 2015 at 03:18:59PM -0800, Tyler Baker wrote:
>>> Hi Jon,
>>>
>>> On 20 November 2015 at 07:11, Jon Hunter <jonathanh@nvidia.com> wrote:
>>>> The _clk_disable_pll() function will attempt to place a PLL into bypass
>>>> if the TEGRA_PLL_BYPASS is specified for the PLL and then disable the PLL
>>>> by clearing the enable bit. To place the PLL into bypass, the bypass bit
>>>> needs to be set and not cleared. Fix this by setting the bypass bit and
>>>> not clearing it.
>>>>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>
>>> The kernelci.org bot recently detected a jetson-tk1 boot failure[1][2]
>>> in the tegra tree. This boot failure has only been observed when
>>> booting with a multi_v7_defconfig kernel variant. The bot bisected[3]
>>> this boot failure to this commit, and I confirmed reverting it on top
>>> of the tegra for-next branch resolves the issue. The ramdisk[4] used
>>> for booting is loaded with the modules from the build. It appears to
>>> me that as the modules are being loaded in userspace by eudev the
>>> jetson-tk1 locks up. I've sifted through the console logs a bit, and
>>> found this splat to be most interesting[5].  Can you confirm this
>>> issue on your end?
>>
>> Just to close the loop on this: we've discussed this on IRC and came to
>> the conclusion that not using the bypass mode is safer (switching into
>> and out of bypass can glitch). I've dropped this patch for now and Jon
>> will be looking into a second revision of the patch which, in addition
>> to fixing bypass (the fix is legit, it just happens to break because of
>> the glitch, most likely), will also remove the BYPASS flag setting so
>> that bypass will not be used.
> 
> Thanks for the update, I appreciate you guys looking into this issue.
> Please CC me on any fixes, I can re-test and give my tested-by.

No problem. On 2nd thoughts I am wondering if there is any value in
bypassing the PLL when disabling it. I will look into this and see what
I find out.

Cheers
Jon
