From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 13/31] dma: tegra: register as an OF DMA controller
Date: Wed, 20 Nov 2013 11:22:03 -0700
Message-ID: <528CFDCB.1080200@wwwdotorg.org>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org> <1384548866-13141-14-git-send-email-swarren@wwwdotorg.org> <201311201628.57951.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201311201628.57951.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/20/2013 08:28 AM, Arnd Bergmann wrote:
> On Friday 15 November 2013, Stephen Warren wrote:
...
>> @@ -1383,6 +1409,10 @@ static int tegra_dma_probe(struct platform_device *pdev)
>>                 goto err_irq;
>>         }
>>  
>> +       tegra_dma_info.dma_cap = tdma->dma_dev.cap_mask;
>> +       ret = of_dma_controller_register(pdev->dev.of_node,
>> +                                        of_dma_simple_xlate, &tegra_dma_info);
>> +
> 
> I would suggest to use a custom xlate() function based on
> dma_get_slave_channel() that was added recently: Iterating through all
> channels is not necessary any more.

OK, I've converted to that locally, and will repost soon.
