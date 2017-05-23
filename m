From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 14/22] gpu: host1x: Forbid relocation address shifting in
 the firewall
Date: Tue, 23 May 2017 13:58:51 +0300
Message-ID: <b481d7f3-d82a-407b-4eb0-6ed24ca32199@gmail.com>
References: <cover.1495498184.git.digetx@gmail.com>
 <15311f1c044c3ff26624e2a980b0c477b1cf33b2.1495498184.git.digetx@gmail.com>
 <3c5d7896-6753-78c5-5a74-25061244acff@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3c5d7896-6753-78c5-5a74-25061244acff-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 23.05.2017 13:14, Mikko Perttunen wrote:
> Reloc shifts are implemented (see assignment of u32 reloc_addr in do_relocs),
> and they are required for VIC job submissions.
> 

The *validation* is unimplemented. Since VIC uses the shifts, we may add a
validation for it in a way it is done for the registers / class checks, i.e.
compare the per address register shift value. I suppose those registers are
documented somewhere(TRM), could you please point me to them (TRM page, reg name)?

> On 23.05.2017 03:14, Dmitry Osipenko wrote:
>> Incorrectly shifted relocation address will cause a lower memory corruption
>> and likely a hang on a write or a read of an arbitrary data in case of IOMMU
>> absent. As of now there is no use for the address shifting (at least on
>> Tegra20) and adding a proper shifting / sizes validation is much more work.
>> Let's forbid it in the firewall till a proper validation is implemented.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/gpu/host1x/job.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
>> index 190353944d23..1a1568e64ba8 100644
>> --- a/drivers/gpu/host1x/job.c
>> +++ b/drivers/gpu/host1x/job.c
>> @@ -332,6 +332,10 @@ static bool check_reloc(struct host1x_reloc *reloc,
>> struct host1x_bo *cmdbuf,
>>      if (reloc->cmdbuf.bo != cmdbuf || reloc->cmdbuf.offset != offset)
>>          return false;
>>
>> +    /* relocation shift value validation isn't implemented yet */
>> +    if (reloc->shift)
>> +        return false;
>> +
>>      return true;
>>  }
>>
>>


-- 
Dmitry
