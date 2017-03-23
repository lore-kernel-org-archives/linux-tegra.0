From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Only 3.5 GB RAM on Jetson TX1
Date: Thu, 23 Mar 2017 10:24:56 -0600
Message-ID: <8453cf91-0b27-9968-59b8-7b697e8cd1f8@wwwdotorg.org>
References: <20170323001357.GA7546@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170323001357.GA7546-IRMp5PtgtdoigzW5ZibpNwC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/22/2017 06:13 PM, Martin Michlmayr wrote:
> Vagrant Cascadian observed that only 3.5 GB RAM are available on the
> Jetson TX1 development kit.
>
> [    0.000000] Memory: 3501036K/3670016K available (6780K kernel code, 1020K rwdata, 2164K rodata, 3264K init, 634K bss, 168980K reserved, 0K cma-reserved)
>
> Interestingly, even u-boot only shows 3.5 GB:
>
> DRAM:  3.5 GiB
>
> This is with mainline u-boot 2016.11 and R23.2 (2016.03-00633-g3ef9cdb).

That's expected.

A portion of the top-of-ram holds various carve-outs, such as for the 
secure OS and perhaps other purposes like media buffers. Mainline U-Boot 
currently hard-codes the size of this unusable RAM area to a very 
conservative size. Ideally, U-Boot would query the size of the RAM from 
the secure monitor, or retrieve it from information passed by an earlier 
stage bootloader. However, doing so relies on using interfaces that may 
not be strict ABIs, so we didn't want to make upstream U-Boot use them 
at least when we first upstreamed T210 support.

> However, 2015.07-rc2-g78c8468 (from R23.1.1) shows:
>
> DRAM:  4 GiB
>
> but that u-boot doesn't boot mainline kernels (some DT errors).

Conversely, the L4T version of U-Boot is expected to work with the 
specific SW stack shipped with L4T, and hence does determine the 
carveout size at runtime, and hence allows access to a bit more RAM.

L4T U-Boot should boot an upstream kernel without issue. You may need to 
delete a few environment variables to stop U-Boot attempting to copy 
some data from the NV-bootloader-supplied DTB into the DTB that U-Boot 
itself loads from "disk" and passes to the kernel.
