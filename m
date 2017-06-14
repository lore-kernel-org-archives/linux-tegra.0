From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 09/22] drm/tegra: Don't use IOMMU on Tegra20
Date: Wed, 14 Jun 2017 13:22:46 +0300
Message-ID: <16be88ba-808d-4d3e-533b-7dce4a2765e7@gmail.com>
References: <cover.1497394243.git.digetx@gmail.com>
 <d707bd34e268f9d8fb29bf510a9f17e5f943a635.1497394243.git.digetx@gmail.com>
 <CABPQNSbMQMrahcvWnczywLDYVU0=Ns=FB6Yseisk-5L_8Y=rpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABPQNSbMQMrahcvWnczywLDYVU0=Ns=FB6Yseisk-5L_8Y=rpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14.06.2017 10:39, Erik Faye-Lund wrote:
> On Wed, Jun 14, 2017 at 1:15 AM, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> There is no IOMMU on Tegra20, instead a GART would be picked as an IOMMU
>> provider.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Acked-by: Joerg Roedel <jroedel-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/drm.c | 3 ++-
>>  drivers/gpu/host1x/dev.c    | 3 ++-
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index e999391aedc9..aa7988dcc28f 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -131,7 +131,8 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
>>         if (!tegra)
>>                 return -ENOMEM;
>>
>> -       if (iommu_present(&platform_bus_type)) {
>> +       if (iommu_present(&platform_bus_type) &&
>> +           !of_machine_is_compatible("nvidia,tegra20")) {
>>                 u64 carveout_start, carveout_end, gem_start, gem_end;
>>                 struct iommu_domain_geometry *geometry;
>>                 unsigned long order;
>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>> index f05ebb14fa63..6a805ed908c3 100644
>> --- a/drivers/gpu/host1x/dev.c
>> +++ b/drivers/gpu/host1x/dev.c
>> @@ -177,7 +177,8 @@ static int host1x_probe(struct platform_device *pdev)
>>                 return err;
>>         }
>>
>> -       if (iommu_present(&platform_bus_type)) {
>> +       if (iommu_present(&platform_bus_type) &&
>> +           !of_machine_is_compatible("nvidia,tegra20")) {
>>                 struct iommu_domain_geometry *geometry;
>>                 unsigned long order;
>>
> 
> This doesn't feel great... The commit message says there's no IOMMU,
> but iommu_present says otherwise. I know there's some more subtleties
> here, and the commit message does hint at this. But...
> 
> If we don't want to treat the GART as an IOMMU, shouldn't we somehow
> make sure iommu_present() doesn't return true in these cases (or
> perhaps make something like tegra_use_iommu(), with a comment
> explaining why we don't want to allow the GART to be treated like a
> proper IOMMU)? These seems to be the only Tegra-specific calls to
> iommu_present()...
> 
> That being said, the patch seems to have the right effect...
> 

We don't want to treat the GART as an IOMMU right now, but I'd want to change
that in the (near?) future, so it's a kinda trivial preparation patch that
restores the GART driver and these of_machine_is_compatible() are supposed to go
away later. Probably I should mention this in the commit message(?).

I think we can add a Tegra20 specific IOCTL for an allocation of GART-able
memory and use it for a stuff like opentegra's EXA, its fallback allocations
migration is a pita and reserved CMA is never enough =)

-- 
Dmitry
