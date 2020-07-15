From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] usb: tegra: Fix zero length memory allocation
Date: Wed, 15 Jul 2020 09:43:42 +0100
Message-ID: <9c8ddf99-40fb-547f-81a9-05f0c64c9a5f@nvidia.com>
References: <20200712102837.24340-1-jonathanh@nvidia.com>
 <20200712102837.24340-2-jonathanh@nvidia.com> <20200714093256.GG141356@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200714093256.GG141356@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 14/07/2020 10:32, Thierry Reding wrote:
> On Sun, Jul 12, 2020 at 11:28:37AM +0100, Jon Hunter wrote:
>> After commit cad064f1bd52 ("devres: handle zero size in devm_kmalloc()")
>> was added system suspend started failing on Tegra186. The kernel log
>> showed that the Tegra XHCI driver was crashing on entry to suspend when
>> attemptin the save the USB context. The problem is caused because we
>> are trying to allocate a zero length array for the IPFS context on
>> Tegra186 and following commit cad064f1bd52 ("devres: handle zero size
>> in devm_kmalloc()") this now causes a NULL pointer deference crash
>> when we try to access the memory. Fix this by only allocating memory
>> for both the IPFS and FPCI contexts when required.
>>
>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>
>> Fixes: 5c4e8d3781bc ("usb: host: xhci-tegra: Add support for XUSB context save/restore")
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/usb/host/xhci-tegra.c | 22 ++++++++++++++--------
>>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> Actually it would seem to me that this is no longer a bug after your fix
> in patch 1. We only ever access tegra->context.ipfs if
> tegra->soc->ipfs.num_offsets > 0, so the special ZERO_SIZE_PTR case will
> not actually cause an issue anymore.
> 
> The reason why this was crashing was because tegra->context.fpci was
> allocated with a zero size (because of the bug that you fixed in patch
> 1) and then that zero-size pointer was dereferenced because the code was
> correctly checking for tegra->soc->fpci.num_offsets > 0 in the context
> save and restore.
> 
> So I don't think there's a bug here. It's not wrong to allocate a zero-
> size buffer. It's only a bug to then go and dereference it. Are you
> still seeing the issue if you leave out this patch and only apply patch
> 1?

Ah yes you are right. OK, we can drop this. I will update the commit
message to patch 1/1.

Jon

-- 
nvpublic
