From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 05/12] firmware: tegra: Add BPMP support
Date: Mon, 22 Aug 2016 15:24:28 +0100
Message-ID: <6bb4d32f-4f13-285e-430e-672f375a9a46@nvidia.com>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <20160819173233.13260-6-thierry.reding@gmail.com>
 <94227d94-1d60-fda7-731b-26656633d585@nvidia.com>
 <20160822125458.GC17367@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160822125458.GC17367-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 22/08/16 13:54, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, Aug 22, 2016 at 10:26:50AM +0100, Jon Hunter wrote:
>>
>> On 19/08/16 18:32, Thierry Reding wrote:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> The Boot and Power Management Processor (BPMP) is a co-processor found
>>> on Tegra SoCs. It is designed to handle the early stages of the boot
>>> process and offload power management tasks (such as clocks, resets,
>>> powergates, ...) as well as system control services.
>>>
>>> Compared to the ARM SCPI, the services provided by BPMP are message-
>>> based rather than method-based. The BPMP firmware driver provides the
>>> services to transmit data to and receive data from the BPMP. Users can
>>> also register an MRQ, for which a service routine will be run when a
>>> corresponding event is received from the firmware.
>>
>> MRQ?
> 
> I think that means "Message ReQuest", which is sort of like an IRQ but
> the user will receive a message (with potentially payload) instead. Do
> you want me to spell that out in the commit message, or what would you
> suggest?

I think that if we simply say 'Message ReQuest (MRQ)" it becomes clearer
what this is. Otherwise, google returns everything from 'most recent
quarter' to canadian rock bands :-)

Cheers
Jon

-- 
nvpublic
