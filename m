From: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: trusted_foundations: Maintain CPU endianness
Date: Fri, 20 Mar 2015 16:20:59 +0000
Message-ID: <20150320162059.GD4725@e103592.cambridge.arm.com>
References: <1426865807-22981-1-git-send-email-digetx@gmail.com>
 <550C4106.4090801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550C4106.4090801-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 20, 2015 at 06:47:18PM +0300, Dmitry Osipenko wrote:
> This patch not tested. I assume that firmware save/restore cp15
> context, i.e. it doesn't require switching to LE before smc call and
> restore endianness after.

That assumption should be valid.

However, I think this patch must be tested before assuming it is
correct.  If the arguments were passed in memory then there might
force LE order for that data block, but there should not be a need for
this if the values are in registers.

Cheers
---Dave
