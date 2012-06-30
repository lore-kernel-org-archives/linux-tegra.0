From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: apbio: use dmaengine based dma driver
Date: Sat, 30 Jun 2012 20:31:16 +0530
Message-ID: <4FEF14BC.1080703@nvidia.com>
References: <1340969407-7662-1-git-send-email-ldewangan@nvidia.com> <4FEDE035.6040005@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FEDE035.6040005-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 29 June 2012 10:34 PM, Stephen Warren wrote:
> On 06/29/2012 05:30 AM, Laxman Dewangan wrote:
>> Use the dmaengine based Tegra APB DMA driver for
>> apbio access in place of legacy Tegra APB DMA.
>>
>> The new driver is selected if legacy driver is not
>> selected and new DMA driver is enabled through config
>> file.
>> +bool tegra_apb_dma_init(void)
>> +{
> ...
>> +	tegra_apb_dma_chan = dma_request_channel(mask, NULL, NULL);
>> +	if (!tegra_apb_dma_chan) {
>> +		pr_err("%s: can not allocate dma channel\n", __func__);
>> +		goto err_dma_alloc;
>> +	}
> That fires quite a few times during boot, before the DMA driver is
> probed. I think the message should be down-graded to a pr_dbg(). Do you
> agree? I can fix that myself when applying this if you're OK with the
> change.
>

I saw that you already applied it. But for record, I am fine to change 
it to pr_debug.

> Aside from that, this looks fine to me.
