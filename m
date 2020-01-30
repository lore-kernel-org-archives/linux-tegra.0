From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 12/16] dmaengine: tegra-apb: Clean up suspend-resume
Date: Thu, 30 Jan 2020 23:06:14 +0300
Message-ID: <fb32d2e2-4cd3-c493-7792-3da62276cc07@gmail.com>
References: <20200130043804.32243-1-digetx@gmail.com>
 <20200130043804.32243-13-digetx@gmail.com>
 <3507dcb9-4a92-8145-1953-e40960604661@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3507dcb9-4a92-8145-1953-e40960604661-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

30.01.2020 22:00, Jon Hunter пишет:
> 
> On 30/01/2020 04:38, Dmitry Osipenko wrote:
>> It is enough to check whether hardware is busy on suspend and to reset
>> it across of suspend-resume because channel's configuration is fully
>> re-programmed on each DMA transaction anyways and because save-restore
>> of an active channel won't end up well without pausing transfer prior to
>> saving of the state (note that all channels shall be idling at the time of
>> suspend, so save-restore is not needed at all).
> 
> Maybe just update the commit message to state that the pause callback is
> not implemented and channel pause is not supported prior to T114. And
> then ...
> 
> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, I'll update the message.
