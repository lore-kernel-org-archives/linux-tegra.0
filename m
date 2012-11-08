From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] gpio: tegra: create irq mapping in gpio_to_irq
Date: Thu, 8 Nov 2012 09:59:02 +0530
Message-ID: <509B350E.5050105@nvidia.com>
References: <1352300492-24779-1-git-send-email-ldewangan@nvidia.com> <509A9579.5090002@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <509A9579.5090002@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, Stephen Warren <swarren@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 07 November 2012 10:38 PM, Stephen Warren wrote:
> On 11/07/2012 08:01 AM, Laxman Dewangan wrote:
>> The gpio interrupts get mapped linearly and hence the mapping
>> of irq need to be created by irq_create_mapping().
>>
>> The function gpio_to_irq() returns the irq by irq_find_mapping()
>> and so returns 0 as there is no mapping created. Fix the function
>> to create mapping when gpio_to_irq() get called.
> I'm not convinced this should be needed. tegra_gpio_probe() contains:


Oh, yes, I did not observe this code in my review. So this change is not 
resolving any issue.


I think we should move the mapping to gpio_to_irq() rather than doing 
this in probe.
