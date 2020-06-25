From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v6 1/4] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Date: Thu, 25 Jun 2020 23:13:24 +0000
Message-ID: <BYAPR12MB2822B1D5791811EDAF35C5B2B3920@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
 <20200604234414.21912-2-vdumpa@nvidia.com> <20200623102927.GD4098287@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200623102927.GD4098287@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org" <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "robin.murphy-5wv7dgnIgG8@public.gmane.org" <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

>Should NVIDIA_TEGRA194_SMMU be a separate value for smmu->model, perhaps? =
That way we avoid this somewhat odd check here.

NVIDIA haven't made any changes to arm,mmu-500. It is only used in differen=
t topology.  New model would be mis-leading here.
As suggested by Robin, It can just be moved to end of function.

>> diff --git a/drivers/iommu/arm-smmu-nvidia.c=20
>> b/drivers/iommu/arm-smmu-nvidia.c
>I wonder if it would be better to name this arm-smmu-tegra.c to make it cl=
earer that this is for a Tegra chip. We do have regular expressions in MAIN=
TAINERS that catch anything with "tegra" in it to make this easier.
>Also, the nsmmu_ prefix looks somewhat odd here. You already use struct nv=
idia_smmu as the name of the structure, so why not be consistent and contin=
ue to use nvidia_smmu_ as the prefix for function names?
>Or perhaps even use tegra_smmu_ as the prefix to match the filename change=
 I suggested earlier.

Prefix can be updated to nvidia_smmu as we seem to be okay for now to keep =
file name as arm-smmu-nvidia.c after the vendor name. =20

>> +#define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
>USEC_PER_SEC?

It is not meant for a conversion. Reused Timeout variable from arm-smmu.c f=
or tlb_sync implementation.  Can rename it to TLB_LOOP_TIMEOUT_IN_US.


>> +	}
>> +	dev_err_ratelimited(smmu->dev,
>> +			    "TLB sync timed out -- SMMU may be deadlocked\n");
>Same here.
>Also, is there anything we can do when this happens?

This is never expected to happen on Silicon. This code and message is reuse=
d from arm-smmu.c.


>> +#define nsmmu_page(smmu, inst, page) \
>> +	(((inst) ? to_nvidia_smmu(smmu)->bases[(inst)] : smmu->base) + \
>> +	((page) << smmu->pgshift))

>Can we simply define to_nvidia_smmu(smmu)->bases[0] =3D smmu->base in nvid=
ia_smmu_impl_init()? Then this would become just:
>	to_nvidia_smmu(smmu)->bases[inst] + ((page) << (smmu)->pgshift)
> +
>Maybe add this here to simplify the nsmmu_page() macro above:
>	nsmmu->bases[0] =3D smmu->base;

This preferred to avoid the check in nsmmu_page(). But, smmu->base is not y=
et populated when nvidia_smmu_impl_init() is called. =20
Let me look at the alternative place to set it.

-KR
