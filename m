From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Don't enable PLLs during early boot
Date: Mon, 25 Mar 2013 10:12:43 -0600
Message-ID: <5150777B.8030304@wwwdotorg.org>
References: <1363953308-28828-1-git-send-email-pdeschrijver@nvidia.com> <514C7D3B.40602@wwwdotorg.org> <20130325110236.GP4977@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130325110236.GP4977-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/25/2013 05:02 AM, Russell King - ARM Linux wrote:
> On Fri, Mar 22, 2013 at 09:48:11AM -0600, Stephen Warren wrote:
>> This assumption was made long ago. I know drivers are supposed to assume
>> that clocks are disabled when they're probed, but historically that
>> wasn't always the case, so if the audio drivers assumed that, and then
>> did clk_enable() as the first thing, they got a warning due to the
>> enabling an already enabled clock and/or later attempts to disable the
>> clocks wouldn't actually disable them.
> 
> No.  clocks have always been able to be enabled multiple times.  You
> should only get a warning if you try and disable it more times than you
> enabled it, because that's a violation of the API.

That may have been the issue; the clock may have been on at boot, and
hence the driver attempted to disable it without ever enabling it
itself, and this triggered an error/warning.

Equally, it's plausible this issue is long gone; the audio clocks were
set up this way due to issues over 2 years ago when the audio code was
upstreamed. At that time, Tegra's clock code was using very little
standard infra-structure, whereas now it's been cleaned up to use the
common clock framework etc.
