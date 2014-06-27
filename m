From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Fri, 27 Jun 2014 15:10:25 -0600
Message-ID: <53ADDDC1.2080603@wwwdotorg.org>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403888329-24755-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/27/2014 10:58 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> These drivers are closely coupled and need to be moved as a whole. One
> reason for moving them out of arch/arm/mach-tegra is to allow them to be
> shared with 64-bit ARM.

Aside from any discussions re: splitting out cpuidle, power domains, ...
into separate subsystem directories, this patch looks conceptually fine
to me.

That said, given that I think arch/arm64 isn't going to have mach-*
directories or machine descriptors, I wonder how all this code is going
to be invoked at boot. arch/arm/mach-tegra/tegra.c calls a bunch of
these functions at boot right now. So, it seems like moving the code so
that it can compile in both places is only part of the solution? Are we
going to have an arm64-specific SoC driver that binds to the SoC
compatible in order to initialize everything? If so, I wonder if the
same can work for arch/arm so everything works the same way?
