From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: tegra: Add auxiliary data for nvhost
Date: Mon, 26 Nov 2012 15:56:17 +0200
Message-ID: <50B37501.70405@nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com> <1353577684-7896-3-git-send-email-tbergstrom@nvidia.com> <20121123234527.GE21555@avionic-0098.adnet.avionic-design.de> <50B07297.3090001@nvidia.com> <20121124191103.GD26154@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121124191103.GD26154-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 24.11.2012 21:11, Thierry Reding wrote:
>>>> diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-tegra/tegra20_clocks_data.c
>>>> index 7f049ac..3314e50 100644
>>>> --- a/arch/arm/mach-tegra/tegra20_clocks_data.c
>>>> +++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
>>>> @@ -1041,10 +1041,10 @@ static struct clk_duplicate tegra_clk_duplicates[] = {
>>>>  	CLK_DUPLICATE("usbd",	"utmip-pad",	NULL),
>>>>  	CLK_DUPLICATE("usbd",	"tegra-ehci.0",	NULL),
>>>>  	CLK_DUPLICATE("usbd",	"tegra-otg",	NULL),
>>>> -	CLK_DUPLICATE("2d",	"tegra_grhost",	"gr2d"),
>>>> -	CLK_DUPLICATE("3d",	"tegra_grhost",	"gr3d"),
>>>> -	CLK_DUPLICATE("epp",	"tegra_grhost",	"epp"),
>>>> -	CLK_DUPLICATE("mpe",	"tegra_grhost",	"mpe"),
>>>> +	CLK_DUPLICATE("2d",	NULL,		"gr2d"),
>>>> +	CLK_DUPLICATE("3d",	NULL,		"gr3d"),
>>>> +	CLK_DUPLICATE("epp",	NULL,		"epp"),
>>>> +	CLK_DUPLICATE("mpe",	NULL,		"mpe"),
>>>
>>> Are these actually required here?

It looks like the change from tegra_grhost to NULL is required. nvhost
cannot acquire the clock if this change is not done:

[    0.848517] tegra-gr2d tegra-gr2d: Cannot get clock gr2d

But I'll need to stage the aux data and clock changes to separate
patches with explanations.

Terje
