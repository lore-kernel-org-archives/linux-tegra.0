From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 04/11] gpio: tegra: Iterate over the correct number of
 banks
Date: Wed, 4 Apr 2012 11:59:11 -0700
Message-ID: <20120404185911.GB10603@quad.lixom.net>
References: <1333148404-17691-1-git-send-email-swarren@wwwdotorg.org>
 <1333148404-17691-5-git-send-email-swarren@wwwdotorg.org>
 <20120404175829.GD29919@quad.lixom.net>
 <4F7C95F2.2050808@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F7C95F2.2050808-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 04, 2012 at 12:41:54PM -0600, Stephen Warren wrote:
> On 04/04/2012 11:58 AM, Olof Johansson wrote:
> > On Fri, Mar 30, 2012 at 04:59:57PM -0600, Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> When Tegra30 support was added to the Tegra GPIO driver, a few places
> >> which iterated over all banks were not converted to use the variable
> >> tegra_gpio_bank_count rather than hard-coding the bank count. Fix this.
> >>
> >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> > 
> > Should this be fixed in 3.4 as well? Given the need for some of the other
> > patches in this series I suppose gpio isn't really working on tegra30 there
> > though, so it's not technically a regression...
> 
> It's probably not a bad idea, even if we don't expect many users; the
> code may as well be correct. I assume since 3.4 is still in the rc
> stage, I would send an explicit pull request to arm-soc for that rather
> than just Cc: stable.

Correct.

> I wonder if "gpio: tegra: fix register address calculations for Tegra30"
> shouldn't be applied (after addressing your comments) for 3.4 too? It
> might be a little large of a change?

Yep, that one too.


-Olof
