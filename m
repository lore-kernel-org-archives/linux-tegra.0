From: Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: No Tegra board file updates for 2.6.40
Date: Fri, 20 May 2011 18:42:57 +0200
Message-ID: <BANLkTim+NGGjnD6T6+z_vSKohEo1dkZV6w@mail.gmail.com>
References: <BANLkTin-MrstYQQ0M7DfGFEpzKnyEUWVmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTin-MrstYQQ0M7DfGFEpzKnyEUWVmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 20, 2011 at 3:48 AM, Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> Russell is trying to keep the overall diff stats for 2.6.40 in
> arch/arm/ negative, and to support that I am not going to pull any
> board file changes for 2.6.40.

That's a pity ... :(

> =A0Hopefully we'll have a clear direction
> on how to proceed with new boards and new devices in existing boards
> in 2.6.41.

I don't think there will be any significant change. I doubt the
devicetree ability to go up to speed in that short time...
As an intemediate measure I'd suggest adding
tegra_register_<device>(struct <device>_platform_data *) to, say
arch/arm/mach-tegra/devices.[ch]. It will not generate negative
diffstat, but it reduces amount of code duplications among board files
and may prove helpfull when we'll transition to the devicetree.

> I plan to pull all the outstanding changes and put them in
> Tegra's for-next as soon as 2.6.40-rc1 is released.
>
> In 2.6.40 I'll try to move some of the core drivers like gpio into
> drivers/, which should help provide some negative diffstat to offset
> board files and PM support.
> --



--=20
Sincerely Yours,
Mike.
