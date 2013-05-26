From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra114: correctly output clk_32k
Date: Sun, 26 May 2013 11:57:57 +0900
Message-ID: <CAAVeFuJvDOuFAHz1zDNaUBFccZenaz9djOBWH5v8GSmbNSLzbQ@mail.gmail.com>
References: <1369379407-12764-1-git-send-email-acourbot@nvidia.com> <519F877F.3050801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <519F877F.3050801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, May 25, 2013 at 12:30 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 05/24/2013 01:10 AM, Alexandre Courbot wrote:
>> Tegra has a blink timer register that allows to modulate the
>> clk_32k clock before outputting it. Since clk_32k is presented to the
>> kernel as a fixed clock, make sure this register does not tamper with
>> the clock frequency and that clk_32k is outputted as-is, similarly to
>> what is done on t20 and t30.
>
> drivers/clk changes should go to Mike Turquette now that there aren't
> any inter-dependencies between core Tegra and Tegra clk driver patches.
>
> I CC'd him here, but perhaps he'll want this resent if he doesn't have
> the original email still.

I just resent the patch to make things easier.

Thanks,
Alex.
