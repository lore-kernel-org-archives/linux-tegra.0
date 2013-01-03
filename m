From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 0/8] Support for Tegra 2D hardware
Date: Thu, 03 Jan 2013 13:55:43 +0800
Message-ID: <50E51D5F.6090009@gmail.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com> <50DD6311.9000002@gmail.com> <50E40106.4020406@nvidia.com> <50E4FBAF.30700@gmail.com> <50E51C08.1020603@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E51C08.1020603-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org" <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/03/2013 01:50 PM, Terje Bergstr=F6m wrote:
> On 03.01.2013 05:31, Mark Zhang wrote:
>> Sorry I didn't get it. Yes, in current design, you can pin all mem
>> handles in one time but I haven't found anything related with "locki=
ng
>> only once per submit".
>>
>> My idea is:
>> - remove "job->addr_phys"
>> - assign "job->reloc_addr_phys" & "job->gather_addr_phys" separately
>> - In "pin_job_mem", just call "host1x_memmgr_pin_array_ids" twice to
>> fill the "reloc_addr_phy" & "gather_addr_phys".
>>
>> Anything I misunderstood?
>=20
> The current design uses CMA, which makes pinning basically a no-op. W=
hen
> we have IOMMU support, pinning requires calling into IOMMU. Updating
> SMMU tables requires locking, and probably maintenance before SMMU co=
de
> also requires its own locked data tables. For example, preventing
> duplicate pinning might require a global table of handles.
>=20
> Putting all of the handles in one table allows doing duplicate detect=
ion
> across cmdbuf and reloc tables. This allows pinning each buffer exact=
ly
> once, which reduces number of calls to IOMMU.
>=20

Thanks Terje. Yes, I understand IOMMU will bring in more operations. Bu=
t
I'm not convinced that separating 2 arrays have lots of overheads than
putting them into one array.

But it doesn't matter, after the IOMMU support version released, I can
read this part of codes again. Let's talk about this at that time.

>> "host1x_cma_pin_array_ids" doesn't return negative value right now, =
so
>> maybe you need to take a look at it.
>=20
> True, and also a consequence of using CMA: pinning can never fail. Wi=
th
> IOMMU, pinning can fail.

Got it. Agree.

>=20
> Terje
>=20
