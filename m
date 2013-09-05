From: Kyle McMartin <kmcmarti-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: tegra on 3.11
Date: Thu, 5 Sep 2013 17:43:45 -0400
Message-ID: <20130905214345.GF16338@redacted.bos.redhat.com>
References: <20130820150418.GI27560@redacted.bos.redhat.com>
 <5213C0F2.9060909@wwwdotorg.org>
 <20130827213445.GI8764@redacted.bos.redhat.com>
 <521D1D7F.7060006@wwwdotorg.org>
 <20130904183815.GC16338@redacted.bos.redhat.com>
 <5228F42F.50904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5228F42F.50904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 05, 2013 at 03:14:23PM -0600, Stephen Warren wrote:
> Ah, I guess if you build the R8169 driver as a module, and disable
> CONFIG_CPU_IDLE, then it will work fine on TrimSlice in v3.11.
> 
> I have reproduced the issue you see with CONFIG_PCIEPORTBUS in v3.11.
> So, at least it isn't an isolated incident. That said, I don't intend to
> look into it since there's an easy workaround, and ...
> 
> The good news is that in v3.12 with the new PCIe driver,
> 
> (a) You don't need to build R8169 as a module; built-in will work fine.
> 
> (b) You don't need to disable CPUIDLE; the code disables the problematic
> idle state automatically iff a PCIe device is detected.
> 
> (c) CONFIG_PCIEPORTBUS is enabled in tegra_defconfig, and everything
> still works fine.
> 

Awesome. Thanks very much Stephen, I'll make those changes to our
3.12 snapshots.

--Kyle
