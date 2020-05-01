From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH AUTOSEL 5.6 30/38] i2c: tegra: Better handle case where
 CPU0 is busy for a long time
Date: Thu, 30 Apr 2020 20:59:50 -0400
Message-ID: <20200501005950.GE13035@sasha-vm>
References: <20200424122237.9831-1-sashal@kernel.org>
 <20200424122237.9831-30-sashal@kernel.org>
 <20200427072233.GB3451400@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200427072233.GB3451400@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 27, 2020 at 09:22:33AM +0200, Thierry Reding wrote:
>On Fri, Apr 24, 2020 at 08:22:28AM -0400, Sasha Levin wrote:
>> From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> [ Upstream commit a900aeac253729411cf33c6cb598c152e9e4137f ]
>>
>> Boot CPU0 always handle I2C interrupt and under some rare circumstances
>> (like running KASAN + NFS root) it may stuck in uninterruptible state for
>> a significant time. In this case we will get timeout if I2C transfer is
>> running on a sibling CPU, despite of IRQ being raised. In order to handle
>> this rare condition, the IRQ status needs to be checked after completion
>> timeout.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
>> Signed-off-by: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 27 +++++++++++++++------------
>>  1 file changed, 15 insertions(+), 12 deletions(-)
>
>Hi Sasha,
>
>can you drop this from the v5.6 stable queue please? Jon discovered that
>this patch introduces a regression in v5.7, and since we don't have a
>good understanding of why this is breaking things I think it'd be best
>if we reverted it for v5.7 until we come up with a good fix.
>
>I think the same applies for the other i2c/tegra patch that's 31/38 of
>this series.

I've dropped both of these, thanks!

-- 
Thanks,
Sasha
