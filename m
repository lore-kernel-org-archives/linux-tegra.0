From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Check offsets of a submitted command buffer
 and of relocations
Date: Tue, 16 May 2017 11:11:08 +0300
Message-ID: <1f413795-50a5-23f5-521c-9eb5f0230ac2@gmail.com>
References: <20170514204734.22130-1-digetx@gmail.com>
 <20170514204734.22130-3-digetx@gmail.com>
 <3db57134-4dba-e886-059c-96034192f637@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3db57134-4dba-e886-059c-96034192f637-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 16.05.2017 09:56, Mikko Perttunen wrote:
> On 14.05.2017 23:47, Dmitry Osipenko wrote:
>> +        if (reloc->cmdbuf.offset & 3 ||
>> +            reloc->cmdbuf.offset > obj->gem.size) {
> 
> This could still fail if the bo's size is not divisible by 4, even with >=
> comparison (we would overwrite the buffer by 1 to 3 bytes). I would do the same
> as in the gather case, i.e. find out the address immediately after the write and
> compare using >. Perhaps add a helper function if it makes sense. I also don't
> think the "& 3" checks are needed.
> 
Sorry, I forgot to mention the reason of the relocations cmdbuf offset alignment
requirement in the commit description. So the reason is that during the patching
of the gather in do_relocs(), the unaligned offset would cause a partial
overwrite of the command buffer word following the relocation and only a part of
the relocation address being written to the actual address word.
