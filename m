From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/2] dma: dmaengine: add slave req id in slave_config
Date: Wed, 9 May 2012 15:57:50 +0530
Message-ID: <4FAA46A6.4090003@nvidia.com>
References: <1336030889-32269-1-git-send-email-ldewangan@nvidia.com>	 <1336030889-32269-2-git-send-email-ldewangan@nvidia.com> <1336553358.1540.169.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336553358.1540.169.camel@vkoul-udesk3>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


Thanks for review.

On Wednesday 09 May 2012 02:19 PM, Vinod Koul wrote:
> On Thu, 2012-05-03 at 13:11 +0530, Laxman Dewangan wrote:
>> The dma controller like Nvidia's Tegra Dma controller
>> supports the different slave requestor id from different slave.
>> This need to be configure in dma controller to handle the request
>> properly.
>>
>> Adding the slave-id in the slave configuration so that information
>> can be passed from client when configuring for slave.
>>
>>   	u32 dst_maxburst;
>>   	bool device_fc;
>> +	int slave_id;
> This wont be negative, so perhaps an unsigned value?

Fine, I will make it unsigned int in my next patch.
