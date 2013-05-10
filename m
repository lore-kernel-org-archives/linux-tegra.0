From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 04/42] drivers/dma: don't check resource with devm_ioremap_resource
Date: Fri, 10 May 2013 13:25:36 -0600
Message-ID: <518D49B0.4050901@wwwdotorg.org>
References: <1368173847-5661-1-git-send-email-wsa@the-dreams.de> <1368173847-5661-5-git-send-email-wsa@the-dreams.de> <518D21D4.6000609@wwwdotorg.org> <20130510175739.GA2912@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130510175739.GA2912@katana>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/10/2013 11:57 AM, Wolfram Sang wrote:
> On Fri, May 10, 2013 at 10:35:32AM -0600, Stephen Warren wrote:
>> On 05/10/2013 02:16 AM, Wolfram Sang wrote:
>>> devm_ioremap_resource does sanity checks on the given resource. No need to
>>> duplicate this in the driver.
>>
>>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>>
>>>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> -	if (!res) {
>>> -		dev_err(&pdev->dev, "No mem resource for DMA\n");
>>> -		return -EINVAL;
>>> -	}
>>> -
>>>  	tdma->base_addr = devm_ioremap_resource(&pdev->dev, res);
>>
>> One issue here is that it's not obvious just from reading the code
>> that's left behind that the "missing" error-checking of the
>> platform_get_resource() return value is OK because
>> devm_ioremap_resource() will check it "for us". Everyone now has to
>> mentally maintain a list of exceptions where it's OK not to error-check.
> 
> My goal is to make not-checking the standard case with devm.

OK, if no parameters passed to any devm function every need to be
error-checked, that'll certainly be a bit easier to remember.
