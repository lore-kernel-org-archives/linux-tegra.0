From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] dma: tegra: don't open code of_device_get_match_data()
Date: Fri, 4 Mar 2016 07:36:04 +0530
Message-ID: <56D8ED8C.4090708@nvidia.com>
References: <1456928966-1192-1-git-send-email-ldewangan@nvidia.com> <20160303160021.GV11154@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160303160021.GV11154@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 03 March 2016 09:30 PM, Vinod Koul wrote:
> On Wed, Mar 02, 2016 at 07:59:26PM +0530, Laxman Dewangan wrote:
>> Use of_device_get_match_data() for getting matched data
>> instead of implementing this locally.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> ---
>> Changes form V1:
>> - Found that it is possible to move of_device_id table to down
>>    where this is used i.e. just above the platform driver structure.
>>    Make this change on V2.
> But that is just noise and not relevant to the title which patch says. If
> you want to do this code move please send that separately. I have picked v1
> for now
>

OK, fine with me. Will post another patch.
