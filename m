From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Tegra: Add clock entry for smp_twd clock
Date: Fri, 01 Mar 2013 11:25:45 -0700
Message-ID: <5130F2A9.7000609@wwwdotorg.org>
References: <1362037381-4730-1-git-send-email-pgaikwad@nvidia.com> <512F9F59.5030702@wwwdotorg.org> <20130228200415.GA17598@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130228200415.GA17598-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/28/2013 01:04 PM, Thierry Reding wrote:
> On Thu, Feb 28, 2013 at 11:18:01AM -0700, Stephen Warren wrote:
>> On 02/28/2013 12:43 AM, Prashant Gaikwad wrote:
>>> As DT support for clocks and smp_twd is enabled, add clock
>>> entry for smp_twd clock to DT.
>> 
>> Is this a cleanup for 3.10, or a bug-fix for 3.9? Perhaps it
>> solves the "twd: clock not found" bug I reported?
> 
> Yes. This is pretty much identical to the patch I sent a few days
> ago before your patch that fixed the clock drivers to match the
> devicetree binding documentation.
> 
> The "clock not found" is exactly what this fixes.

OK. I'll forward these patches to arm-soc as fixes for 3.9 then. I
tested them and they work for me, on top of Linus' latest master.
