From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: fix ifdef for tegra_periph_reset_assert inline
Date: Thu, 27 Jun 2013 16:59:04 -0600
Message-ID: <51CCC3B8.80909@wwwdotorg.org>
References: <1372100756-10448-1-git-send-email-swarren@wwwdotorg.org> <20130624210333.23972.95491@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130624210333.23972.95491@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/24/2013 03:03 PM, Mike Turquette wrote:
> Quoting Stephen Warren (2013-06-24 12:05:56)
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Commit 7064f6b "clk: tegra: provide tegra_periph_reset_assert
>> alternative" added ifdef'd static inline versions of some functions,
>> but tested ARCH_TEGRA rather than CONFIG_ARCH_TEGRA, thus disabling
>> these function in all cases. In some cases, this caused HW modules to
>> misbehave; for example, the Tegra I2C driver BUG()d during boot on
>> Seaboard.
>>
>> Reported-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Thanks for the fixup. I had already published the offending commit and
> can't rebase it, so I just applied this patch on top.
> 
> Pulled into clk-next for 3.11.

Did that get pushed out to the git server? The patch isn't in next-20130627.
