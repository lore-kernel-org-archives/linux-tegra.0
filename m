From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 21/22] drm/tegra: Don't use IOMMU on Tegra20
Date: Tue, 30 May 2017 13:08:45 +0300
Message-ID: <66301e1d-3c9c-a32b-7ec2-20cc10bc26eb@gmail.com>
References: <cover.1495498184.git.digetx@gmail.com>
 <fb3b357fbbdf61a20609f38a817c3f45ebc238fc.1495498184.git.digetx@gmail.com>
 <20170530092109.GA2818@8bytes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170530092109.GA2818-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 30.05.2017 12:21, Joerg Roedel wrote:
> On Tue, May 23, 2017 at 03:16:32AM +0300, Dmitry Osipenko wrote:
>> There is no IOMMU on Tegra20, instead a GART would be picked as an IOMMU
>> provider.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/drm.c | 5 ++++-
>>  drivers/gpu/host1x/dev.c    | 5 ++++-
>>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> Not sure what the context here is or if the patches need to merged with
> the rest of the patch-set, so:
> 
> 	Acked-by: Joerg Roedel <jroedel-l3A5Bk7waGM@public.gmane.org>
> 

Probably I would have to add you on the CC to the cover latter, sorry. These two
patches do not depend on the rest of the patchset, I just aggregated all the
patches into a series for ease of managing them for me and maintainers. Thank
you for the ack!

-- 
Dmitry
