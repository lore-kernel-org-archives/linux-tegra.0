From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 01/14] ARM: tegra: annotate IO_*_VIRT pointers
Date: Thu, 13 Oct 2011 15:27:13 -0700
Message-ID: <CAOesGMghHKR5Z3LxH454_OgaeiD+1KN4tFYgPqChbY7h4LsGZw@mail.gmail.com>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
	<1318224484-2090-1-git-send-email-olof@lixom.net>
	<1318224484-2090-2-git-send-email-olof@lixom.net>
	<20111013141036.GX21648@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111013141036.GX21648-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 13, 2011 at 7:10 AM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Sun, Oct 09, 2011 at 10:27:51PM -0700, Olof Johansson wrote:
>> +#ifdef __ASSEMBLY__
>> +#define __IOVADDR(x) (x)
>> +#else
>> +#define __IOVADDR(x) ((void __force __iomem *)(x))
>
> Please call this IOMEM() - see:
>
> grep '#define *IOMEM' arch/arm/*/include/mach -r
>
> for its establishment across several implementations.


Ah, thanks! I did look for a pre-existing one, but not closely enough.
I've revised the patch and will send a fresh pull request to Arnd with
the new contents.

I suppose there is some value in doing a global variant of this
instead of having it redefined on all platforms. I'll add it to the
list of cleanups to look at.


-Olof
