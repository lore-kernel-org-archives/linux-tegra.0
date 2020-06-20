From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] [v3] dmaengine: tegra210-adma: Fix runtime PM imbalance
 on error
Date: Sat, 20 Jun 2020 10:53:20 +0100
Message-ID: <f4034e16-e720-57c4-eb9d-733786212a4a@nvidia.com>
References: <20200618105727.14669-1-dinghao.liu@zju.edu.cn>
 <9f7684d9-7a75-497d-db1c-75cf0991a072@nvidia.com>
 <24ea1ef1.10213.172ca4d45be.Coremail.dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <24ea1ef1.10213.172ca4d45be.Coremail.dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org
Cc: kjlu-OJFnDUYgAso@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 19/06/2020 02:59, dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org wrote:
>>
>> Why noidle?
>>
> 
> _noidle is enough for fixing this bug. _sync may suspend
> the device beyond expectation.

In that case, then the other instance you are fixing with this patch is
not correct.

Jon

-- 
nvpublic
