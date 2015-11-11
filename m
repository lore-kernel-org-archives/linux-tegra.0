From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH 0/2] Initial support for secured devices
Date: Wed, 11 Nov 2015 09:55:31 -0700
Message-ID: <56437303.7090006@wwwdotorg.org>
References: <1447089586-24826-1-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447089586-24826-1-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/09/2015 10:19 AM, Alban Bedel wrote:
> This series add the bare minimum to be able to use RCM on secured production
> devices. For this the CMAC hash just has to be replaced with an RSA-PSS
> signature, as CryptoPP already provides this algorith it is quiet trivial
> to implement.
>
> Although RCM is now working this doesn't yet allow running the bootloader.
> The miniloader works and it loads the BCT and bootloader, but the handsoff
> to the bootloader isn't working yet. I currently suspect the miniloader as
> the same bootloader works properly when it is flashed on a secured device
> with the proper signature.

CC += Allen, Penny - please see and comment on the patch series on the 
linux-tegra mailing list. Thanks.

I'm rather hesitant to apply this before it's fully proved to be 
working, i.e. before you actually get the downloaded bootloader to work. 
This is simply because it seems likely the patches will need fixes to 
make them fully work.

Some general questions:

1) I believe older chips only support only an SBK, whereas newer chips 
support both SBK and (RSA) PKC (or perhaps just PKC). I assume you're 
using a chip fused to enable PKC. Are you confident that your changes 
won't negatively impact a chip without either SBK or PKC enabled, or 
with an SBK enabled (well, I imagine that doesn't work right now 
anyway...). In particular, I wonder about the comment "above "the CMAC 
hash just has to be replaced"; I hope that doesn't impact 
SBK/non-security-enabled chips.

2) I believe Tegra supports either/both of (a) validating the (BCT and) 
bootloader using the SBK/PKC and (b) encrypting the (BCT and) bootloader 
using the SBK/PKC. Do you know which options your chip is fused for? I 
wonder if the bootloader isn't running because the chip is expecting to 
decrypt it, yet you're supplying a non-encrypted binary, which of course 
gets corrupted during the decryption process?
