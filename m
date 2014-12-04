From: James Thomas <james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [flasher PATCH] Set bootdelay to 0
Date: Thu, 04 Dec 2014 11:50:41 +0000
Message-ID: <54804A91.9080102@codethink.co.uk>
References: <1417024626-6616-1-git-send-email-james.thomas@codethink.co.uk> <1417024626-6616-2-git-send-email-james.thomas@codethink.co.uk> <547CADF7.8030506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547CADF7.8030506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/12/14 18:05, Stephen Warren wrote:
> On 11/26/2014 10:57 AM, James Thomas wrote:
>> On 32-bit systems fdtput writes 0xfffffffe as 0x7fffffff, which takes
>> some time to complete.
>>
>> Setting this to 0 accomplishes the same goal
> 
> A value of 0 doesn't mean the same thing. 0 means that bootdelay is enabled,
> just with an immediate timeout, whereas -2 means that bootdelay is disabled
> completely, so that boot can't be interrupted. The difference is that when
> bootdelay is 0, the user can still press a key before the boot delay check, and
> break into the boot process. This would make the flasher less reliable.

Ah, right, that makes sense, thanks for the feedback
> 
> Can you explain why the correct value doesn't get into the DTB? It seems better
> to fix that bug in fdtput instead. Or perhaps there's a bug in the command-line
> arguments to fdtput that should be fixed?

Command-line argument should have been the first thing I checked, I think we
need to use -t x (hex) here instead of int. Now works correctly on 32-bit and
64-bit (i'll resubmit)

Thanks
James
