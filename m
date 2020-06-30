From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Date: Tue, 30 Jun 2020 16:17:44 +0100
Message-ID: <a9d6b11b-d904-153a-6363-6e3a8f62e03f@nvidia.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-2-vdumpa@nvidia.com>
 <53bfa5c8-c32d-6fa3-df60-a18ab33ca1c2@nvidia.com>
 <d59b7220-168c-419f-db16-194307e11065@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d59b7220-168c-419f-db16-194307e11065-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 30/06/2020 15:53, Robin Murphy wrote:
> On 2020-06-30 09:19, Jon Hunter wrote:
>>
>> On 30/06/2020 01:10, Krishna Reddy wrote:
>>> NVIDIA's Tegra194 SoC uses two ARM MMU-500s together to interleave
>>> IOVA accesses across them.
>>> Add NVIDIA implementation for dual ARM MMU-500s and add new compatible
>>> string for Tegra194 SoC SMMU topology.
>>
>> There is no description here of the 3rd SMMU that you mention below.
>> I think that we should describe the full picture here.
>> =C2=A0
>>> Signed-off-by: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

...

>>> +static void nvidia_smmu_tlb_sync(struct arm_smmu_device *smmu, int
>>> page,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 int sync, int status)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 unsigned int delay;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 arm_smmu_writel(smmu, page, sync, 0);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 for (delay =3D 1; delay < TLB_LOOP_TIMEOUT_IN_US; d=
elay *=3D 2) {
>>
>> So we are doubling the delay every time? Is this better than just using
>> the same on each loop?
>=20
> This is the same logic as the main driver (see 8513c8930069) - the sync
> is expected to complete relatively quickly, hence why we have the inner
> spin loop to avoid the delay entirely in the typical case, and the
> longer it's taking, the more likely it is that something's wrong and it
> will never complete anyway. Realistically, a heavily loaded SMMU at a
> modest clock rate might take us through a couple of iterations of the
> outer loop, but beyond that we're pretty much just killing time until we
> declare it wedged and give up, and by then there's not much point in
> burning power frantically hamering on the interconnect.

Ah OK. Then maybe we should move the definitions for TLB_LOOP_TIMEOUT
and TLB_SPIN_COUNT into the arm-smmu.h so that we can use them directly
in this file instead of redefining them. Then it maybe clear that these
are part of the main driver.

 >>> +struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device
>>> *smmu)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>>> +=C2=A0=C2=A0=C2=A0 struct nvidia_smmu *nvidia_smmu;
>>> +=C2=A0=C2=A0=C2=A0 struct platform_device *pdev =3D to_platform_device=
(smmu->dev);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 nvidia_smmu =3D devm_kzalloc(smmu->dev, sizeof(*nvi=
dia_smmu),
>>> GFP_KERNEL);
>>> +=C2=A0=C2=A0=C2=A0 if (!nvidia_smmu)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(-ENOMEM);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 nvidia_smmu->smmu =3D *smmu;
>>> +=C2=A0=C2=A0=C2=A0 /* Instance 0 is ioremapped by arm-smmu.c after thi=
s function
>>> returns */
>>> +=C2=A0=C2=A0=C2=A0 nvidia_smmu->num_inst =3D 1;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 1; i < MAX_SMMU_INSTANCES; i++) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct resource *res;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res =3D platform_get_resour=
ce(pdev, IORESOURCE_MEM, i);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!res)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvidia_smmu->bases[i] =3D d=
evm_ioremap_resource(smmu->dev, res);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(nvidia_smmu->bas=
es[i]))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ERR_CAST(nvidia_smmu->bases[i]);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvidia_smmu->num_inst++;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 nvidia_smmu->smmu.impl =3D &nvidia_smmu_impl;
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Free the arm_smmu_device struct allocated i=
n arm-smmu.c.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Once this function returns, arm-smmu.c woul=
d use arm_smmu_device
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * allocated as part of nvidia_smmu struct.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 devm_kfree(smmu->dev, smmu);
>>
>> Why don't we just store the pointer of the smmu struct passed to this
>> function
>> in the nvidia_smmu struct and then we do not need to free this here.
>> In other
>> words make ...
>>
>> =C2=A0 struct nvidia_smmu {
>> =C2=A0=C2=A0=C2=A0=C2=A0struct arm_smmu_device=C2=A0=C2=A0=C2=A0 *smmu;
>> =C2=A0=C2=A0=C2=A0=C2=A0unsigned int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 num_inst;
>> =C2=A0=C2=A0=C2=A0=C2=A0void __iomem=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 *bases[MAX_SMMU_INSTANCES];
>> =C2=A0 };
>>
>> This seems more appropriate, than copying the struct and freeing memory
>> allocated else-where.
>=20
> But then how do you get back to struct nvidia_smmu given just a pointer
> to struct arm_smmu_device?

Ah yes of course that is what I was missing. I wondered what was going
on here. So I think we should add a nice comment in the above function
of why we are copying this and cannot simply store the pointer.

Cheers
Jon

--=20
nvpublic
