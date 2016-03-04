From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] dma: tegra: don't open code of_device_get_match_data()
Date: Fri, 4 Mar 2016 07:34:55 +0530
Message-ID: <56D8ED47.7060500@nvidia.com>
References: <1456838680-3220-1-git-send-email-ldewangan@nvidia.com> <20160303155324.GU11154@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160303155324.GU11154@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 03 March 2016 09:23 PM, Vinod Koul wrote:
> On Tue, Mar 01, 2016 at 06:54:40PM +0530, Laxman Dewangan wrote:
>> Use of_device_get_match_data() for getting matched data
>> instead of implementing this locally.
> I have applied this after fixing subsystem name. Please ensure you use the
> right name
>
>
Ooops, the directory name is "dma" and hence I used subsystem name as "dma".
File names are also containing dma only and so this mistake happened.
Will keep in mind in future patches.
