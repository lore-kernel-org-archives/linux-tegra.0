From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: tegra on 3.11
Date: Thu, 05 Sep 2013 15:14:23 -0600
Message-ID: <5228F42F.50904@wwwdotorg.org>
References: <20130820150418.GI27560@redacted.bos.redhat.com> <5213C0F2.9060909@wwwdotorg.org> <20130827213445.GI8764@redacted.bos.redhat.com> <521D1D7F.7060006@wwwdotorg.org> <20130904183815.GC16338@redacted.bos.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130904183815.GC16338-nxOev/eQj6CGu0OVIAPS5KfLeoKvNuZc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyle McMartin <kmcmarti-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/04/2013 12:38 PM, Kyle McMartin wrote:
>>> [   29.198018] PCI: enabling device 0000:01:00.0 (0140 -> 0143)
>>> [   29.198180] Unhandled fault: imprecise external abort (0x406) at
>>> 0xb6f49000
>>> [   29.205136] Internal error: : 406 [#1] SMP ARM
>>>
>>> looks to be the first time we touch the HW in rtl_init_one.
>>>
>>> Seen anything similar, or should I start debugging further?
>>
>> PCIe isn't expected to work usefully until 3.12, unless you've manually
>> merged in Thierry's Tegra PCIe driver rewrite. It's probably worth
>> disabling it in your .config file.
> 
> fwiw, the problem was CONFIG_PCIEPORTBUS in our config, I've not had
> a chance to track down what the issue actually is, but that driver
> busted things in 3.11.

Ah, I guess if you build the R8169 driver as a module, and disable
CONFIG_CPU_IDLE, then it will work fine on TrimSlice in v3.11.

I have reproduced the issue you see with CONFIG_PCIEPORTBUS in v3.11.
So, at least it isn't an isolated incident. That said, I don't intend to
look into it since there's an easy workaround, and ...

The good news is that in v3.12 with the new PCIe driver,

(a) You don't need to build R8169 as a module; built-in will work fine.

(b) You don't need to disable CPUIDLE; the code disables the problematic
idle state automatically iff a PCIe device is detected.

(c) CONFIG_PCIEPORTBUS is enabled in tegra_defconfig, and everything
still works fine.
