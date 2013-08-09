From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] clk: tegra114: Fix incorrect placement of __initdata
Date: Fri, 9 Aug 2013 11:02:15 +0530
Message-ID: <CAK9yfHyOsnSvE65hpcJUZW4yapf3NZMLs9vS=YFR=Nh8Z8TF=g@mail.gmail.com>
References: <1375935949-19557-1-git-send-email-sachin.kamat@linaro.org>
	<5203E097.1040502@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5203E097.1040502-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 8 August 2013 23:46, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 08/07/2013 10:25 PM, Sachin Kamat wrote:
>> __initdata should be placed between the variable name and equal
>> sign for the variable to be placed in the intended section.
>
> The series,
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Patch 1,
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks Stephen.


-- 
With warm regards,
Sachin
