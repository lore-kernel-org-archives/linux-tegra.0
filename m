From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: fix a possible NULL dereference
Date: Thu, 12 Nov 2015 13:40:56 +0000
Message-ID: <564496E8.60106@nvidia.com>
References: <1447313163-23848-1-git-send-email-clabbe.montjoie@gmail.com>
 <20151112122923.GA31671@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151112122923.GA31671@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LABBE Corentin <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 12/11/15 12:29, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Thu, Nov 12, 2015 at 08:26:03AM +0100, LABBE Corentin wrote:
>> of_match_device could return NULL, and so cause a NULL pointer
> 
> No. There is no way that of_match_device() can ever fail. The driver
> core uses the same table to match the OF device to the driver, so the
> only case where of_match_device() would return NULL is if no match was
> found, in which case the tegra_i2c_probe() function would never have
> been called in the first place.

Right and so ...

>> dereference later at line 809:
>> i2c_dev->hw = match->data;
>>
>> Signed-off-by: LABBE Corentin <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index a0522fc..c803551 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -806,7 +806,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>>  
>>  	if (pdev->dev.of_node) {

Can we get rid of this if-statement?

Jon
