From: Valentin Rothberg <valentinrothberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: soc/tegra: fuse: undefined option ARCH_TEGRA_210_SOC
Date: Fri, 21 Aug 2015 15:24:25 +0200
Message-ID: <CAD3Xx4K5_kq2bdUzEm5kN-ZjFJaZcZzQYwY1XYTC3bMLq_MnYg@mail.gmail.com>
References: <CAD3Xx4+6r1w+oKgjUAuLXzszy9-uRWvXyyfv3q_1YGC6shXHFQ@mail.gmail.com>
 <20150515085700.GE4984@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150515085700.GE4984-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Andreas Ruprecht <andreas.ruprecht-d40JDW7QUjc@public.gmane.org>, hengelein Stefan <stefan.hengelein-d40JDW7QUjc@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

this is just a kind reminder that the issue (see below) is still present.

On Fri, May 15, 2015 at 10:57 AM, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Thu, May 14, 2015 at 01:50:08PM +0200, Valentin Rothberg wrote:
>> Hi Thierry,
>>
>> your commit e3cf5bf687df ("soc/tegra: fuse: Add Tegra210 support") is
>> in today's linux-next tree (i.e., next-20150514).  The following lines
>> in the commit reference a Kconfig option that is not defined, so that
>> the driver and the affected #ifdef blocks cannot be compiled:
>>
>> drivers/soc/tegra/fuse/Makefile:10:obj-$(CONFIG_ARCH_TEGRA_210_SOC)
>>  += speedo-tegra210.o
>> drivers/soc/tegra/fuse/fuse-tegra.c:104:#ifdef CONFIG_ARCH_TEGRA_210_SOC
>> drivers/soc/tegra/fuse/fuse-tegra30.c:49:    defined(CONFIG_ARCH_TEGRA_210_SOC)
>> drivers/soc/tegra/fuse/fuse-tegra30.c:148:#if defined(CONFIG_ARCH_TEGRA_210_SOC)
>> drivers/soc/tegra/fuse/fuse.h:84:#ifdef CONFIG_ARCH_TEGRA_210_SOC
>> drivers/soc/tegra/fuse/fuse.h:104:#ifdef CONFIG_ARCH_TEGRA_210_SOC
>>
>> Is there a patch queued somewhere to add this option?
>
> Yes, these patches are all in the process of being merged for v4.2, so
> I'd expect this particular Kconfig option to show up sometime soon now.
>
> Thanks,
> Thierry

Kind regards,
 Valentin
