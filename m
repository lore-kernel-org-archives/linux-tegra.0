From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Tue, 21 Apr 2020 22:07:54 +0300
Message-ID: <07351901-a533-0319-b2fd-f49f6540c238@gmail.com>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
 <db1132ce-53a8-371c-98e0-cb7cd91d5c7d@gmail.com>
 <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
 <93b738f2-ccf2-68ed-3ca5-30945bd40521@gmail.com>
 <61c9f5a7-3a48-8200-1cfe-d5d0524511f7@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <61c9f5a7-3a48-8200-1cfe-d5d0524511f7-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

21.04.2020 18:34, Jon Hunter пишет:
> 
> On 21/04/2020 16:18, Dmitry Osipenko wrote:
>> 21.04.2020 17:40, Jon Hunter пишет:
>>>
>>> On 21/04/2020 14:25, Dmitry Osipenko wrote:
>>>> 21.04.2020 12:49, Jon Hunter пишет:
>>>> ...
>>>>> I can try the above, but I agree it would be best to avoid messing with
>>>>> the suspend levels if possible.
>>>>
>>>> Will be awesome if you could try it and report back the result.
>>>>
>>>
>>> I gave it a try but suspend still fails.
>>
>> Is this regulator error gone with my changes?
>>
>> [   60.450346] WARNING: CPU: 0 PID: 653 at
>> /home/jonathanh/workdir/tegra/mlt-linux_next/kernel/drivers/regulator/core.c:2603
>> _regulator_disable+0xb8/0x1b4
>> [   60.463959] unbalanced disables for vdd_pexa,vdd_pexb
> 
> The above is still there with your changes.

Interesting, hopefully the PM logs will point out the source of the problem.
