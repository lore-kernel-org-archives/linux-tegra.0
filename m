From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5 7/8] ARM: tegra: Add board data and 2D clocks
Date: Wed, 16 Jan 2013 08:09:54 +0200
Message-ID: <50F64432.4030809@nvidia.com>
References: <1358249182-17486-1-git-send-email-tbergstrom@nvidia.com> <1358249182-17486-8-git-send-email-tbergstrom@nvidia.com> <50F5A3A6.7000801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50F5A3A6.7000801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 15.01.2013 20:44, Stephen Warren wrote:
>> diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
> 
>> +	OF_DEV_AUXDATA("nvidia,tegra20-gr2d", 0x54140000, "gr2d", NULL),
> 
> I assume the only reason to add AUXDATA is to give the device a specific
> name, which will then match the driver name in the clock driver:
> 
>> -	CLK_DUPLICATE("2d",	"tegra_grhost",	"gr2d"),
>> +	CLK_DUPLICATE("2d",	"gr2d",	"gr2d"),
> 
> If so, this shouldn't be needed once the common clock framework patches
> are applied, since all device clocks will be retrieved from device tree,
> and hence the device name will be irrelevant; the phandle in device tree
> is all that will matter.

Yes, clock binding is the only reason for the OF_DEV_AUXDATA line. I'll
need to look into Prashant's clock changes, but I assume it's going to
be a trivial change to host1x patches.

Thanks for the heads-up.

Terje
