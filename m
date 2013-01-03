From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 0/8] Support for Tegra 2D hardware
Date: Thu, 03 Jan 2013 11:31:59 +0800
Message-ID: <50E4FBAF.30700@gmail.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com> <50DD6311.9000002@gmail.com> <50E40106.4020406@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E40106.4020406-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org" <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/02/2013 05:42 PM, Terje Bergstr=F6m wrote:
> On 28.12.2012 11:14, Mark Zhang wrote:
>> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr=
2d.c
>> index a936902..c3ded60 100644
>> --- a/drivers/gpu/drm/tegra/gr2d.c
>> +++ b/drivers/gpu/drm/tegra/gr2d.c
>> @@ -131,6 +131,14 @@ static int gr2d_submit(struct tegra_drm_context
>> *context,
>>                 if (err)
>>                         goto fail;
>>
>> +               /* We define CMA as an temporary solution in host1x =
driver.
>> +                  That's also why we have a CMA kernel config in it=
=2E
>> +                  But seems here, in tegradrm, we hardcode the CMA =
here.
>> +                  So what do you do when host1x change to IOMMU?
>> +                  Do we also need to define a CMA config in tegradr=
m
>> driver,
>> +                  then after host1x changes to IOMMU, we add anothe=
r IOMMU
>> +                  config in tegradrm? Or we should invent another m=
ore
>> +                  generic wrapper layer here? */
>>                 cmdbuf.mem =3D handle_cma_to_host1x(drm, file_priv,
>> cmdbuf.mem);
>=20
> Lucas is working on host1x allocator, so let's defer this comment unt=
il
> we have Lucas' code.
>=20

OK.

>> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
>> index cc8ca2f..0867b72 100644
>> --- a/drivers/gpu/host1x/job.c
>> +++ b/drivers/gpu/host1x/job.c
>> @@ -82,6 +82,26 @@ struct host1x_job *host1x_job_alloc(struct
>> host1x_channel *ch,
>>         mem +=3D num_unpins * sizeof(dma_addr_t);
>>         job->pin_ids =3D num_unpins ? mem : NULL;
>>
>> +       /* I think this is a somewhat ugly design.
>> +          Actually "addr_phys" is consisted by "reloc_addr_phys" an=
d
>> +          "gather_addr_phys".
>> +          Why don't we just declare "reloc_addr_phys" and
>> "gather_addr_phys"?
>> +          In current design, let's say if one nvhost newbie changes=
 the
>> order
>> +          of these 2 blocks of code in function "pin_job_mem":
>> +
>> +          for (i =3D 0; i < job->num_relocs; i++) {
>> +               struct host1x_reloc *reloc =3D &job->relocarray[i];
>> +               job->pin_ids[count] =3D reloc->target;
>> +               count++;
>> +          }
>> +
>> +          for (i =3D 0; i < job->num_gathers; i++) {
>> +               struct host1x_job_gather *g =3D &job->gathers[i];
>> +               job->pin_ids[count] =3D g->mem_id;
>> +               count++;
>> +          }
>> +
>> +          Then likely something weird occurs... */
>=20
> We do this because this way we can implement batch pinning of memory
> handles. This way we can decrease memory handle management a lot as w=
e
> need to do locking only once per submit.
>=20

Sorry I didn't get it. Yes, in current design, you can pin all mem
handles in one time but I haven't found anything related with "locking
only once per submit".

My idea is:
- remove "job->addr_phys"
- assign "job->reloc_addr_phys" & "job->gather_addr_phys" separately
- In "pin_job_mem", just call "host1x_memmgr_pin_array_ids" twice to
fill the "reloc_addr_phy" & "gather_addr_phys".

Anything I misunderstood?

> Decreasing memory management overhead is really important, because in
> complex graphics cases, there are might be a hundreds of buffer
> references per submit, and several submits per frame. Any extra overh=
ead
> relates directly to reduced performance.
>=20
>>         job->reloc_addr_phys =3D job->addr_phys;
>>         job->gather_addr_phys =3D &job->addr_phys[num_relocs];
>>
>> @@ -252,6 +272,10 @@ static int do_relocs(struct host1x_job *job,
>>                         }
>>                 }
>>
>> +               /* I have question here. Does this mean the address =
info
>> +                  which need to be relocated(according to the libdr=
m codes,
>> +                  seems this address is "0xDEADBEEF") always stayin=
g at the
>> +                  beginning of a page? */
>>                 __raw_writel(
>>                         (job->reloc_addr_phys[i] +
>>                                 reloc->target_offset) >> reloc->shif=
t,
>=20
> No - the slot can be anywhere. That's why we have cmdbuf_offset in th=
e
> reloc struct.
>=20

Yes. Sorry I must misread the code before.

>> @@ -565,6 +589,7 @@ int host1x_job_pin(struct host1x_job *job, struc=
t
>> platform_device *pdev)
>>                 }
>>         }
>>
>> +       /* if (host1x_firewall && !err) { */
>>         if (host1x_firewall) {
>>                 err =3D copy_gathers(job, pdev);
>>                 if (err) {
>=20
> Will add.
>=20
>> @@ -573,6 +598,9 @@ int host1x_job_pin(struct host1x_job *job, struc=
t
>> platform_device *pdev)
>>                 }
>>         }
>>
>> +/* Rename this label to "out" or something else.
>> +   Because if everything goes right, the codes under this label als=
o
>> +   get executed. */
>>  fail:
>>         wmb();
>=20
> Will do.
>=20
>>
>> diff --git a/drivers/gpu/host1x/memmgr.c b/drivers/gpu/host1x/memmgr=
=2Ec
>> index f3954f7..bb5763d 100644
>> --- a/drivers/gpu/host1x/memmgr.c
>> +++ b/drivers/gpu/host1x/memmgr.c
>> @@ -156,6 +156,9 @@ int host1x_memmgr_pin_array_ids(struct
>> platform_device *dev,
>>                         count, &unpin_data[pin_count],
>>                         phys_addr);
>>
>> +               /* I don't think the current "host1x_cma_pin_array_i=
ds"
>> +                  is able to return a negative value. So this "if" =
doesn't
>> +                  make sense...*/
>>                 if (cma_count < 0) {
>>                         /* clean up previous handles */
>>                         while (pin_count) {
>=20
> It should return negative in case of error.
>=20

"host1x_cma_pin_array_ids" doesn't return negative value right now, so
maybe you need to take a look at it.

> Terje
>=20
