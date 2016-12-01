From: Ralf Ramsauer <ralf.ramsauer-XqyLlMioih3Nn6Kn0k1nHrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra freezes when touching ungated MMIO regions
Date: Thu, 1 Dec 2016 17:47:51 +0100
Message-ID: <aa11510a-9b59-a8f8-61af-9d6d7c3a13a7@oth-regensburg.de>
References: <1f501c0b-0a6a-39b4-208a-509a606ff3fe@oth-regensburg.de>
 <c94b6cbe-86e2-f960-bb0d-d0171655e6dd@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c94b6cbe-86e2-f960-bb0d-d0171655e6dd-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ralf Ramsauer <ralf.ramsauer-XqyLlMioih3Nn6Kn0k1nHrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jailhouse <jailhouse-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?Q?Andreas_K=c3=b6lbl?= <andreas.koelbl-3hJwHgKweOl99bV2EpccEXqWYbMAw+HU@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On 12/01/2016 05:04 PM, Stephen Warren wrote:
> On 12/01/2016 07:15 AM, Ralf Ramsauer wrote:
>> Hi,
>>
>> I observed that touching MMIO regions of Tegra devices with its
>> corresponding clock gate deactivated immediately freezes the whole
>> system. No kernel panic, nothing.
>>
>> I tested this behavior with a small kernel module, find it attached. A
>> few seconds after loading this module, the whole device freezes. Tested
>> this on a TK1 and TX1.
> 
> Unfortunately, this is indeed the way the HW works.
That's no good news :(

Do you know if this applies to the whole Tegra architecture or only to
some boards?
> 
>> What is the actual expected behavior on ARM(64) when touching ungated
>> MMIO regions? Is it specified somewhere?
> 
> I don't believe the ARM architecture specifies behaviour in this case,
> or if it does, defines it as implementation defined, which means that
> pretty much any behaviour is valid.
I tested the same scenario on another ARM64 board (LeMaker HiKey), which
did (fortunately) not freeze.

  Ralf
