From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] tegra: dpaux: pinctrl proposal
Date: Sun, 24 May 2015 23:13:47 +0200
Message-ID: <CACRpkdbMc2BMKhWpPMZn17-+g1quyBsqo-wTahACep2AT5dwBA@mail.gmail.com>
References: <1431963229-12867-1-git-send-email-jonathanh@nvidia.com>
	<20150519144654.GG26748@ulmo.nvidia.com>
	<555C901F.8090009@nvidia.com>
	<20150520154022.GB7734@ulmo.nvidia.com>
	<555CAE47.6070907@nvidia.com>
	<555CDC82.1010104@wwwdotorg.org>
	<555DD7B3.6020608@nvidia.com>
	<20150521140356.GA28021@ulmo.nvidia.com>
	<CACRpkdYP5FN=4_pWxc1j=e_JfcjA3bXCPDRmZYHeiZ8HDyEaEQ@mail.gmail.com>
	<555F4E11.3050201@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555F4E11.3050201-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 22, 2015 at 5:41 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 05/22/2015 01:03 AM, Linus Walleij wrote:

>> Well I originally intended that to be private and neat, but whatever.
>> Call it pinctrl-utils-internal.h or something then.
>
> Sorry for the bikeshed: perhaps s/internal/provider/? If all providers would
> need this, does it even make sense to merge it into
> include/linuxp/pinctrl/pinctrl.h, which defines all the other stuff
> providers use?

Yeah sort of, I guess it's just local to that subdir for
convenience. No big deal if we move the things to
the global headers.

Linus
