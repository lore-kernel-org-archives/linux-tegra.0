From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL] ARM: tegra: Include assembler.h in sleep.S to fix
 build break
Date: Tue, 27 Mar 2012 17:56:08 -0700
Message-ID: <CAOesGMiK3fLQP0oNZS0QwTM1+4uLs_QfAWbLXzH-=TWXSXbY7A@mail.gmail.com>
References: <4F709723.4080206@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F709723.4080206-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Mon, Mar 26, 2012 at 9:19 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>=
 wrote:
> Arnd, Olof,
>
> This pull request depends on the merge of:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git
> devel/io-cleanup
> (specifically 6f6f6a7 ARM: create a common IOMEM definition)
>
> and:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git for-3.4/=
soc
> (specifically c76fcc8 ARM: tegra: assembler code for LP3)
>
> and is based on a local branch that merges the two branches above.
>
> The following changes since commit 1ad105fc77e61f9dd7a272659a248e2979=
fdb893:
> =A0Stephen Warren (1):
> =A0 =A0 =A0 =A0Merge remote branch 'remotes/korg_olof_tegra/for-3.4/s=
oc' into
> for-3.4/fixes-for-io-cleanup

Thanks, pulled into next/cleanup2 (after pulling in tegra/t30-smp into
the same).


-Olof
