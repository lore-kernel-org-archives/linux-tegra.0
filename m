From: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 07/12] PCI: tegra: Disable AFI dynamic clock gating
Date: Mon, 30 Oct 2017 21:48:56 +0530
Message-ID: <382903eb-a6ab-218f-c1e1-4cb64d2c802e@nvidia.com>
References: <1509132569-9398-1-git-send-email-mmaddireddy@nvidia.com>
 <1509132569-9398-8-git-send-email-mmaddireddy@nvidia.com>
 <063D6719AE5E284EB5DD2968C1650D6DD00A90B0@AcuExch.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <063D6719AE5E284EB5DD2968C1650D6DD00A90B0-VkEWCZq2GCInGFn1LkZF6NBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 30-Oct-17 9:28 PM, David Laight wrote:
> From: Manikanta Maddireddy
>> Sent: 27 October 2017 20:29
>> When there are 32 outstanding writes from AFI to memory, the outstanding
>> write counter overflows and indicates that there are "0" outstanding write
>> transactions. This outstanding write counter is used to generate IDLE
>> signal to dynamically gate the AFI clock.
>>
>> When memory controller is under heavy load, its possible that write
>> completions will come back to AFI after long delay and AFI write counter
>> overflows. AFI clock gets gated even when there are outstanding
>> transactions towards memory controller resutling in system hang.
>>
>> Disable dynamic clock gating of AFI clock to avoid system hang.
> 
> At least some of the above really ought to be comments in the code.
> (and with the earlier fix for limiting the number of writes.)
> 
> 	David
> 

Ok, will take care of it in next version
