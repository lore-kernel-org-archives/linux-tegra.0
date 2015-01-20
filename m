From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [Ct173-kernel-internal] [PATCH 0/4] ARM: tegra: Support for big-endian
 (version 3)
Date: Tue, 20 Jan 2015 10:31:19 +0000
Message-ID: <54BE2E77.9050909@codethink.co.uk>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420817231-8346-1-git-send-email-bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ct173-kernel-internal-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/01/15 15:27, Bob Mottram wrote:
> During testing of big-endian on a Jetson TK1 with baserock, the following
> issues were found and fixed. Note that to get the system running with
> big-endian you will need to disable ARCH_SUSPEND_POSSIBLE within
> arch/arm/Kconfig.
> 
> Bob Mottram (4):
>   ARM: tegra: Add a separate big-endian configuration
>   ARM: gpio: tegra: Maintain endianness
>   ARM: tegra: enable big-endian support
>   ARM: tegra: fix big-endian issue with irq code

Is it possible to get the tegra core patches applied? These seem to work
enough to get a system running and once the PM fixes are in there should
be no problems running big-endian tegra?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
