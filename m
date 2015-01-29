From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: Kconfig: clean up two no-op Kconfig options from
 CONFIG_ARCH_TEGRA*
Date: Thu, 29 Jan 2015 15:57:04 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1501291556280.16475@utopia.booyaka.com>
References: <alpine.DEB.2.02.1501290928230.19947@utopia.booyaka.com> <1422525047.26924.3.camel@x220>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422525047.26924.3.camel@x220>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 29 Jan 2015, Paul Bolle wrote:

> On Thu, 2015-01-29 at 09:35 +0000, Paul Walmsley wrote:
> > Paul Bolle pointed out that commit
> > d035fdfa27ac124bc8f94c3d7dc82ad069802170 ("arm64: Add Tegra132
> > support") included two Kconfig symbols that are now no-ops:
> > USB_ARCH_HAS_EHCI and HAVE_SMP.  So, drop the two symbols.
> > 
> > Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
> > Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
> > Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Paul Bolle <pebolle-IWqWACnzNjyonA0d6jMUrA@public.gmane.org>
> 
> There's probably no one using that address. But if there is that person
> will be wondering what on earth that message is all about:
>     s/.it/.nl/

Sorry about that, Paul - I noticed the bounce this morning.  v2 has 
been sent with a corrected E-mail address.


- Paul
