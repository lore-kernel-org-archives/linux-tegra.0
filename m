From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] arm64: Kconfig: clean up two no-op Kconfig options
 from CONFIG_ARCH_TEGRA*
Date: Thu, 29 Jan 2015 10:59:40 -0800
Message-ID: <20150129185940.GC18628@quad.lixom.net>
References: <alpine.DEB.2.02.1501291541390.16475@utopia.booyaka.com>
 <20150129163137.GJ8951@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150129163137.GJ8951-M2fw3Uu6cmfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 29, 2015 at 04:31:38PM +0000, Catalin Marinas wrote:
> On Thu, Jan 29, 2015 at 03:42:45PM +0000, Paul Walmsley wrote:
> > 
> > Paul Bolle pointed out that commit
> > d035fdfa27ac124bc8f94c3d7dc82ad069802170 ("arm64: Add Tegra132
> > support") included two Kconfig symbols that are now no-ops:
> > USB_ARCH_HAS_EHCI and HAVE_SMP.  So, drop the two symbols.
> > 
> > This second version corrects a thinko in Paul Bolle's E-mail address.
> > 
> > Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
> > Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
> > Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
> 
> The patch looks fine. Cc'ing the arm-soc guys as they have merged the
> original commit.

Thanks, applied.


-Olof
