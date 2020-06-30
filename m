From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 3/3] iommu/arm-smmu: Add global/context fault
 implementation hooks
Date: Tue, 30 Jun 2020 13:42:52 +0100
Message-ID: <fd1f1102-ab05-002a-a86a-d3c6cef21e01@nvidia.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-4-vdumpa@nvidia.com>
 <4b4b20af-7baa-0987-e40d-af74235153f6@nvidia.com>
 <6c2ce909-c71b-351f-79f5-b1a4b4c0e4ac@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6c2ce909-c71b-351f-79f5-b1a4b4c0e4ac-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 30/06/2020 13:13, Robin Murphy wrote:
> On 2020-06-30 09:37, Jon Hunter wrote:
>>
>> On 30/06/2020 01:10, Krishna Reddy wrote:
>>> Add global/context fault hooks to allow NVIDIA SMMU implementation
>>> handle faults across multiple SMMUs.
>>
>> Nit ... this is not just for NVIDIA, but this allows anyone to add
>> custom global/context and fault hooks. So I think that the changelog
>> should be clear that this change permits custom fault hooks and that
>> custom fault hooks are needed for the Tegra194 SMMU. You may also want
>> to say why.
>>
>>>
>>> Signed-off-by: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>> =C2=A0 drivers/iommu/arm-smmu-nvidia.c | 98 +++++++++++++++++++++++++++=
++++++
>>> =C2=A0 drivers/iommu/arm-smmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 17 +++++-
>>> =C2=A0 drivers/iommu/arm-smmu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 +
>>> =C2=A0 3 files changed, 116 insertions(+), 2 deletions(-)

...

>>> @@ -835,7 +836,13 @@ static int arm_smmu_init_domain_context(struct
>>> iommu_domain *domain,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * handler seeing a half-initialise=
d domain state.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq =3D smmu->irqs[smmu->num_global_irqs=
 + cfg->irptndx];
>>> -=C2=A0=C2=A0=C2=A0 ret =3D devm_request_irq(smmu->dev, irq, arm_smmu_c=
ontext_fault,
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (smmu->impl && smmu->impl->context_fault)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 context_fault =3D smmu->imp=
l->context_fault;
>>> +=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 context_fault =3D arm_smmu_=
context_fault;
>>
>> Why not see the default smmu->impl->context_fault to
>> arm_smmu_context_fault in arm_smmu_impl_init() and then allow the
>> various implementations to override as necessary? Then you can get rid
>> of this context_fault variable here and just use
>> smmu->impl->context_fault below.
>=20
> Because the default smmu->impl is NULL. And as I've said before, NAK to
> forcing the common case to allocate a set of "quirks" purely to override
> the default IRQ handler with the default IRQ handler ;)


Ah OK, makes sense. Sorry I am a bit late to the review :-)

Jon

--=20
nvpublic
