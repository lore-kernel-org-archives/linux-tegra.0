From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dt: tegra: seaboard: add regulators
Date: Tue, 10 Jul 2012 22:09:38 +0530
Message-ID: <4FFC5ACA.8010003@nvidia.com>
References: <4FE80413.6070001@nvidia.com> <4FE87FE3.1080608@wwwdotorg.org> <4FE882A5.3080504@nvidia.com> <20120625222646.GB30406@opensource.wolfsonmicro.com> <4FE8EFC4.3090509@wwwdotorg.org> <4FFC190A.2040800@nvidia.com> <20120710134436.GD9409@opensource.wolfsonmicro.com> <4FFC31D5.7090600@nvidia.com> <20120710135302.GG9409@opensource.wolfsonmicro.com> <4FFC4478.7000204@nvidia.com> <20120710154201.GE10022@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120710154201.GE10022-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 10 July 2012 09:12 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Jul 10, 2012 at 08:34:24PM +0530, Laxman Dewangan wrote:
>
>> The sample code for tps65910 is as follows. So where do you think
>> that it is wrong and what should be correct approach.
>> I need to follow the same for tps6586x also.
> Like I said the use of a supply name should be unconditional, you should
> just set the supply name in the descriptor.
>
if I set the desc.supply_name unconditional then if the entry of that 
supply name is not there in the DT entry (on device node) then that 
regulator will not get registered because the search for 
supply_regulator will fail during registration.

I am setting the desc.supply only when there is supply entry in DT or if 
it is from platform.

Do we need to make such supply pin entry as required inplace of optional?
