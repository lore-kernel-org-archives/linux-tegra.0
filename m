From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 7/8] ARM: tegra: Add board data and 2D clocks
Date: Mon, 04 Feb 2013 10:06:16 -0700
Message-ID: <510FEA88.8040802@wwwdotorg.org>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com> <1358250244-9678-8-git-send-email-tbergstrom@nvidia.com> <20130204112622.GC595@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130204112622.GC595-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/04/2013 04:26 AM, Thierry Reding wrote:
> On Tue, Jan 15, 2013 at 01:44:03PM +0200, Terje Bergstrom wrote:
>> Add a driver alias gr2d for Tegra 2D device, and assign a
>> duplicate of 2D clock to that driver alias.
>> 
>> Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> --- 
>> arch/arm/mach-tegra/board-dt-tegra20.c    |    1 + 
>> arch/arm/mach-tegra/board-dt-tegra30.c    |    1 + 
>> arch/arm/mach-tegra/tegra20_clocks_data.c |    2 +- 
>> arch/arm/mach-tegra/tegra30_clocks_data.c |    1 + 4 files
>> changed, 4 insertions(+), 1 deletion(-)
> 
> With Prashant's clock rework patches now merged this patch can be 
> dropped.

Assuming this series is applied for 3.10 and not earlier, yes. I'd
certainly recommend applying for 3.10 not 3.9; the dependencies to
apply this for 3.9 given the AUXDATA/... requirements would be too
painful.
