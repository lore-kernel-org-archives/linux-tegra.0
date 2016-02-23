From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] remove invalid uses of rsvd1 from beaver
 config
Date: Tue, 23 Feb 2016 14:58:36 -0700
Message-ID: <56CCD60C.9020601@wwwdotorg.org>
References: <1456260126-16113-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456260126-16113-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/23/2016 01:42 PM, Lucas Stach wrote:
> Replace by actual function names of pinmux option 1.

It would be worth updating the U-Boot pinmux table too 
(board/nvidia/cardhu/pinmux-config-cardhu.h). Prior to Tegra124, the 
U-Boot per-board pinmux tables weren't auto-generated from this project, 
so you'll have to make a similar by-hand edit.

I'll apply this tomorrow unless there are objections from the list.
