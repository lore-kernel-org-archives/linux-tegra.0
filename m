From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 10/27] drivers/memory: don't check resource with devm_ioremap_resource
Date: Tue, 23 Jul 2013 18:27:57 -0700
Message-ID: <51EF2D9D.8030904@wwwdotorg.org>
References: <1374602524-3398-1-git-send-email-wsa@the-dreams.de>  <1374602524-3398-11-git-send-email-wsa@the-dreams.de> <1374603925.3387.26.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374603925.3387.26.camel@joe-AO722>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/23/2013 11:25 AM, Joe Perches wrote:
> On Tue, 2013-07-23 at 20:01 +0200, Wolfram Sang wrote:
>> devm_ioremap_resource does sanity checks on the given resource. No need to
>> duplicate this in the driver.
> 
> Hi Wolfram:
> 
> This is the first and only one of the patch series I looked at.
> 
>> diff --git a/drivers/memory/tegra20-mc.c b/drivers/memory/tegra20-mc.c
> []
>> @@ -218,8 +218,6 @@ static int tegra20_mc_probe(struct platform_device *pdev)
>>  		struct resource *res;
>>  
>>  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>> -		if (!res)
>> -			return -ENODEV;
>>  		mc->regs[i] = devm_ioremap_resource(&pdev->dev, res);
> 
> I'm not so sure this is appropriate.
> 
> devm_ioremap_resource returns ERR_PTR(-EINVAL) for
> null resource so this changes the return.

I think the exact return value is probably pretty arbitrary here.

> devm_ioremap_resource also emits a noisy dev_err
> message when resource is NULL.
> 
> It's a probe and before the message log would be silent
> but now there's a new dmesg.

I think those changes are fine, at least for this driver. It's a bug if
the required resources are missing, and having probe() actively point
out why it's failing can only be a good thing in my book.
