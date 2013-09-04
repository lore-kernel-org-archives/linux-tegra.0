From: Kyle McMartin <kmcmarti-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: tegra on 3.11
Date: Wed, 4 Sep 2013 14:38:15 -0400
Message-ID: <20130904183815.GC16338@redacted.bos.redhat.com>
References: <20130820150418.GI27560@redacted.bos.redhat.com>
 <5213C0F2.9060909@wwwdotorg.org>
 <20130827213445.GI8764@redacted.bos.redhat.com>
 <521D1D7F.7060006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <521D1D7F.7060006-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

> > [   29.198018] PCI: enabling device 0000:01:00.0 (0140 -> 0143)
> > [   29.198180] Unhandled fault: imprecise external abort (0x406) at
> > 0xb6f49000
> > [   29.205136] Internal error: : 406 [#1] SMP ARM
> > 
> > looks to be the first time we touch the HW in rtl_init_one.
> > 
> > Seen anything similar, or should I start debugging further?
> 
> PCIe isn't expected to work usefully until 3.12, unless you've manually
> merged in Thierry's Tegra PCIe driver rewrite. It's probably worth
> disabling it in your .config file.

fwiw, the problem was CONFIG_PCIEPORTBUS in our config, I've not had
a chance to track down what the issue actually is, but that driver
busted things in 3.11.

regards, Kyle
