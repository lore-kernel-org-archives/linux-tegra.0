From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] staging: Introduce NVIDIA Tegra20 video decoder
 driver
Date: Thu, 28 Sep 2017 14:37:03 +0300
Message-ID: <69a019f1-8ce5-6b8b-8eb9-2ce9b8c2759d@gmail.com>
References: <cover.1506377430.git.digetx@gmail.com>
 <5c8b83775b982e6ee851c127444a8e839f422ad0.1506377430.git.digetx@gmail.com>
 <20170927094557.yr2fl5arodjnh637@mwanda>
 <2b77bfa7-1272-3d11-9190-326fa0f85f22@gmail.com>
 <20170928072308.s7npizjfnhkxh6zb@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928072308.s7npizjfnhkxh6zb@mwanda>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 28.09.2017 10:23, Dan Carpenter wrote:
> On Thu, Sep 28, 2017 at 02:28:04AM +0300, Dmitry Osipenko wrote:
>>>> +	if (is_baseline_profile)
>>>> +		frame->aux_paddr = 0xF4DEAD00;
>>>
>>> The handling of is_baseline_profile is strange to me.  It feels like we
>>> should always check it before we use ->aux_paddr but we don't ever do
>>> that.
>>>
>>
>> In a case of baseline profile, aux buffer isn't needed, HW should't use it. Aux
>> phys address is set to a predefined and invalid address, so that in a case of
>> VDE trying to use it, its invalid memory accesses would be reported in KMSG by
>> memory controller driver and the reported invalid addresses would be known to be
>> associated with the aux buffer. I'm not sure what you are meaning.
> 
> It's not used perhaps, but we do write it to the hardware, right?
> 

That's right. I'm pretty sure HW won't use the aux in a case of baseline
profile, haven't seen an evidence of it. But in order to be on a safe side, the
addresses are initialized to an invalid value, so HW won't have a chance to
silently fetch/trash 'arbitrary' main memory and we will know if it tries to do it.

	if (baseline_profile)
		frame->aux_paddr = 0xF4DEAD00;
	else {

So here ^ all *used* frame entries are being initialized.

> 	tegra_vde_write_iram_entry(iram_tables, 0, i, value, aux_paddr);
> 
> It's just strange.
> 

There up to 16 reference video frames (already decoded) that could be used for
decoding of a video frame. Addresses of reference frames that shouldn't be used
for decoding of the current frame are set to an invalid address. Userspace my
supply wrong frames list or frames list setup code may contain an obscure bug
and we will know about it.

	} else {
		aux_paddr = 0xFADEAD00;
		value = 0;
	}

Here ^ all *unused* frame entries are being initialized.

	tegra_vde_write_iram_entry(iram_tables, 0, i, value, aux_paddr);

And here ^ these entries are written to the tables that are read by HW.

-- 
Dmitry
