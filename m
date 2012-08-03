From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix U16 divider range check
Date: Fri, 03 Aug 2012 12:01:51 -0600
Message-ID: <501C120F.60404@wwwdotorg.org>
References: <1343170214-28262-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343170214-28262-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/24/2012 04:50 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> A U16 divider can divide a clock by 1..64K. However, the range-check
> in clk_div16_get_divider() limited the range to 1..256. Fix this. NVIDIA's
> downstream kernels already have the fixed range-check.
> 
> In practice this is a problem on Whistler's I2C bus, which uses a bus
> clock rate of 100KHz (rather than the more common 400KHz on Tegra boards),
> which requires a HW module clock of 8*100KHz. The parent clock is 216MHz,
> leading to a desired divider of 270. Prior to conversion to the common
> clock framework, this range error was somehow ignored/irrelevant and
> caused no problems. However, the common clock framework evidently has
> more rigorous error-checking, so this failure causes the I2C bus to fail
> to operate correctly.

Applied to for-3.7/common-clk.
